# color functions


### define color names
color_names <- function(...) {

  color_names <- c(

    ### Liker scale
    `v_positive`     = "#14617A",
    `positive` = "#7494A7",
    `neutral`     = "#C7CDD0",
    `negative`    = "#CD734C",
    `v_negative`    = "#A63617",
    `dk`   = "#9b9b7a",
    `ra`   = "#917d62",

    ### Gender
    `male` = '#7494A7',
    `female` = "#C7CDD0",

    ### Age groups
    `young`  = "#14617A",
    `middle` = "#7494A7",
    `old` = "#C7CDD0",
    ### Settlement types
    `capital` = "#2f4858",
    `lurban` = "#14617A", # large urban
    `surban` = "#86bbd8", # small urban
    `rural` = "#C7CDD0",
    `minorities` = "#f26419")

  cols <- c(...)

  if (is.null(cols))
    return (color_names)

  color_names[cols]
}

# function to create palettes

color_palettes <- function(palette = "scale_1", ...) {

  color_palettes <- list(
    `scale_1` = color_names("v_positive"),
    `scale_2` = color_names("v_positive", "v_negative", 'dk', 'ra'),
    `scale_3` = color_names("v_positive", 'neutral', "v_negative",
                            'dk','ra'),
    `scale_4` = color_names("v_positive", 'positive','negative',
                            "v_negative", 'dk','ra'),
    `scale_5` = color_names("v_positive", 'positive','neutral',
                            'negative',"v_negative", 'dk','ra'),
    `gender` = color_names('male', 'female'),
    `age` = color_names('young', 'middle', 'old'),
    `settlement` = color_names('capital', 'lurban', 'surban', 'rural',
                               'minorities')
  )

  color_palettes[[palette]]

}


### function to generate color palettes

palette_gen <- function(palette = "scale_1", direction = 1) {

  function(n) {

    if (n > length(color_palettes(palette)))
      warning("Not enough colors in this palette!")

    else {

      all_colors <- color_palettes(palette)

      all_colors <- unname(unlist(all_colors))

      all_colors <- if (direction >= 0) all_colors else rev(all_colors)

      color_list <- all_colors[1:n]

    }
  }
}


#

### color
scale_color_nn <- function(palette = "scale_1", direction = 1, ...) {

  ggplot2::discrete_scale(
    "fill", "nn",
    palette_gen(palette, direction),
    ...
  )
}


### fill

scale_fill_nn <- function(palette = "scale_1", direction = 1, ...) {

  ggplot2::discrete_scale(
    "fill", "nn",
    palette_gen(palette, direction),
    ...
  )
}
