library(ggplot2)

### Function to create bar chart with variations

bar_chart <- function(type = c('sf', 'xtab'),
                      direction = c('horizontal',
                                    'vertical'),
                      data,
                      var1,
                      var2,
                      label,
                      palette = NULL,#c('gender', 'age', 'settlement'),
                      fill = NULL, #color_names('v_positive'),
                      title = NULL,
                      subtitle = NULL,
                      text_size = 3) {

  if (type == 'sf' &
      direction == 'horizontal') {

  # plot
  p <- ggplot2::ggplot(data, aes(y = reorder({{var1}},{{var2}}),
                                 x = {{var2}},
                                 fill = {{fill}},
                                 label = ifelse({{label}} > 1.5,
                                                round({{label}}),
                                                '')))+
    theme_nn()

  }

   else if  (type == 'sf' &
            direction == 'vertical') {
    # plot
    p <- ggplot2::ggplot(data, aes(x = {{var1}},
                                   y = {{var2}},
                                   fill={{fill}},
                                   label = ifelse({{label}} > 1.5,
                                                    round({{label}}),
                                                          '')))+
      scale_x_discrete(labels = function(x) str_wrap(x, 10))+
      scale_y_continuous(limits = c(0,100))+
      theme_nn()
  }

    else if (type == 'xtab' & direction == 'vertical') {
      #plot
    p <- ggplot2::ggplot(data, aes(x={{var1}},
                                   y={{var2}},
                                   fill={{fill}},
                                   label=round({{label}})))+
      #geom_col(position = position_dodge2())+
      #geom_text(position = position_dodge(width =.9),
       #         vjust=1)+
      scale_x_discrete(labels = function(x) str_wrap(x, 12))+
      scale_y_continuous(limits = c(0,100))+
      theme_nn()
  }

  else if (type == 'xtab' & direction == 'horizontal') {
    # plot
    p <- ggplot2::ggplot(data, aes(y={{var1}},
                                   x={{var2}},
                                   fill={{fill}},
                                   label=round({{label}})))+
     # geom_col(position = position_dodge2())+
    # geom_text(position = position_dodge(width =.9),vjust=1)+
      theme_nn()
  }


  # add title if provided
  if (!is.null(title)) {
    p <- p + labs(title = str_wrap(title, 45))
  }


  # add title if provided
  if (!is.null(subtitle)) {
    p <- p + labs(subtitle = subtitle)
  }

  if (is.null(fill)) {
    p <- p + geom_col(fill = color_names('v_positive'),
                      width=.5)+
      geom_text(position = position_stack(vjust=.5),
                fontface='bold',
                color='white')
  }

    if (!is.null(fill)) {
      p <- p + geom_col(#fill = color_names('v_positive'),
                        width = .5)+
        geom_text(position = position_stack(vjust=.5),
                  fontface='bold',
                  color='white')+
        scale_fill_nn(palette = {{palette}},
                      guide = guide_legend(
                        keywidth = .5,
                        keyheight = .5,
                        title = ''
                      ))
  }


  return(p)
}



