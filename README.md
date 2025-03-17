# VeriBench: A Comprehensive Verilog Error Dataset and Benchmarking Framework
VeriBench is designed to facilitate automated debugging of Verilog code by providing a large-scale error dataset and a framework for benchmarking error detection using large language models (LLMs). This repository includes scripts for error injection, dataset creation, and compilation testing, as well as a Jupyter Notebook for benchmarking.

## Directory Structure

```
VeriBench/
├── automation_Scripts/
│   ├── no_error/                # Ground truth Verilog code (from Verilog Eval dataset)
│   ├── <25 output folders>/      # Folders containing Verilog code with injected errors (25 unique error types)
│   ├── verilog_error_dataset.csv  # Combined dataset (4220 data points) with error categorizations
│   ├── compile_verilog_folder.py  # Script to compile all Verilog files in a folder using Icarus Verilog
│   ├── csv_from_folders.py        # Script to generate a CSV file from folders of Verilog code (columns: code, error type)
│   └── error_insertion.py         # Script to inject a specified error type into Verilog code from the ground truth
│
└── benchmark/
    └── VeriBenchmark.ipynb        # Jupyter Notebook benchmarking SalesForce/codegen-350M-mono on 10 samples (22.2% accuracy)
```

## Prerequisites
- Python 3.x
- Icarus Verilog (Ensure that Icarus Verilog is installed and added to your system's PATH for compiling Verilog code.)
- Git (for cloning the repository)
- Jupyter Notebook (to run the benchmark notebook)

## Usage Instructions

### 1. Automation Scripts
#### a. Error Injection
The error_insertion.py script injects one of 25 unique error types into Verilog code from the ground truth folder.

Usage Example:

```
python error_insertion.py ./ground_truth ./output_folder --error_type missing_semicolon 
```

--input: Path to the ground truth folder (e.g., ./ground_truth).
--output: Path where the error-injected files will be saved.
--error: Specific error type to inject (choose from one of the 25 unique error types).

#### b. Compilation Testing
The compile_verilog_folder.py script compiles all Verilog files within a specified folder using Icarus Verilog and prints the error messages in the terminal.

Usage Example:

```
python compile_verilog_folder.py ./folder
```

--folder: Path to the folder containing Verilog files to compile.

#### c. Dataset CSV Generation
The csv_from_folders.py script generates a CSV file from a folder containing subfolders of Verilog code. The output CSV includes:

Column 1: Verilog code
Column 2: Corresponding error type

Usage Example:

```
python csv_from_folders.py --input_dir ./automation-Scripts --output_csv output.csv
```

--folder: Path to the main folder that contains subfolders with Verilog code.
--output: Name/path of the CSV file to generate (e.g., verilog_error_dataset.csv).

###2. Benchmarking
In the benchmark folder, the VeriBenchmark.ipynb Jupyter Notebook benchmarks the SalesForce/codegen-350M-mono model on 10 samples from the dataset. The notebook reports an accuracy of 22.2% for error detection.

To Run the Benchmark Notebook:

Open a terminal and navigate to the repository root.

Launch Jupyter Notebook:

```
jupyter notebook
```

Open benchmark/VeriBenchmark.ipynb in your browser and run the cells sequentially to reproduce the benchmark experiments.