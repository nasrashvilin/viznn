# Define the recode4 function
recode4 <- function(data) {
  recoded_data <- data
  
  # Recode the 4-point scale to a 2-point scale
  recoded_data <- ifelse(data == 1 | data == 2, 1,
                         ifelse(data == 3 | data == 4, 2, data))
  
  # Combine -1 and -2 into -99
  recoded_data[recoded_data == -1 | recoded_data == -2] <- -99
  
  # Get the original labels
  original_labels <- val_labels(data)
  
  # Function to extract and capitalize the second word or handle single-word labels
  extract_label <- function(label) {
    words <- strsplit(label, " ")[[1]]
    if (length(words) > 1) {
      capitalized_label <- paste(toupper(substring(words[2], 1, 1)), tolower(substring(words[2], 2)), sep = "")
    } else {
      capitalized_label <- paste(toupper(substring(words[1], 1, 1)), tolower(substring(words[1], 2)), sep = "")
    }
    return(capitalized_label)
  }
  
  # Extract the new labels by applying the function to the original labels
  new_labels <- sapply(names(original_labels), extract_label)
  
  # Define the new labels for the recoded 2-point scale
  recoded_labels <- c(
    new_labels[original_labels %in% c(1, 2)][1],  # Label for 1
    new_labels[original_labels %in% c(3, 4)][1],  # Label for 2
    "DK/RA"                                       # Label for -99
  )
  
  # Create a named vector for recoded labels
  recoded_label_values <- c(1, 2, -99)
  names(recoded_label_values) <- recoded_labels
  
  # Apply the new labels to the recoded data
  val_labels(recoded_data) <- recoded_label_values
  
  # Preserve original values and labels not being recoded
  preserved_values <- unique(data[!data %in% c(1, 2, 3, 4, -1, -2)])
  preserved_labels <- original_labels[as.character(preserved_values)]
  
  # Ensure the original values and labels are kept unchanged
  for (value in preserved_values) {
    recoded_data[data == value] <- value
  }
  val_labels(recoded_data)[as.character(preserved_values)] <- preserved_labels
  
  # Return the recoded data with new labels
  return(recoded_data)
}

# Example usage
data4 <- labelled(c(1, 2, 3, 4, -1, -2, -4),
                  labels = c("Very good" = 1, "Good" = 2, "Bad" = 3, "Very bad" = 4, "Don't know" = -1, "Refuse to answer" = -2, "Other" = -4))

recoded_data4 <- recode4(data4)
print(recoded_data4)
print(val_labels(recoded_data4))
