library(RImagePalette)
set.seed(42)

https://uploads6.wikiart.org/00135/images/toshusai-sharaku/sharaku-1794-soga-gor-and-gosho-gor-maru-adachi-reprint.jpg!Large.jpg
https://www.sott.net/image/s16/323691/full/ancient_greek_mosaic_excavatio.jpg
https://hakaimagazine.com/wp-content/uploads/octo-mosaic-shark-history.jpg
https://uploads8.wikiart.org/00129/images/hieronymus-bosch/christ-carrying-the-cross.jpg!HD.jpg

myurl <- "https://uploads8.wikiart.org/00129/images/hieronymus-bosch/christ-carrying-the-cross.jpg!HD.jpg"
z <- tempfile()
download.file(myurl,z,mode="wb")
pic <- jpeg::readJPEG(z)
file.remove(z) # cleanup

display_image(pic)
palette <- image_palette(pic, n=40)
scales::show_col(palette)
