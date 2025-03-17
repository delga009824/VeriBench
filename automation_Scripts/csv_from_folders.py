import os
import csv
import argparse

def create_csv_from_folders(input_dir, output_csv):
    """
    Iterate over subfolders in input_dir. Each subfolder's name is considered the error type.
    Reads each .v file in the subfolder and writes a CSV with two columns:
    - The code (contents of the file)
    - The error type (folder name)
    """
    with open(output_csv, mode='w', newline='', encoding='utf-8') as csvfile:
        writer = csv.writer(csvfile)
        # Write header row
        writer.writerow(["code", "error_type"])
        
        # Iterate over each subfolder in input_dir
        for subfolder in os.listdir(input_dir):
            subfolder_path = os.path.join(input_dir, subfolder)
            if os.path.isdir(subfolder_path):
                error_type = subfolder  # Folder name as error type
                # Iterate over files in the subfolder
                for filename in os.listdir(subfolder_path):
                    if filename.endswith(".sv"):
                        file_path = os.path.join(subfolder_path, filename)
                        try:
                            with open(file_path, 'r', encoding='utf-8') as f:
                                code = f.read()
                        except Exception as e:
                            print(f"Error reading {file_path}: {e}")
                            continue
                        writer.writerow([code, error_type])
                        print(f"Processed {filename} with error type '{error_type}'")
    print(f"CSV file '{output_csv}' created successfully.")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Create a CSV file mapping Verilog code to error types from folder structure.")
    parser.add_argument("--input_dir", type=str, required=True,
                        help="Parent directory containing subfolders of Verilog files. Each subfolder should be named for an error type.")
    parser.add_argument("--output_csv", type=str, required=True,
                        help="Path to the output CSV file.")
    args = parser.parse_args()
    create_csv_from_folders(args.input_dir, args.output_csv)