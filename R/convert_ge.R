# function to translate demographic variables into Georgian

convert_ge <- function(data, var) {
  library(dplyr)
  library(stringr)


  data <- data %>%
    mutate(
      # Convert the factor column to character
      {{var}} := as.character({{var}}),

      {{var}} := str_replace({{var}},
                             'National',
                             'ეროვნული'),


      {{var}} := str_replace({{var}},
                             'Capital',
                             'თბილისი'),
      {{var}} := str_replace({{var}},
                             'Large urban',
                             'დიდი ქალაქები'),
      {{var}} := str_replace({{var}},
                             'Small urban',
                             'პატარა ქალაქები'),
      {{var}} := str_replace({{var}},
                             'Rural',
                             'სოფელი'),
      {{var}} := str_replace({{var}},
                             'Minorities',
                             'უმცირესობათა დასახლებები'),
      {{var}} := str_replace({{var}},
                             'Minority settlements',
                             'უმცირესობათა დასახლებები'),

      # Gender
      {{var}} := str_replace({{var}},
                             'Male',
                             'კაცი'),
      {{var}} := str_replace({{var}},
                             'Female',
                             'ქალი'),

      ## Party
      {{var}} := str_replace({{var}},
                             'GD supporters',
                             'ქართ. ოცნების მხარდამჭერები'),
      {{var}} := str_replace({{var}},
                             'Did not name a party',
                             'არ დაასახელეს პარტია'),
      {{var}} := str_replace({{var}},
                             'Opposition supporters',
                             'ოპოზიციის მხარდამჭერები'),

      # Convert back to factor with the same levels and ordering
      {{var}} := factor({{var}},
                        levels = rev(unique({{var}}))),
    )


  return(data)
}

convert_ge(test,demo)




