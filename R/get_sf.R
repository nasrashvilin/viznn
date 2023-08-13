# Define a function to retrieve top-line polling results
get_sf <- function(df, variable, weight) {
  # Call the topline function to retrieve top-line polling data
  result <- pollster::topline({{df}},{{variable}}, {{weight}},
                              n = F,
                              remove = c('(Missing)', 'NA',
                                         'Legal skip'))|>
    # Rename variable for convinient typing
    dplyr::rename(pct = `Valid Percent`,
                  var = Response)|>

    # Select only important columns
    dplyr::select(var, pct)|>

    # Change order of variable
    dplyr::mutate(var = factor(var, levels = rev(unique(var))))

  #print(result)
}
