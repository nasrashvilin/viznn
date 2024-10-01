# Load necessary libraries
library(srvyr)
library(dplyr)
library(labelled)
library(stringr)


xtab <- function(survey_design, question_var, demographic_vars) {
  # Initialize an empty list to store results
  crosstab_list <- list()
  
  # Calculate national results (without grouping by any demographic variable)
  national_crosstab <- survey_design |>
    dplyr::filter(!is.na(!!rlang::sym(question_var))) |>
    dplyr::group_by(!!rlang::sym(question_var)) |>
    dplyr::summarise(
      pct = srvyr::survey_mean(vartype = "se", na.rm = TRUE),
      .groups = 'drop'
    ) |>
    dplyr::mutate(
      type = 'national', 
      demo = 'National',
      label = labelled::to_character(!!rlang::sym(question_var)),
      margin_of_error = 1.96 * pct_se,
      lower_bound = pct - margin_of_error,
      upper_bound = pct + margin_of_error
    ) |>
    dplyr::select(type, demo, label, pct, margin_of_error, lower_bound, upper_bound)
  
  crosstab_list[['national']] <- national_crosstab
  
  for (demographic_var in demographic_vars) {
    crosstab <- survey_design |>
      dplyr::filter(!is.na(!!rlang::sym(question_var)), !is.na(!!rlang::sym(demographic_var))) |>
      dplyr::group_by(dplyr::across(dplyr::all_of(demographic_var)), !!rlang::sym(question_var)) |>
      dplyr::summarise(
        pct = srvyr::survey_mean(vartype = "se", na.rm = TRUE),
        .groups = 'drop'
      ) |>
      dplyr::mutate(
        type = demographic_var,
        demo = labelled::to_character(!!rlang::sym(demographic_var)),
        label = labelled::to_character(!!rlang::sym(question_var)),
        margin_of_error = 1.96 * pct_se,
        lower_bound = pct - margin_of_error,
        upper_bound = pct + margin_of_error
      ) |>
      dplyr::select(type, demo, label, pct, margin_of_error, lower_bound, upper_bound)
    
    crosstab_list[[demographic_var]] <- crosstab
  }
  
  combined_crosstab <- dplyr::bind_rows(crosstab_list) |>
    dplyr::mutate(
      label = stringr::str_trim(label),
      label = stringr::str_replace_all(label, "\\(|\\)", ""),
    ) |>
    dplyr::mutate(dplyr::across(c(pct, margin_of_error, lower_bound, upper_bound), ~ . * 100))
  
  return(combined_crosstab)
}



