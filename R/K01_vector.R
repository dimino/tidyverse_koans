#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#                   Intro to the Tidyverse by Colleen O'Briant
#                                Koan #1: Vectors
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# To complete this assignment, edit this R script inside the brackets for
# question 1, for example: between #1@ and @#1. Un-comment the line to make it
# live code instead of a comment (Ctrl Shift C on Windows; Cmd Shift C on Macs),
# save your progress (Ctrl/Cmd S), execute the code in the console (put your
# cursor in the piece of code and hit Ctrl/Cmd Return), and test your answer by
# running the test file (Ctrl/Cmd Shift T). When you've passed all tests, compile
# ("knit") the script to html (Ctrl/Cmd Shift K) and turn the html file in on
# Canvas.

# Using hotkeys makes coding in RStudio easier and more natural. Hotkeys also
# help you remember to do things like save your work often, test your code
# regularly, and write code in the source pane so you can check it as you go by
# dropping it down into the console without copy-pasting. Practice all these
# hotkeys throughout this koan to make them muscle memory:

#   * Save your script: Ctrl/Cmd S
#   * Execute selected code in the console: Ctrl/Cmd Return
#   * Test your answers: Ctrl/Cmd Shift T
#   * Comment/Uncomment lines: Ctrl/Cmd Shift C
#   * Move your cursor to the beginning of the line: Ctrl A
#   * Move your cursor to the end of the line: Ctrl E
#   * Use Spin to knit your script to html: Ctrl/Cmd Shift K

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                    -----  Setting up your work space  -----
#
# You should install R, RStudio, the tidyverse, and qelp along with these
# tidyverse koans. Go here for instructions:
# https://colleen.quarto.pub/the-tidy-econometrics-workbook/#setting-up-your-workspace

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                     -----  Create a vector with 'c()' -----
#
# In R, data is held in vectors. One way to construct a vector is to use the
# function 'c()'. 'c()' is short for "combine": you can combine elements into a
# vector.

# Read the qelp docs on 'c()':
?qelp::c

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# 1. Make the first element of this numeric vector '6'. Remember to always
# un-comment the line of code (Cmd-Shift-C), execute it (Cmd-Return), and then
# test this file to make sure you passed (Cmd-Shift-T).

#1@

c(6, 4, 5, 2, 3)

#@1

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# 2. Make the third element of this character vector 'economics'. --------------
# Note that quotes shouldn't be used with numbers, but should be used with
# character strings.

#2@

c("apple", "banana", "economics")

#@2

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                      -----  Calculations on Vectors -----
#
# You can do all kinds of calculations on vectors. If you fill in the blank
# correctly, when you run these lines, R will print 'TRUE'.

# 3a. Add these two numeric vectors. -------------------------------------------

#3a@

c(6, 3, 2) + c(3, 2, 1) == c(9, 5, 3)

#@3a


# 3b. Find the minimum of this vector. -----------------------------------------
?qelp::min

#3b@

min(c(6, 3, 2)) == 2

#@3b


# 3c. Find the sum of all elements of this vector. -----------------------------
?qelp::sum

#3c@

sum(c(6, 3, 2)) == 11

#@3c


# 3d. Multiply a scalar and a vector. ------------------------------------------

#3d@

100 * c(6, 3, 2) == c(600, 300, 200)

#@3d


# 3e. Divide two vectors. ------------------------------------------------------

#3e@

c(6, 3, 2) / c(2, 3, 1) == c(3, 1, 2)

#@3e

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                              -----  Length -----

# Vectors have a property called *length*, which is the number of elements in
# that vector. The length of the vector c("apple", "banana", "economics") is 3
# because that vector has 3 elements.

length(c("apple", "banana", "economics")) == 3

# 4. Create a vector of length 5. It can be a character vector or --------------
# a numeric vector.

#4@

length(c(1,2,3,4,5)) == 5

#@4

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                    -----  More Ways to Create Vectors -----
#
# 5. If you want to create a vector of consecutive numbers like ----------------
#    'c(1, 2, 3)', the shorthand is '1:3'.

c(1, 2, 3) == 1:3

#5@

c(2, 3, 4) == 2:4

#@5


# To create a vector with elements that are repeated, use 'rep':
?qelp::rep

# This repeats 1 five times, 2 five times, and then 3 five times.

rep(1:3, each = 5)


# To create a vector that does random sampling, use 'sample':
?qelp::sample

# This randomly draws 0's or 1's to create a random vector of length 10.
sample(c(0, 1), size = 10, replace = TRUE)

# 6. Create a random character vector that draws "heads" or "tails". -----------

#6@

sample(c("heads", "tails"), size = 5, replace = TRUE)

#@6

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Great work! You're one step closer to tidyverse enlightenment. Make sure to
# return to this topic to meditate on it later.

# If you're ready, you can move on to the next koan: Tibbles.
