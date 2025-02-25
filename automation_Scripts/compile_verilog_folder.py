import os
import subprocess
import argparse

def compile_verilog(file_path, output_file):
    """
    Compiles a Verilog or SystemVerilog file using iverilog.
    
    Parameters:
        file_path (str): Path to the input .v or .sv file.
        output_file (str): Path to the output compiled file.
        
    Returns:
        tuple: (success (bool), output (str)) where success is True if compilation succeeded,
               otherwise False, and output contains stdout or stderr messages.
    """
    try:
        # Call iverilog command: -o specifies the output file
        result = subprocess.run(
            ["iverilog", "-o", output_file, file_path],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )
        if result.returncode == 0:
            return True, result.stdout
        else:
            return False, result.stderr
    except Exception as e:
        return False, str(e)

def process_folder(folder_path):
    """
    Processes all .v and .sv files in the given folder by attempting to compile them.
    
    Compilation outputs are saved in the same folder with an added '.out' extension.
    """
    # List all files in the directory
    files = os.listdir(folder_path)
    verilog_files = [f for f in files if f.endswith(".v") or f.endswith(".sv")]
    
    if not verilog_files:
        print("No .v or .sv files found in the specified folder.")
        return
    
    for file in verilog_files:
        file_path = os.path.join(folder_path, file)
        # Create an output file name by appending ".out" to the original file name (before extension)
        output_file = os.path.join(folder_path, os.path.splitext(file)[0] + ".out")
        print(f"Compiling {file}...")
        success, message = compile_verilog(file_path, output_file)
        if success:
            print(f"SUCCESS: {file} compiled successfully. Output saved to {output_file}.")
        else:
            print(f"ERROR: Compilation of {file} failed.\n{message}")

def main():
    parser = argparse.ArgumentParser(
        description="Compile Verilog (.v) or SystemVerilog (.sv) files in a folder using iverilog."
    )
    parser.add_argument("folder", type=str, help="Path to the folder containing .v or .sv files.")
    args = parser.parse_args()
    
    # Verify the folder exists
    if not os.path.isdir(args.folder):
        print(f"Error: The folder '{args.folder}' does not exist.")
        return
    
    process_folder(args.folder)

if __name__ == "__main__":
    main()
