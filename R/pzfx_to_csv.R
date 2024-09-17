
#Step 1: Install and Load the package

# Install from CRAN
install.packages("pzfx")

# and load library
library(pzfx)


#Step 2: Run the code below to create a function (no expected output)

# Function to remove rows where all values are NA
clean_na_rows <- function(df) {
  # Remove rows where all values are NA (missing values)
  df <- df[!apply(df, 1, function(row) all(is.na(row))), ]
  return(df)
}


#Step 3: Specify the Path to Your .pzfx File

# Define the path to the .pzfx file
file_path <- ""


#Step 4: List All Tables in the .pzfx File

# List all tables in the .pzfx file
tables <- pzfx_tables(file_path)
print(tables) 
# This will show you all the available tables in the file


#Step 5: Extract Each Table as a Data Frame

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


#Step 6a: Save Extracted Data to CSV 

# Save each extracted table as a CSV file
for (table in tables) {
  write.csv(extracted_data[[table]], paste0(table, ".csv"), row.names = FALSE)
}


#Step 6b: Save Extracted Data to CSV in a specified location

# Define the directory where you want to save the extracted files
output_dir <- ""

# Create the directory if it doesn't exist
if (!dir.exists(output_dir)) {
  dir.create(output_dir, recursive = TRUE)
  cat("Directory created at:", output_dir, "\n")
} else {
  cat("Directory already exists:", output_dir, "\n")
}

# Save each extracted table as a CSV file in the specified output directory
for (table in tables) {
  write.csv(extracted_data[[table]], file.path(output_dir, paste0(table, ".csv")), row.names = FALSE)
}





