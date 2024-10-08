#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#                   Intro to the Tidyverse by Colleen O'Briant
#                        Koan #5: summarize and group_by
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# To complete this assignment, edit this R script inside the brackets for
# question 1, for example: between #1@ and @#1. Un-comment the line to make it
# live code instead of a comment (Ctrl Shift C on Windows; Cmd Shift C on Macs),
# save your progress (Ctrl/Cmd S), execute the code in the console (put your
# cursor in the piece of code and hit Ctrl/Cmd Return), and test your answer by
# running the test file (Ctrl/Cmd Shift T). When you've passed all tests, compile
# ("knit") the script to html (Ctrl/Cmd Shift K) and turn the html file in on
# Canvas.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# In this koan, you'll learn the next two dplyr verbs:
# summarize() and group_by().

# Run this code to get started.
library(tidyverse)
library(gapminder)

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                            ----- summarize() -----

# 'summarize()' reduces a tibble down by applying a summary function to one or
# more columns of a tibble.

# For example, when you want to know the minimum value of a variable,
# or the maximum, or the mean, or the median, you can use 'summarize()'.

gapminder %>%
  summarize(lifeExp_min = min(lifeExp), lifeExp_max = max(lifeExp))

# The output is a tibble with columns as summary statistics. Make
# sure to give columns names (lifeExp_min and lifeExp_max).

# 1. Take 'gapminder', filter for only observations in Africa, -----------------
# and summarize to find the:
#    median life expectancy,
#    median population, and
#    median GDP per capita.

#1@

gapminder %>% summarize(lifeExp_med=median(lifeExp), pop_med=median(pop), gdpPercap_med=median(gdpPercap))

#@1

# 2. Take 'gapminder', add a new column (mutate) for the total gdp, ------------
# and summarize to find the mean and median total gdp. Try to recall how to use
# mutate before looking at the last koan.

#2@

gapminder %>%
  mutate(total_gdp=pop*gdpPercap) %>%
  summarize(totalGdp_mean=mean(total_gdp), totalGdp_med=median(total_gdp))

#@2

# Read the qelp docs on 'summarize()':

?qelp::summarize

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                             ----- group_by() -----

# The fifth dplyr function we'll learn is 'group_by()'. It sorts your data into
# buckets (groups) by the variable you specify.

# For example, this code sorts gapminder into buckets by year:

gapminder %>%
  group_by(year)

# There's no obvious difference between a grouped tibble and an ungrouped tibble
# except that a grouped tibble has a special attribute called Groups:

#  A tibble: 1,704 x 6
#  Groups:   year [12] <---- here's the attribute!
#    country     continent  year lifeExp      pop gdpPercap
#    <fct>       <fct>     <int>   <dbl>    <int>     <dbl>
#  1 Afghanistan Asia       1952    28.8  8425333      779.
#  2 Afghanistan Asia       1957    30.3  9240934      821.
#  3 Afghanistan Asia       1962    32.0 10267083      853.

# 'group_by()' isn't very useful on its own. To see how powerful it is, pair it
# with 'summarize()':

gapminder %>%
  group_by(year) %>%
  summarize(lifeExp_median = median(lifeExp))

# On its own, 'summarize()' outputs a tibble with *one row*. But in conjunction
# with 'group_by()', 'summarize()' outputs a tibble with the same number of rows
# as there are buckets (unique group values).

# The code above outputs a summary that tells us what the median life expectancy
# is in our data *for each year*. It's as if R sorted our observations (rows)
# into buckets by the grouping variable and visited each bucket individually to
# calculate the summary statistic before reporting the results.

# Grouped summaries are profoundly useful. Working with data, you'll use them
# all the time.

# 3. Take 'gapminder', filter for only observations in Africa, -----------------
# and summarize to find the median life expectancy, population, and
# GDP per capita *for each country*.

#3@

gapminder %>%
  filter(continent=="Africa") %>%
  group_by(country) %>%
  summarize(lifeExp_med=median(lifeExp), pop_med=median(pop), gdpPercap_med=median(gdpPercap))

#@3


# 4. Summarize 'gapminder' to find the mean GDP per capita for each ------------
# continent, for each year (use 2 variables inside 'group_by').

#4@

gapminder %>%
  group_by(continent, year) %>%
  summarize(gdpPercap_mean=mean(gdpPercap))

#@4


# Read the qelp docs on 'group_by()':
?qelp::group_by

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                              ----- count() -----
#
# Oftentimes you'll need to answer questions like, "How many observations
# do I have in each continent?"

# You /could/ 'filter' for each continent and then use 'nrow':

gapminder %>%
  filter(continent == "Africa") %>%
  nrow()

gapminder %>%
  filter(continent == "Americas") %>%
  nrow()

gapminder %>%
  filter(continent == "Asia") %>%
  nrow()

# But this is not the best way: it's repetitive. If 'continent'
# took on 100 values, you'd have to copy-paste the code above 100 times!

# Instead, 'group_by' continent and 'summarize()' with the function 'n()',
#  which counts the number of observations in the grouping context:

gapminder %>%
  group_by(continent) %>%
  summarize(n_observations = n())

# Grouping by a variable and counting 'n()' is such a common task,
# there's an even simpler way to do it: 'count()' is equivalent
# to group_by + summarize + n:

gapminder %>%
  count(continent)

# 5. How many observations are there from each country? ------------------------

#5@

gapminder %>%
  count(country)

#@5

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Great work! You're one step closer to tidyverse enlightenment. Make sure to
# return to this topic to meditate on it later.

# If you're ready, you can move on to the next koan: arrange and slice.
