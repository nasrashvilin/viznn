### function to provide crosstabs of two variable

get_xtab <- function(df, x, y, weight) {
  pollster::crosstab({{df}}, {{x}}, {{y}}, {{weight}},
                     n=F)|>
    ## make longer for fill
    tidyr::pivot_longer(!1, values_to = 'pct', names_to = 'var')|>

    # change name of the first column
    dplyr::rename(varx = 1) |>
    dplyr::mutate(varx = factor(varx, levels = unique(varx)))
}
