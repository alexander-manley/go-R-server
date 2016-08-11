#sudo R shell:

install.packages("corrplot") 
install.packages("Rserve")

library("corrplot") 
library("Rserve")
 
generateCorrelationPlot <- function () {

filename <- tempfile("plot", fileext = ".png") 
png(filename)

M <- cor(mtcars) 
corrplot(M) 
dev.off()
 
image <- readBin(filename, "raw", .Machine$integer.max) 
unlink(filename)
 
return (image) 
} 
run.Rserve()
