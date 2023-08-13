# basic theme for charts

theme_nn <- function() {
  theme_minimal()+
    theme(
      #title and subtitle
      plot.title.position = 'plot',
      plot.title = element_text(hjust=0, size=18, vjust=0),
      plot.subtitle = element_text(hjust=0, size=9, vjust=1),

      ## axis
      axis.text.y = element_text(size=10, hjust=1),
      axis.title = element_blank(),

      #margins
      plot.margin = margin(t=.5,r=.5,b=.5,l=.5, 'cm'),

      # gridlines
      panel.grid.minor = element_blank(),
      panel.grid.major.x = element_blank(),

      #legend
      legend.position = 'top'
      )
}
