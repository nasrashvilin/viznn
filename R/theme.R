# some theme elements for charts

# theme for ENG charts
theme_ndi_ge <- function() {
  library(ggplot2)

  theme_minimal() +
    theme(
      # grids
      panel.grid.major.x = element_blank(),
      panel.grid.minor.x = element_blank(),

      # axis
      axis.title = element_blank(),
      axis.text.y = element_text(color='black', size=12),
      axis.text.x = element_blank(),

      # plot title
      plot.title.position = 'plot',
      plot.title = element_text(size=20, color='#404040', face = 'bold'),


      text = element_text(family = 'BPG Nino Mtavruli', color='black'),
      # strips
      strip.text = element_text(size=12, color='black', vjust=1),
      panel.spacing = unit(.8, 'lines'),
      panel.spacing.y = unit(.6, 'lines'),


      plot.margin = margin(t=.5, r=0.5,b=0.5, l=0.5, unit='cm'),
      plot.background = element_rect(color=NA, fill=NA),

    )
}


# theme for GEO charts

theme_nn <- function() {

  library(ggplot2)


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
