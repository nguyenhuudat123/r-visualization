# install the whole tidyverse package 
install.packages("tidyverse") 
# install only the ggplot2 package 
install.packages("ggplot2") 
# use ggplot2 
library(ggplot2)

# install mosaicData package  
install.packages("mosaicData") 
# load data 
data(CPS85 , package = "mosaicData")

library(ggplot2) 
ggplot(data = CPS85, 
       mapping = aes(x = exper, y = wage))

ggplot(data = CPS85, 
       mapping = aes(x = exper, y = wage)) + 
  geom_point()

library(dplyr) 
plotdata <- filter(CPS85, wage < 40) 
# redraw scatterplot 
ggplot(data = plotdata, 
       mapping = aes(x = exper, y = wage)) + 
  geom_point()

1.
# make points blue, larger, and semi-transparent 
ggplot(data = plotdata, 
       mapping = aes(x = exper, y = wage)) + 
  geom_point(color = "cornflowerblue", 
             alpha = .7, 
             size = 3)


# add a line of best fit. 
ggplot(data = plotdata, 
       mapping = aes(x = exper, y = wage)) + 
  geom_point(color = "cornflowerblue", 
             alpha = .7, 
             size = 3) + 
  geom_smooth(method = "lm")

2.

# indicate sex using color 
ggplot(data = plotdata, 
       mapping = aes(x = exper,  
                     y = wage, 
                     color = sex)) + 
  geom_point(alpha = .7, size = 3) + 
  geom_smooth(method = "lm", se = FALSE, size = 1.5)

3.


ggplot(data = plotdata, 
       mapping = aes(x = exper,  
                     y = wage, 
                     color = sex)) + 
  geom_point(alpha = .7, size = 3) + 
  geom_smooth(method = "lm", se = FALSE, size = 1.5)+
  # 앞 페이지의 코드에 연속 
  scale_x_continuous(breaks = seq(0, 60, 10)) + 
  scale_y_continuous(breaks = seq(0, 30, 5), 
                     label = scales::dollar) + 
  scale_color_manual(values = c("indianred3",  
                                "cornflowerblue"))+
  facet_wrap(~sector)+
  labs(title = "Relationship between wages and experience", 
       subtitle = "Current Population Survey", 
       caption = "source: http://mosaic-web.org/", 
       x = "Years of Experience", 
       y = "Hourly Wage", 
       color = "Gender") +
  theme_minimal()

5.

# placing color mapping in the geom_point function 
ggplot(plotdata, 
       aes(x = exper,  
           y = wage)) + 
  geom_point(aes(color = sex), 
             alpha = .7, 
             size = 3) + 
  geom_smooth(method = "lm", 
              se = FALSE,  
              size = 1.5)

6.
# create scatterplot and save it 
myplot <- ggplot(data = plotdata, 
                 aes(x = exper, y = wage)) + 
  geom_point() 
# print the graph 
myplot 
# make the points larger and blue 
# then print the graph 
myplot <- myplot + geom_point(size = 3, color = "blue") 
myplot 
# print the graph with a title and line of best fit 
# but don't save those changes 
myplot + geom_smooth(method = "lm") + 
  labs(title = "Mildly interesting graph") 
# print the graph with a black and white theme 
# but don't save those changes 
myplot + theme_bw()



data(Marriage, package = "mosaicData")
str(Marriage) 
# plot the distribution of race with modified colors and labels 
ggplot(Marriage, aes(x = race)) +  
  geom_bar(fill = "cornflowerblue",  
           color="black") + 
  labs(x = "Race",  
       y = "Frequency",  
       title = "Participants by race")

library(dplyr) 
plotdata <- count(Marriage, race) 
plotdata 


7.
# plot the bars in ascending order 
ggplot(plotdata,  
       aes(x = reorder(race, n),  
           y = n)) +  
  geom_bar(stat = "identity") + 
  labs(x = "Race",  
       y = "Frequency",  
       title  = "Participants by race") +
  geom_text(aes(label = n),  
            vjust=-0.5)


8.
# plot the bars in decending order with bar labels 
ggplot(plotdata,  
       aes(x = reorder(race, -n), 
           y = n)) +  
  geom_bar(stat = "identity",  
           fill = "indianred3",  
           color = "black") + 
  geom_text(aes(label = n),  
            vjust = -0.25) + 
  labs(x = "Race",  
       y = "Frequency",  
       title  = "Participants by race")

9. overlapping labels
ggplot(Marriage, aes(x = officialTitle)) +  
  geom_bar() + 
  labs(x = "Officiate", 
       y = "Frequency", 
       title = "Marriages by officiate") +
  
  coord_flip() +
  
  theme(axis.text.x = element_text(angle = 45,  
                                   hjust = 1))

10.
# plot the age distribution using a histogram 
ggplot(Marriage, aes(x = age)) + 
  geom_histogram() +  
  labs(title = "Participants by age", 
       x = "Age")

ggplot(Marriage, aes(x = age)) + 
  geom_histogram(fill = "cornflowerblue",  
                 color = "white") +  
  labs(title="Participants by age", 
       x = "Age")

# plot the histogram with 20 bins 
ggplot(Marriage, aes(x = age)) + 
  geom_histogram(fill = "cornflowerblue",  
                 color = "white",  
                 bins = 20) +  
  labs(title="Participants by age",  
       subtitle = "number of bins = 20", 
       x = "Age")

# plot the histogram with a bandwidth of 5 
ggplot(Marriage, aes(x = age)) + 
  geom_histogram(fill = "cornflowerblue",  
                 color = "white",  
                 binwidth = 5) +  
  labs(title="Participants by age",  
       subtitle = "binwidth = 5 years", 
       x = "Age")

11.
# Plot ages as a dot plot using gold dots with black borders 
ggplot(Marriage, aes(x = age)) + 
  geom_dotplot(fill = "gold",  
               color = "black") +  
  labs(title = "Participants by age", 
       y = "Proportion", 
       x = "Age")


12.
# stacked bar chart 
ggplot(mpg,  
       aes(x = class,  
           fill = drv)) +  
  geom_bar(position = "stack")

# grouped bar chart 
ggplot(mpg,  
       aes(x = class,  
           fill = drv)) +  
  geom_bar(position = "dodge")

# grouped bar plot preserving zero count bars 
ggplot(mpg,  
       aes(x = class,  
           fill = drv)) +  
  geom_bar(position = position_dodge(preserve = "single"))+ 
  scale_fill_brewer(palette = "Set2") + theme_minimal()

# bar plot, with each bar representing 100% 
ggplot(mpg,  
       aes(x = class,  
           fill = drv)) +  
  geom_bar(position = "fill") + 
  labs(y = "Proportion") + 
  scale_fill_brewer(palette = "Set2") + theme_minimal()

#Segmented Bar Chart

13.
# reordered bars, and better labels and colors 
library(scales) 
ggplot(mpg,  
       aes(x = factor(class, 
                      levels = c("2seater", "subcompact",  
                                 "compact", "midsize",  
                                 "minivan", "suv", "pickup")), 
           fill = factor(drv,  
                         levels = c("f", "r", "4"), 
                         labels = c("front-wheel",  
                                    "rear-wheel",  
                                    "4-wheel")))) +  
  geom_bar(position = "fill") + 
  scale_y_continuous(breaks = seq(0, 1, .2),  
                     label = percent) + 
  scale_fill_brewer(palette = "Set2") + 
  labs(y = "Percent",  
       fill = "Drive Train", 
       x = "Class", 
       title = "Automobile Drive by Class") + 
  theme_minimal()


14.
install.packages('carData')
data(Salaries, package="carData") 
str(Salaries) 

# enhanced scatter plot 
ggplot(Salaries,  
       aes(x = yrs.since.phd,  
           y = salary)) + 
  geom_point(color="cornflowerblue",  
             size = 2,  
             alpha=.8) + 
  scale_y_continuous(label = scales::dollar,  
                     limits = c(50000, 250000)) + 
  scale_x_continuous(breaks = seq(0, 60, 10),  
                     limits=c(0, 60)) +  
  labs(x = "Years Since PhD", 
       y = "", 
       title = "Experience vs. Salary", 
       subtitle = "9-month salary for 2008-2009")

15.
install.packages('gapminder')
data(gapminder, package="gapminder") 
# Select US cases 
library(dplyr) 
plotdata <- filter(gapminder,  
                   country == "United States")
str(gapminder) 
ggplot(plotdata,  
       aes(x = year,  
           y = lifeExp)) + 
  geom_line() 

# line plot with points and improved labeling 
ggplot(plotdata,  
       aes(x = year,  
           y = lifeExp)) + 
  geom_line(size = 1.5,  
            color = "lightgrey") + 
  geom_point(size = 3,  
             color = "steelblue") +
  geom_smooth(method= "lm")
  labs(y = "Life Expectancy (years)",  
       x = "Year", 
       title = "Life expectancy changes over time", 
       subtitle = "United States (1952-2007)", 
       caption = "Source: http://www.gapminder.org/data/")


str(economics)
ggplot(economics, aes(x = date, y = psavert)) + 
  geom_line(color = "indianred3",  
            size=1 ) + 
  geom_smooth() + 
  labs(title = "Personal Savings Rate", 
       subtitle = "1967 to 2015", 
       x = "", 
       y = "Personal Savings Rate") + 
  theme_minimal()


16.

data(Salaries, package="carData") 
str(Salaries)

# plot the distribution of salaries by rank using boxplots 
ggplot(Salaries,  
       aes(x = rank,  
           y = salary)) + 
  geom_boxplot(fill = "tomato", alpha = 0.7) + 
  labs(title = "Salary distribution by rank")

Kernel density plot
ggplot(Salaries,  
       aes(x = salary,  
           fill = rank)) + 
  geom_density(alpha = 0.4) + 
  labs(title = "Salary distribution by rank")
#strip plot
# plot the distribution of salaries by rank using strip plots 
ggplot(Salaries,  
       aes(y = rank,  
           x = salary, 
           color = rank)) + 
  geom_point() +  
  labs(title = "Salary distribution by rank") + 
  theme(legend.position = "none")


17.
library(scales) 
ggplot(Salaries,  
       aes(y = factor(rank, 
                      labels = c("Assistant\nProfessor", 
                                 "Associate\nProfessor", 
                                 "Full\nProfessor")),  
           x = salary,  
           color = rank)) + 
  geom_jitter(alpha = 0.7, 
              size = 1.5) +  
  scale_x_continuous(label = dollar) + 
  labs(title = "Academic Salary by Rank",  
       subtitle = "9-month salary for 2008-2009", 
       x = "", 
       y = "") + 
  theme_minimal() + 
  theme(legend.position = "none")


18.
data(gapminder, package="gapminder") 
# subset Asian countries in 2007 
library(dplyr) 
plotdata <- filter(gapminder, continent == "Asia" & year == 2007) 
# basic Cleveland plot of life expectancy by country 
ggplot(plotdata,  
       aes(x= lifeExp, y = country)) + geom_point()

# Fancy Cleveland plot 
ggplot(plotdata,  
       aes(x=lifeExp,  
           y=reorder(country, lifeExp))) + 
  geom_point(color="blue",  
             size = 2) + 
  geom_segment(aes(x = 40,  
                   xend = lifeExp,  
                   y = reorder(country, lifeExp),  
                   yend = reorder(country, lifeExp)), 
               color = "lightgrey") + 
  labs (x = "Life Expectancy (years)", 
        y = "", 
        title = "Life Expectancy by Country", 
        subtitle = "GapMinder data for Asia - 2007") + 
  theme_minimal() +  
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank())
