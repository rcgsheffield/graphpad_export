# Graphpad_export
The graphpad_export repository provides scripts to facilitate the transition from GraphPad Prism files (.pzfx) to more universally compatible formats, such as .csv. 
This script helps extract tables from GraphPad Prism .pzfx files and converts them into CSV format using R. It is designed for users with no programming background and provides detailed instructions for every step of the process.

## Step by Step Instructions:
1. **Download and Install R:** Visit the [R Project website](https://cran.r-project.org/) and download the latest version of R. Follow the installation instructions for your operating system (Windows, Mac, or Linux).
2. **Download and Install RStudio:** Visit the [RStudio website](https://posit.co/download/rstudio-desktop/) and download RStudio. This will provide a user-friendly interface for running R scripts.
3. **Read the Section Below ("Script Explained Step-by-Step"):** Before proceeding, familiarise yourself with the detailed breakdown of the script. This will help you understand what each part of the code does.
4. **Open RStudio:** Once installed, launch RStudio.
5. **Open a New Project in RStudio:** If you are using Git, you can clone the repository into your new project. If not, you can create a new R script, then copy and paste [the script](https://github.com/rcgsheffield/graphpad_export/blob/main/R/pzfx_to_csv.R) provided into your empty R script.
6. **Make the necessary changes to your file path:** For Step 3 (in the script): Add your file path into the "". For Step 6b (optional, in the script): If you want to save the CSV files in a specific location, update the output_dir with the desired folder path.
7. **Run the Script:** You can run each section of the script by selecting it and pressing the "Run" button in RStudio. If you're comfortable and don't need to track your progress step-by-step, you can run the entire script at once by clicking "Source" or "Run All".
   
## Script Explained Step-by-Step 

### Step 1: Install and Load the Required Package
Install the pzfx package and load it into your R session. This ensures you have the tools to work with .pzfx files.
You will see messages in the console confirming that the package was successfully installed and loaded. 

### Step 2: Define the Data Cleaning Function
A function will be defined to remove rows where all values are missing (NA). This cleans your data before converting it to CSV format. This is a function that is created now, but will be used later.
After running this step, the clean_na_rows function will appear in your R environment. 

### Step 3: Specify the Path to Your .pzfx File
**This step requires your input:** 
Define the location of your .pzfx file by specifying the correct file path. This step is very important as it ensures the script knows where to find your data.
Replace the "" by the path to your file, the path can look like this: (e.g., "C:/Users/your_user_name/Documents/project_file.pzfx").
Please make sure the file path correctly points to your .pzfx file.

### Step 4: List All Tables in the .pzfx File
List all the tables in the .pzfx file to see the data available for extraction.
The script will print the names of all tables in the .pzfx file. 

These are the tables that will be processed and converted to CSV files. These include datasets and analyses, but will not include graphs.

### Step 5: Extract Each Table as a Data Frame
The script extracts the data from each table and cleans it by removing rows where all values are missing (NA).
After this step, the tables will be loaded into memory as data frames. You can view the extracted data in the extracted_data object in your R environment.

### Step 6: Save Extracted Data as CSV
The following steps saves the dataframes into csv, please choose one of the options below: 

### Step 6a: Save in Current Working Directory
Save the extracted tables as CSV files in your current working directory (the folder where R is running). You can check your current working directory using getwd().
The CSV files will be created in the current working directory, with each file corresponding to a table from your .pzfx file.

### Step 6b: Save to a Specific Directory
**This step requires your input:** 
If you prefer to save the CSV files in a specific folder, specify the folder location. The script will create the folder if it does not exist.
Replace the "" by the path where you want to save your files, the path can look like this: (e.g., "C:/Users/your_user_name/Documents/Project_A").

After completing all the steps, you will have clean CSV files for each table from your .pzfx file, ready for further analysis or sharing.
