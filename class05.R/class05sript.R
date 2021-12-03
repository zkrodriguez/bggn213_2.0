#class 05: data visualization (ggplot2)

library(ggplot2)

#will use inbuilt "cars dataset 
head(cars)

# all ggplots have min. 3 layers
ggplot(cars)
# need to add the other layers
ggplot(cars, aes(x=speed, y=dist)) + geom_point() + geom_smooth(method = "lm") +
  labs(title = "Stopping Distance of Old Cars", 
       x= "Speed (MPH)", y= "Stopping Distance (ft)")

# sidenote: other graphic systems available in R ("base" R graphics)

plot(cars)

# workbook data
url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)

# how many genes in this dataset?
nrow(genes)

# how many genes are "up"?
#this looks at the state column 
genes$State

#to look at the specific numbers
table(genes$State)

# to see what percentage of genes are up?
table(genes$State)/nrow(genes) * 100

# to round up:
round(table(genes$State)/nrow(genes) * 100, 2)

# make a figure
p <- ggplot(genes) +
  aes(x=Condition1, y=Condition2, col=State)+
  geom_point()
p

# change the colors
p <- p + scale_color_manual(values = c("orchid", "orange", "lightblue")) +
  labs(title = "Gene Expression Changes Upon Drug Treatment", 
       x= "Control(no drug)", y= "Drug Treatment")

# time to work with gapminder
library(gapminder)
url <- "https://raw.githubusercontent.com/jennybc/gapminder/master/inst/extdata/gapminder.tsv"
gapminder <- read.delim(url)
library(dplyr)
head(gapminder)

# %>% is called a pipe. We will tell R to filter the gapminder dataset to year 2007
gapminder_2007 <- gapminder %>% filter(year==2007)

# lets make a figure of year vs lifeExp
# add a box plot on top of the jitters
# alpha changes the transprency of the dot/box
ggplot(gapminder) + 
  aes(x=year, y=lifeExp, col=continent) + 
  geom_jitter(width= 0.3, alpha=0.4) +
  geom_boxplot(aes(group=year, alpha=0.4))

# try a vln plot instead of a box plot
g <- ggplot(gapminder) + 
  aes(x=year, y=lifeExp, col=continent) + 
  geom_jitter(width= 0.3, alpha=0.4) +
  geom_violin(aes(group=year), alpha=0.2, draw_quantiles =0.5)
g

#install.packages("plotly")
#install the plotly
#plotly lets you hover over the data and see specifics of the points 
#library(plotly)
#ggplotly()
