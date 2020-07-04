# A child is playing with a ball on the nth floor of a tall building. The height of this floor, h, 
# is known.

# He drops the ball out of the window. The ball bounces (for example), to two-thirds of its height 
# (a bounce of 0.66).

# His mother looks out of a window 1.5 meters from the ground.

# How many times will the mother see the ball pass in front of her window (including when it's falling
# and bouncing?

# Three conditions must be met for a valid experiment:
# Float parameter "h" in meters must be greater than 0
# Float parameter "bounce" must be greater than 0 and less than 1
# Float parameter "window" must be less than h.
# If all three conditions above are fulfilled, return a positive integer, otherwise return -1.

# Note:
# The ball can only be seen if the height of the rebounding ball is strictly greater than the window 
# parameter.
# Example:
# - h = 3, bounce = 0.66, window = 1.5, result is 3
# - h = 3, bounce = 1, window = 1.5, result is -1 
# (Condition 2) not fulfilled).

#!/bin/bash
bouncingBall() {
    if [ $(echo "$1 > 0" | bc) == 1 -a $(echo "$2 < 1" | bc -l) == 1 -a $(echo "$2 > 0" | bc -l) == 1 -a $(echo "$3 < $1" | bc -l) == 1 ]; then
        height=$(echo "$1 * $2" | bc)
        counter=1
        while [ $(echo "$height > $3" | bc) == 1 ]; do
            counter=$(($counter+2))
            height=$(echo "$height * $2" | bc) 
            echo $height
        done
        echo $counter        
    else
        echo -1
    fi

    echo $(("hello"+5))
}
bouncingBall $1 $2 $3


# https://www.codewars.com/kata/5544c7a5cb454edb3c000047/train/shell
# This can be done more conveniently using Bash's numeric context:

# if (( $(echo "$num1 > $num2" |bc -l) )); then
#   …
# fi
# Explanation
# Piping through the basic calculator command bc returns either 1 or 0.

# The option -l is equivalent to --mathlib; it loads the standard math library.

# Enclosing the whole expression between double parenthesis (( )) will translate these values to
#  respectively true or false.

# Please, ensure that the bc basic calculator package is installed.

# This equally works for floats in scientific format, provided a capital letter E is employed,
#  e.g. num1=3.44E6
