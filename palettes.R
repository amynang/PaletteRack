library(RImagePalette)
set.seed(42)

https://uploads6.wikiart.org/00135/images/toshusai-sharaku/sharaku-1794-soga-gor-and-gosho-gor-maru-adachi-reprint.jpg!Large.jpg
https://www.sott.net/image/s16/323691/full/ancient_greek_mosaic_excavatio.jpg
https://hakaimagazine.com/wp-content/uploads/octo-mosaic-shark-history.jpg
https://uploads8.wikiart.org/00129/images/hieronymus-bosch/christ-carrying-the-cross.jpg!HD.jpg
https://i.discogs.com/xONynFi-p8IuY1ZSqDQjUvyJBxgyqYN6NZFAkSkYHRc/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTY1NDgz/Ny0xMjEyOTQ1ODE1/LmpwZWc.jpeg



myurl <- "https://i.discogs.com/xONynFi-p8IuY1ZSqDQjUvyJBxgyqYN6NZFAkSkYHRc/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTY1NDgz/Ny0xMjEyOTQ1ODE1/LmpwZWc.jpeg"
z <- tempfile()
download.file(myurl,z,mode="wb")
pic <- jpeg::readJPEG(z)
file.remove(z) # cleanup

display_image(pic)
palette <- image_palette(pic, n=20)
scales::show_col(palette)

library(tidyverse)
n = 1e4
(
  df = data.frame(a=rnorm(n),
                  b=rnorm(n)+1,
                  c=rnorm(n)-1) %>% 
  pivot_longer(1:3,
               names_to = "letter",
               values_to = "value") %>% 
  ggplot(aes(letter, value, 
             fill = letter,
             color = letter)) +
  geom_point(shape = 21, 
             size = 3,
             alpha = .05,
             position = position_jitter(.3)) +
  stat_summary(fun.data = median.quartile,
               size = .75,
               color = "#424242") +
  scale_fill_manual(values = c("#DE5360","#8A5C72","#F68659")) +
  scale_color_manual(values = c("#DE5360","#8A5C72","#F68659")) +
  theme_bw() +
  theme(panel.background = element_rect(fill = "#F3CF9F"),
        panel.grid.major = element_line(size = 0.25, 
                                        linetype = 'dotted',
                                        colour = "darkgrey"), 
        panel.grid.minor = element_line(size = 0.25, 
                                        linetype = 'dotted',
                                        colour = "darkgrey"))
)

median.quartile <- function(x){
  out <- quantile(x, probs = c(0.25,0.5,0.75))
  names(out) <- c("ymin","y","ymax")
  return(out)
}
