#libraries are a group of functions that does a particular task e.g ggplot2 is 
#a data visualization that does visuals
data(airquality)
airquality
#working with missing data 
is.na(airquality)
sum(is.na(airquality))
colSums(is.na(airquality))
#Remove Missing value
clean_data <- na.omit(airquality)
View(clean_data)
#find the Average and median of each column 
median(clean_data$Ozone)
median(clean_data$Solar.R)
median(clean_data$Wind)
median(clean_data$Temp)
median(clean_data$Month)
median(clean_data$Day)
mean(clean_data$Ozone)
mean(clean_data$Solar.R)
mean(clean_data$Wind)
mean(clean_data$Temp)
mean(clean_data$Month)
mean(clean_data$Day)
rowMeans(clean_data)
colMeans(clean_data)
#indexing and slicing 
airquality[1, ]
airquality[2, ]
airquality[ ,2]
airquality[ ,1]
airquality[ 1,3]
#data structure, vector, matrix, data-frame list 
#vector are one dimensional in nature and can only contain homogeneous data 
# matrix are two dimensional in nature that is rows and columns that contain only  homogeneous
#all the columns are of the same length 
#data frame two dimensions rows and columns and can contain heterogeneous data 
#e.g character in one column integer in another column and float in another column 
#e.g csv excel and the like
#list are one dimensional in nature containing heterogeneous.
#How to load a library 
library(ggplot2)
library(tidyverse)
library(tidyverse)
ggplot(data=mpg)

ggplot2::mpginstall.packages("tidyverse")
#data visualization 
ggplot(data=mpg)+ geom_point(mapping=aes(x = manufacturer, y = model))
View(ggplot2::mpg)
names(ggplot2::mpg)
ggplot(data=mpg) +geom_point(mapping = aes(x = displ, y = hwy))
mean(mpg$displ)
class(mpg$manufacturer)
mean(mpg$year)
mean(mpg$trans)
mean(mpg$drv)
mean(mpg$class)
View(mpg)
mean(mpg$cty)
ggplot(data = mpg) + geom_point(mapping = aes(x =displ, y =cty))
ggplot(data = mpg) + geom_point(mapping = aes(x = manufacturer, y = cty))
ggplot(data = mpg) + geom_point(mapping = aes (x = displ, y = cty))
ggplot(data = mpg) + geom_point(mapping = aes(x = trans, y = class))
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = drv))
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = class))
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = trans))
ggplot(data = mpg) + geom_point(mapping = aes(x = class, y = hwy))

median(mpg$year)
median(mpg$cyl)
median(mpg$cty)

median(mpg$hwy)
median(mpg$displ)

sum(mpg$cyl)
sum(mpg$displ)
sum(mpg$cty)
sum(mpg$hwy)

View(VADeaths)
View(VADeaths)
mean(VADeaths)
median(VADeaths)
sum(VADeaths)
nrow(VADeaths)
ncol(VADeaths)
min(VADeaths)
max(VADeaths)
colSums(VADeaths)
rowsum.data.frame(VADeaths)
data.class(VADeaths)
class(VADeaths)
rowMeans(VADeaths)
rowSums(VADeaths)




rainfall <- c(799,1174.8,865.1,1334.6,635.4,918.5,685.5,998.6,784.2,985,882.8,1071)

# Convert it to a time series object.
rainfall.timeseries <- ts(rainfall,start = c(2012,1),frequency = 12)

# Print the timeseries data.
print(rainfall.timeseries)

# Give the chart file a name.
png(file = "rainfall.png")

# Plot a graph of the time series.
plot(rainfall.timeseries)

# Save the file.
dev.off()
j