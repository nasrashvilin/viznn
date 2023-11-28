# recode age into three groups function
group_age <- function(data, variable) {

  library(dplyr)
  library(labelled)


  data %>%
    mutate(
      # Create categories
      age_group = dplyr::case_when(
        {{variable}} <= 34 ~ 1, #"18-34",
        {{variable}} > 34 & {{variable}} <= 54 ~ 2, #"35-54",
        {{variable}} > 54 ~ 3, #"55+"
      ),
      # set labels
      age_group = labelled::set_value_labels(age_group,
                                             c("18-34" = 1,
                                               "35-54" = 2,
                                               '55+'= 3)),
    )
}
