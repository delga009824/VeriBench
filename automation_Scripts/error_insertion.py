import os
import re
import random
import argparse

########################################
# Syntactic Error Injection Functions
########################################

def inject_premature_termination(content):
    """
    Example approach: remove or add a semicolon/comma in a critical place
    (like a module port list) to break syntax.
    """
    # Look for a module declaration with parentheses: module A(input a, output b);
    pattern = r'(module\s+\w+\s*\(.*?\)\s*;)'  # naive
    matches = list(re.finditer(pattern, content, flags=re.DOTALL))
    if not matches:
        return content
    
    chosen = random.choice(matches)
    module_decl = chosen.group(1)
    
    # 50% chance: remove a semicolon
    if random.random() < 0.5:
        new_decl = module_decl.replace(';', '')  # remove the semicolon
    else:
        # Or remove a comma in the port list, e.g. (input a, output b) -> (input a output b)
        new_decl = re.sub(r',', '', module_decl, count=1)
    
    return content.replace(module_decl, new_decl, 1)


def inject_undefined_variable(content):
    """
    Insert a reference to an undeclared variable in an assign statement or always block.
    """
    # We'll look for an assign statement to corrupt:
    pattern = r'(assign\s+\w+\s*=\s*[^;]+;)'
    matches = list(re.finditer(pattern, content))
    if not matches:
        # If none found, just append an undefined reference
        return content + "\nassign result = temp_undefined; // Injected undefined variable\n"
    
    chosen = random.choice(matches)
    original = chosen.group(1)
    # Replace the right-hand side with an undefined variable
    new_assign = re.sub(r'=\s*[^;]+;', '= temp_undefined;', original)
    return content.replace(original, new_assign, 1)


def inject_operator_misuse(content):
    """
    Replace a comparison operator with a bitwise operator, or vice versa.
    E.g., if(a > b) -> if(a & b)
    """
    pattern = r'(if\s*\([^()]*?\))'
    matches = list(re.finditer(pattern, content))
    if not matches:
        return content
    
    chosen = random.choice(matches)
    if_block = chosen.group(1)  # e.g. "if(a > b)"
    
    # Common comparison operators: >, <, ==, !=
    # Common bitwise/logical ops that would break usage: &, |, ^
    # We'll do a simple swap if we find a recognized comparison operator
    # Otherwise, do nothing
    compare_ops = [">=", "<=", "==", "!=", ">", "<"]
    bitwise_ops = ["&", "|", "^"]
    
    for op in compare_ops:
        if op in if_block:
            new_op = random.choice(bitwise_ops)
            new_if_block = if_block.replace(op, new_op, 1)
            return content.replace(if_block, new_if_block, 1)
    
    # If no recognized comparison found, try a single '>' or '<'
    # e.g. if(a > b)
    match_single = re.search(r'(>|<)', if_block)
    if match_single:
        op = match_single.group(1)
        new_op = random.choice(bitwise_ops)
        new_if_block = if_block.replace(op, new_op, 1)
        return content.replace(if_block, new_if_block, 1)
    
    return content


def inject_redundant_variable_declaration(content):
    """
    Duplicate an existing declaration, e.g. 'reg a;' => 'reg a; reg a;'
    """
    # Find a line that declares reg or wire
    pattern = r'((?:reg|wire)\s+[^;]+;)'
    matches = list(re.finditer(pattern, content))
    if not matches:
        return content
    
    chosen = random.choice(matches)
    decl_line = chosen.group(1)
    
    # Insert a duplicate of this line right after
    insertion = decl_line + " // Redundant declaration\n"
    new_content = content.replace(decl_line, decl_line + "\n" + insertion, 1)
    return new_content


def inject_incorrect_encoding(content):
    """
    Introduce a non-ASCII or invalid numeric literal. For instance,
    replace 'h' with a weird symbol or insert a special character.
    """
    # Look for something like 8'hFF, 4'b1010, etc.
    pattern = r'(\d+\'[hbdo][0-9A-Fa-f_]+)'
    matches = list(re.finditer(pattern, content))
    if not matches:
        # If none found, just insert a weird character somewhere
        pos = random.randint(0, len(content))
        return content[:pos] + "µ" + content[pos:]  # micro symbol as a random non-ASCII char
    
    chosen = random.choice(matches)
    literal = chosen.group(1)
    
    # Corrupt the base letter
    # e.g. 8'hFF -> 8'xFF or 8'µFF
    corruption = random.choice(["x", "µ", "??"])  # some invalid base
    # We'll replace the single character after the quote
    new_literal = re.sub(r'\'[hbdo]', f"'{corruption}", literal, 1)
    return content.replace(literal, new_literal, 1)


def inject_incorrect_data_type_assignment(content):
    """
    Flip a reg to wire or wire to reg in a random declaration line.
    """
    pattern = r'\b(reg|wire)\b'
    matches = list(re.finditer(pattern, content))
    if not matches:
        return content
    
    chosen = random.choice(matches)
    original = chosen.group(1)
    if original == "reg":
        replacement = "wire"
    else:
        replacement = "reg"
    
    start, end = chosen.span(1)
    return content[:start] + replacement + content[end:]


def inject_port_mode_declaration_error(content):
    """
    Flip input <-> output in a module's port declaration or just random lines.
    """
    pattern = r'\b(input|output)\b'
    matches = list(re.finditer(pattern, content))
    if not matches:
        return content
    
    chosen = random.choice(matches)
    original = chosen.group(1)
    if original == "input":
        replacement = "output"
    else:
        replacement = "input"
    
    start, end = chosen.span(1)
    return content[:start] + replacement + content[end:]


def inject_data_index_out_of_bounds(content):
    """
    For a declared bus, e.g. [3:0], inject usage like bus[5].
    """
    pattern = r'(\w+)\s*\[\s*(\d+)\s*:\s*(\d+)\s*\]'
    matches = list(re.finditer(pattern, content))
    if not matches:
        return content
    
    chosen = random.choice(matches)
    var_name = chosen.group(1)
    high = int(chosen.group(2))
    # We'll assign to var_name[high+1]
    injection = f"\nassign {var_name}[{high+1}] = 1'b0; // Out-of-bounds\n"
    return content + injection


def inject_improper_use_of_keywords(content):
    """
    Rename a random user-defined identifier to a reserved keyword (e.g. 'always').
    """
    reserved = {
        "always","if","end","case","module","endmodule",
        "wire","reg","begin","for","while","assign",
        "input","output","inout","endcase","function","endfunction",
        "generate","endgenerate"
    }
    # Very naive approach: find a random token that isn't reserved and rename it
    pattern = r'\b([A-Za-z_]\w*)\b'
    candidates = []
    for m in re.finditer(pattern, content):
        token = m.group(1)
        if token not in reserved:
            candidates.append(token)
    if not candidates:
        return content
    
    chosen_identifier = random.choice(candidates)
    new_keyword = random.choice(list(reserved))
    
    # Replace the chosen identifier with the reserved keyword once
    return re.sub(r'\b' + chosen_identifier + r'\b', new_keyword, content, count=1)

def inject_missing_or_extra_colon_in_case_item(content):
    """
    Either remove or add a colon in a 'case' item.
    We look for patterns like '4'b0000:' or 'default:' and then disrupt them.
    """
    pattern = r'(\bcase\b.*?\bendcase\b)'  # We'll locate a case block
    blocks = list(re.finditer(pattern, content, flags=re.DOTALL))
    if not blocks:
        return content
    
    # Choose one case block
    chosen_block_match = random.choice(blocks)
    case_block = chosen_block_match.group(1)
    
    # Find case item lines that end with a colon
    item_pattern = r'([^\n]+:)'
    items = list(re.finditer(item_pattern, case_block))
    if not items:
        return content
    
    chosen_item = random.choice(items)
    item_line = chosen_item.group(1)
    
    if random.random() < 0.5:
        # Remove the colon
        new_item_line = item_line.replace(':', '', 1)
    else:
        # Add an extra colon
        # For example, if item_line is "4'b0000:", it becomes "4'b0000::"
        new_item_line = item_line + ":"
    
    new_case_block = case_block.replace(item_line, new_item_line, 1)
    return content.replace(case_block, new_case_block, 1)


def inject_malformed_timescale_directive(content):
    """
    Break a `timescale directive by removing the slash or backtick, or corrupting the units.
    We look for a pattern like: `timescale 1ns/1ps
    """
    pattern = r'(`timescale\s+)(\d+\w+)(/)(\d+\w+)'
    matches = list(re.finditer(pattern, content))
    if not matches:
        return content
    
    chosen = random.choice(matches)
    full_match = chosen.group(0)
    
    # Corrupt the timescale in one of several ways
    corruption_mode = random.choice(["remove_slash", "remove_backtick", "garble_units"])
    
    if corruption_mode == "remove_slash":
        # E.g. `timescale 1ns1ps
        new_directive = chosen.group(1) + chosen.group(2) + chosen.group(4)
    elif corruption_mode == "remove_backtick":
        # E.g. timescale 1ns/1ps
        new_directive = chosen.group(1).replace('`', '') + chosen.group(2) + chosen.group(3) + chosen.group(4)
    else:
        # Garble units
        # E.g. `timescale 1nX/1pY
        new_directive = chosen.group(1) + chosen.group(2).replace('ns', 'nX') \
                        + chosen.group(3) + chosen.group(4).replace('ps', 'pY')
    
    return content.replace(full_match, new_directive, 1)


def inject_unclosed_block_comment(content):
    """
    Insert a block comment opener '/*' without a matching '*/', or remove the closing '*/'.
    """
    # 50% chance to insert an unclosed comment
    if random.random() < 0.5:
        pos = random.randint(0, len(content))
        insertion = "/* Unclosed block comment injection\n"
        return content[:pos] + insertion + content[pos:]
    else:
        # Attempt to find an existing block comment and remove its closing '*/'
        pattern = r'/\*.*?\*/'
        matches = list(re.finditer(pattern, content, flags=re.DOTALL))
        if not matches:
            return content
        chosen = random.choice(matches)
        comment_block = chosen.group(0)
        # Remove '*/'
        new_comment = comment_block.replace('*/', '')
        return content.replace(comment_block, new_comment, 1)


def inject_missing_or_extra_quote_in_string_literals(content):
    """
    Find a string literal and either remove one quote or add an extra quote.
    """
    # Simple pattern to find double-quoted strings: "..."
    pattern = r'\".*?\"'
    matches = list(re.finditer(pattern, content))
    if not matches:
        return content
    
    chosen = random.choice(matches)
    string_literal = chosen.group(0)
    
    if random.random() < 0.5:
        # Remove one quote
        if len(string_literal) > 2:
            # Remove either the first or the last quote
            if random.random() < 0.5:
                # remove the opening quote
                new_string = string_literal[1:]
            else:
                # remove the closing quote
                new_string = string_literal[:-1]
        else:
            # If string_literal is just "?", can't do much
            new_string = string_literal
    else:
        # Add an extra quote somewhere inside
        insert_pos = random.randint(1, len(string_literal) - 1)
        new_string = string_literal[:insert_pos] + '"' + string_literal[insert_pos:]
    
    return content.replace(string_literal, new_string, 1)


def inject_missing_or_extra_backtick_in_preprocessor_directives(content):
    """
    Remove or add a backtick in a random preprocessor directive like `ifdef, `define, etc.
    """
    pattern = r'(\`(ifdef|ifndef|define|undef|include|timescale|elsif|endif))'
    matches = list(re.finditer(pattern, content))
    if not matches:
        return content
    
    chosen = random.choice(matches)
    directive_full = chosen.group(1)
    
    if random.random() < 0.5:
        # Remove the backtick
        new_directive = directive_full.replace('`', '')
    else:
        # Insert an extra backtick
        new_directive = '`' + directive_full
    return content.replace(directive_full, new_directive, 1)


def inject_incomplete_or_extra_array_brackets(content):
    """
    Either remove one bracket from an array declaration or add an extra bracket.
    Example: reg [7:0] -> reg 7:0] or reg [[7:0]
    """
    # Find array declarations: something like [7:0]
    pattern = r'\[\s*\d+\s*:\s*\d+\s*\]'
    matches = list(re.finditer(pattern, content))
    if not matches:
        return content
    
    chosen = random.choice(matches)
    brackets = chosen.group(0)
    
    if random.random() < 0.5:
        # Remove one bracket
        # E.g. [7:0] -> 7:0]
        # or [7:0] -> [7:0
        if random.random() < 0.5:
            new_brackets = brackets[1:]  # remove first bracket
        else:
            new_brackets = brackets[:-1]  # remove last bracket
    else:
        # Add an extra bracket
        insert_pos = random.randint(0, len(brackets))
        new_brackets = brackets[:insert_pos] + '[' + brackets[insert_pos:]
    
    return content.replace(brackets, new_brackets, 1)


def inject_malformed_generate_statement(content):
    """
    Insert or remove part of a generate/endgenerate pair, or break the for-generate syntax.
    """
    # We'll look for 'generate' or 'endgenerate' blocks
    pattern = r'(generate\b.*?\bendgenerate\b)'
    matches = list(re.finditer(pattern, content, flags=re.DOTALL))
    if not matches:
        # If no generate block, randomly insert one with missing parts
        if random.random() < 0.5:
            # Insert just 'generate' without 'endgenerate'
            pos = random.randint(0, len(content))
            insertion = "\ngenerate // Missing endgenerate\n"
            return content[:pos] + insertion + content[pos:]
        else:
            # Insert 'endgenerate' alone
            pos = random.randint(0, len(content))
            insertion = "\nendgenerate // Extra endgenerate\n"
            return content[:pos] + insertion + content[pos:]
    else:
        chosen = random.choice(matches)
        block = chosen.group(1)
        if random.random() < 0.5:
            # Remove 'generate'
            new_block = block.replace('generate', '', 1)
        else:
            # Remove 'endgenerate'
            new_block = block.replace('endgenerate', '', 1)
        return content.replace(block, new_block, 1)


def inject_missing_or_extra_comma_in_port_or_sensitivity_list(content):
    """
    In module port lists or always sensitivity lists, remove or add a comma.
    """
    # Very naive approach: look for parentheses containing multiple comma-separated items
    pattern = r'\(([^)]*,[^)]*)\)'  # parentheses that definitely have at least one comma
    matches = list(re.finditer(pattern, content))
    if not matches:
        return content
    
    chosen = random.choice(matches)
    full_match = chosen.group(0)
    inside = chosen.group(1)
    
    # Decide to remove or add
    if random.random() < 0.5:
        # Remove one comma
        commas = [m.start() for m in re.finditer(r',', inside)]
        if commas:
            c = random.choice(commas)
            new_inside = inside[:c] + inside[c+1:]
            new_paren = '(' + new_inside + ')'
            return content.replace(full_match, new_paren, 1)
    else:
        # Insert an extra comma
        pos = random.randint(0, len(inside))
        new_inside = inside[:pos] + ',' + inside[pos:]
        new_paren = '(' + new_inside + ')'
        return content.replace(full_match, new_paren, 1)
    
    return content


def inject_unclosed_string_in_system_task(content):
    """
    For example, find a $display or $monitor call and remove its closing quote.
    """
    pattern = r'(\$(display|monitor)\s*\(".*?\))'
    # This looks for $display("... ) but doesn't require the trailing quote.
    # It's naive but might find something we can break.
    matches = list(re.finditer(pattern, content))
    if not matches:
        return content
    
    chosen = random.choice(matches)
    full_match = chosen.group(1)
    
    # If there's a trailing quote, remove it
    # e.g., $display("Hello")
    # We'll just forcibly remove the last quote if it exists
    new_text = full_match.replace('"', '', 1)  # remove first quote we find
    return content.replace(full_match, new_text, 1)


def inject_malformed_macro_definition(content):
    """
    For a line like `define MACRO(...) something`, remove parentheses or backticks, or scramble.
    """
    pattern = r'(\`define\s+(\w+)(\(.*?\))?\s+.*)'
    matches = list(re.finditer(pattern, content))
    if not matches:
        return content
    
    chosen = random.choice(matches)
    full_line = chosen.group(1)
    
    # We'll choose a random corruption
    mode = random.choice(["remove_backtick", "remove_parentheses", "scramble_name"])
    
    if mode == "remove_backtick":
        # e.g. `define MACRO -> define MACRO
        new_line = full_line.replace('`', '', 1)
    elif mode == "remove_parentheses":
        # if there's a parameter list like (arg), remove it
        paren_pattern = r'\(.*?\)'
        new_line = re.sub(paren_pattern, '', full_line, count=1)
    else:
        # scramble the macro name
        macro_name = chosen.group(2)
        if macro_name:
            scrambled = macro_name + "_BROKEN"
            new_line = full_line.replace(macro_name, scrambled, 1)
        else:
            new_line = full_line
    
    return content.replace(full_line, new_line, 1)

def inject_missing_semicolon(content):
    """
    Removes one semicolon at random from the file.
    This often leads to a direct syntax error in Verilog.
    """
    semicolons = [m.start() for m in re.finditer(r';', content)]
    if not semicolons:
        return content  # No semicolon to remove
    chosen = random.choice(semicolons)
    # Remove the chosen semicolon
    return content[:chosen] + content[chosen+1:]


def inject_mismatched_parentheses(content):
    """
    Either remove one parenthesis or insert an extra one at a random position.
    This generally breaks compilation.
    """
    if random.random() < 0.5:
        # Remove a parenthesis
        paren_positions = [m.start() for m in re.finditer(r'[()]', content)]
        if paren_positions:
            chosen = random.choice(paren_positions)
            return content[:chosen] + content[chosen+1:]
    else:
        # Add an extra parenthesis
        pos = random.randint(0, len(content))
        paren = random.choice(['(', ')'])
        return content[:pos] + paren + content[pos:]
    return content


def inject_missing_or_extra_endmodule(content):
    """
    Either remove one 'endmodule' or insert an extra one,
    which typically causes a parsing error.
    """
    # 50% chance to remove an existing endmodule
    if random.random() < 0.5:
        pattern = r'\bendmodule\b'
        matches = list(re.finditer(pattern, content))
        if matches:
            chosen = random.choice(matches)
            return content[:chosen.start()] + content[chosen.end():]
    else:
        # Insert an extra 'endmodule' at a random position
        pos = random.randint(0, len(content))
        insertion = "\nendmodule // Extra inserted\n"
        return content[:pos] + insertion + content[pos:]
    return content


def inject_missing_or_extra_endcase_endfunction_endgenerate(content):
    """
    Randomly remove or add an endcase, endfunction, or endgenerate.
    Removing it will break the case/function/generate block,
    adding an extra one will also produce a syntax error.
    """
    keywords = ["endcase", "endfunction", "endgenerate"]
    if random.random() < 0.5:
        # Remove
        pattern = r'\b(' + '|'.join(keywords) + r')\b'
        matches = list(re.finditer(pattern, content))
        if matches:
            chosen = random.choice(matches)
            return content[:chosen.start()] + content[chosen.end():]
    else:
        # Insert
        insertion = random.choice(keywords)
        pos = random.randint(0, len(content))
        return content[:pos] + f"\n{insertion} // Extra inserted\n" + content[pos:]
    return content


def inject_mismatched_begin_end(content):
    """
    Either remove one 'end' or insert an extra 'end', causing a mismatch.
    """
    lines = content.split('\n')
    # 50% chance to remove an 'end'
    if random.random() < 0.5:
        end_lines = [i for i, line in enumerate(lines) if re.search(r'\bend\b', line)]
        if end_lines:
            line_to_edit = random.choice(end_lines)
            # Remove the first occurrence of 'end' on that line
            lines[line_to_edit] = re.sub(r'\bend\b', '', lines[line_to_edit], count=1)
            return '\n'.join(lines)
    else:
        # Insert an extra 'end' after a random 'begin'
        begin_lines = [i for i, line in enumerate(lines) if re.search(r'\bbegin\b', line)]
        if begin_lines:
            insert_after = random.choice(begin_lines)
            lines.insert(insert_after + 1, 'end // Extra injected')
            return '\n'.join(lines)
    return content


def inject_using_reserved_keyword_as_identifier(content):
    """
    Replace a random user identifier with a reserved keyword (e.g. 'module', 'if', 'always'),
    causing a syntax error.
    """
    # Simplistic pattern to find identifiers (not keywords).
    pattern = r'\b([A-Za-z_]\w*)\b'
    reserved = {
        "always", "if", "end", "case", "module", "endmodule",
        "wire", "reg", "begin", "for", "while", "assign",
        "input", "output", "inout", "endcase", "endfunction",
        "endgenerate", "function", "generate"
    }
    # Gather all candidates that are not reserved
    candidates = []
    for m in re.finditer(pattern, content):
        token = m.group(1)
        if token not in reserved:
            candidates.append(token)
    if not candidates:
        return content
    
    chosen_identifier = random.choice(candidates)
    chosen_keyword = random.choice(list(reserved))
    # Replace the identifier with the reserved keyword once
    return re.sub(r'\b'+chosen_identifier+r'\b', chosen_keyword, content, count=1)


########################################
# Dispatcher for syntactic errors only
########################################

SYNTACTIC_ERROR_FUNCTIONS = {
    "missing_semicolon": inject_missing_semicolon,
    "mismatched_parentheses": inject_mismatched_parentheses,
    "missing_or_extra_endmodule": inject_missing_or_extra_endmodule,
    "missing_or_extra_endcase_endfunction_endgenerate": inject_missing_or_extra_endcase_endfunction_endgenerate,
    "mismatched_begin_end": inject_mismatched_begin_end,
    "using_reserved_keyword_as_identifier": inject_using_reserved_keyword_as_identifier,
    "missing_or_extra_colon_in_case_item": inject_missing_or_extra_colon_in_case_item,
    "malformed_timescale_directive": inject_malformed_timescale_directive,
    "unclosed_block_comment": inject_unclosed_block_comment,
    "missing_or_extra_quote_in_string_literals": inject_missing_or_extra_quote_in_string_literals,
    "missing_or_extra_backtick_in_preprocessor_directives": inject_missing_or_extra_backtick_in_preprocessor_directives,
    "incomplete_or_extra_array_brackets": inject_incomplete_or_extra_array_brackets,
    "malformed_generate_statement": inject_malformed_generate_statement,
    "missing_or_extra_comma_in_port_or_sensitivity_list": inject_missing_or_extra_comma_in_port_or_sensitivity_list,
    "unclosed_string_in_system_task": inject_unclosed_string_in_system_task,
    "malformed_macro_definition": inject_malformed_macro_definition,
    "premature_termination": inject_premature_termination,
    "undefined_variable": inject_undefined_variable,
    "operator_misuse": inject_operator_misuse, # Semantic
    "redundant_variable_declaration": inject_redundant_variable_declaration,
    "incorrect_encoding": inject_incorrect_encoding,
    "incorrect_data_type_assignment": inject_incorrect_data_type_assignment,
    "port_mode_declaration_error": inject_port_mode_declaration_error,
    "data_index_out_of_bounds": inject_data_index_out_of_bounds,
    "improper_use_of_keywords": inject_improper_use_of_keywords
}

########################################
# Main Script
########################################

def inject_syntactic_error_in_file(input_path, output_path, error_type):
    """
    Reads the Verilog file, applies the specified syntactic error injection, and writes to output.
    """
    with open(input_path, 'r') as f:
        content = f.read()
    
    if error_type in SYNTACTIC_ERROR_FUNCTIONS:
        new_content = SYNTACTIC_ERROR_FUNCTIONS[error_type](content)
    else:
        # Randomly choose one if 'random'
        if error_type == "random":
            err_key = random.choice(list(SYNTACTIC_ERROR_FUNCTIONS.keys()))
            new_content = SYNTACTIC_ERROR_FUNCTIONS[err_key](content)
        else:
            # If unknown, return the file unchanged
            new_content = content

    with open(output_path, 'w') as f:
        f.write(new_content)


def main(input_folder, output_folder, error_type="random"):
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)

    for filename in os.listdir(input_folder):
        if filename.endswith(".v") or filename.endswith(".sv"):
            input_path = os.path.join(input_folder, filename)
            output_path = os.path.join(output_folder, filename)
            inject_syntactic_error_in_file(input_path, output_path, error_type)
            print(f"Injected '{error_type}' syntactic error into {filename}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Inject syntactic Verilog errors into .v/.sv files.")
    parser.add_argument("input_folder", help="Folder containing .v or .sv files.")
    parser.add_argument("output_folder", help="Folder to save the error-injected files.")
    parser.add_argument("--error_type", default="random",
                        help="Specify which syntactic error type to inject, or 'random' to choose randomly.")
    args = parser.parse_args()

    main(args.input_folder, args.output_folder, args.error_type)
