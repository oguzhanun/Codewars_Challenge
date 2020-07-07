# Description:
# It's pretty straightforward. Your goal is to create a function that removes the first and last
# characters of a string. You're given one parameter, the original string. You don't have to worry 
# with strings with less than two characters.


function removeChar() {
  a=${1}
  echo ${a[@]:1:-1}
}
removeChar $1



# -------OTHERS SOLUTION---------
# function removeChar() {
#     echo ${1:1:-1}
# }
# removeChar $1