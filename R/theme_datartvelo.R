theme_datartvelo_en <- function () {
  theme_minimal()+
    theme(

      
      # set plot margin 
      plot.margin = margin(t=1.5, 
                           r=1.5, 
                           b=1.5, 
                           l=1.5, 
                           unit="cm"),
      plot.background = element_rect(fill='white',
                                     color=NA),

      # plot title 
      plot.title = element_text(
        size = 20,
        vjust=0,
        family = 'Source Sans Pro',
        face = 'bold',
        lineheight = .9),
      
      plot.title.position = 'plot',
      
      # plot subtitle
      plot.subtitle = element_text(
        size=12,
        family = 'Source Sans Pro',
        color='grey20',
        vjust=-2,
        lineheight = 1),
      
      # plot caption
      plot.caption.position = 'plot',
      
      plot.caption = element_text(
        size=11, 
        hjust=0,
        family = 'Source Sans Pro',
        color='grey50'),

      
      #axis 
      axis.line.x = element_line(linewidth = .8),
      axis.ticks.x = element_line(),
      axis.ticks.length.x = unit(1, 'line'),
      axis.title = element_blank(),
      axis.text.y = element_text(size=12, color='black'),
      axis.text.y.left = element_text(color='grey50',
                                 size=12,
                                 vjust=-.5,
                                 margin = margin(t=0,
                                                 b=0,
                                                 r=-12,
                                                 l=0,
                                                 'pt')),
      axis.text.x = element_text(size=13,
                                 hjust=.5,
                                 vjust=-1,
                                 margin = margin(t=0,
                                                 r=0,
                                                 b=50,
                                                 l=0,
                                                 'pt')),
      
      axis.text.y.right = element_text(
        margin = margin(
          t= 0,
          r= 0,
          b= 0,
          l=-22,
          'pt'),
        vjust=-.5,
        hjust = 1,
        color='grey',
        family = 'Source Sans Pro',
      size = 12),


      
      # Legend
      legend.position = 'none',
      
      # panel grids
      panel.grid.minor.x = element_blank(),
      panel.grid.major.x = element_blank(), 
      panel.grid.major.y = element_line(linewidth = .4, color = 'grey'),
      panel.grid.minor.y = element_blank()
    )
}

### Georgian 
theme_datartvelo_ge <- function () {
  bbplot::bbc_style()+
    theme(
      plot.margin = margin(t=1, r=1.5, b=.5, l=1, unit="cm"),
      plot.title = element_text(size=30, #face="bold",  
                                family = 'GL Gordeziani',
                                vjust=0),
      plot.subtitle = element_text(size = 15,
                                   family = 'BPG Arial',),
      plot.caption = element_text(size=12, color='black',
                                  family = 'BPG Arial',
                                  hjust = 0),
      plot.background = element_rect(fill='white',
                                     color=NA),
      axis.line.x = element_line(linewidth = .8),
      axis.ticks.x = element_line(),
      axis.ticks.length.x = unit(1, 'line'),
      axis.title = element_blank(),
      axis.text.y = element_text(size=15, color='black'),
      axis.text.y.left = element_text(color='grey50',
                                 size=14,
                                 vjust=-.5,
                                 margin = margin(t=0,
                                                 b=0,
                                                 r=-12,
                                                 l=0,
                                                 'pt')),
      axis.text.x = element_text(size=15,
                                 hjust=.5,
                                 vjust=-1,
                                 margin = margin(t=0,
                                                 r=0,
                                                 b=50,
                                                 l=0,
                                                 'pt')),
      legend.position = 'none'
    )
}
