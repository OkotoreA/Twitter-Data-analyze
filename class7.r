bar <- ggplot(data = diamonds) +
           geom_bar(mapping = aes(x = cut, fill = cut),
           show.legend = FALSE,     width = 1   ) + 
           theme(aspect.ratio = 1) +   labs(x = NULL, y = NULL)
library(ggplot2)
bar
bar+coord_flip()
bar+coord_polar()
bar+coord_quickmap()
bar+coord_fixed()
bar+coord_munch()
bar+coord_