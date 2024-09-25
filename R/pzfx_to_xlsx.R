# Step 0: Run the code below to create a function (no expected output)

# Function to remove rows where all values are NA
clean_na_rows <- function(df) {
  # Remove rows where all values are NA (missing values)
  df <- df[!apply(df, 1, function(row) all(is.na(row))), ]
  return(df)
}

# Step 1: Install and Load the necessary packages

# Install from CRAN
install.packages("pzfx")
install.packages("openxlsx")  # For writing to Excel files

# Load the necessary libraries
library(pzfx)
library(openxlsx)


# Step 2: Specify the Path to Your .pzfx File

# Define the path to the .pzfx file
file_path <- ""


# Step 3: List All Tables in the .pzfx File

# List all tables in the .pzfx file
tables <- pzfx_tables(file_path)
print(tables) # This will show you all the available tables in the file


# Step 4: Extract Each Table as a Data Frame

# Create a list to store all extracted data
extracted_data <- list()

# Loop through all available tables and extract each one as a data frame
for (table in tables) {
  # Read table
  df <- read_pzfx(file_path, table)
  
  # Clean the data: remove rows filled with "NA" as text
  df <- clean_na_rows(df)
  
  # Store the cleaned data in the list
  extracted_data[[table]] <- df
}


# Step 5: Save All Extracted Data to a Single Excel File with Different Sheets

# Define the directory where you want to save the Excel file
output_dir <- ""

# Create the directory if it doesn't exist
if (!dir.exists(output_dir)) {
  dir.create(output_dir, recursive = TRUE)
  cat("Directory created at:", output_dir, "\n")
} else {
  cat("Directory already exists:", output_dir, "\n")
}

# Define the path to save the Excel file
excel_file <- file.path(output_dir, "extracted_data.xlsx")

# Create a new Excel workbook
wb <- createWorkbook()

# Loop through each table and add it as a separate sheet in the workbook
for (table in names(extracted_data)) {
  # Add a worksheet for the table
  addWorksheet(wb, sheetName = table)
  
  # Write the data to the worksheet
  writeData(wb, sheet = table, extracted_data[[table]])
}

# Save the workbook to an Excel file
saveWorkbook(wb, excel_file, overwrite = TRUE)

cat("Excel file created and saved at:", excel_file, "\n")
