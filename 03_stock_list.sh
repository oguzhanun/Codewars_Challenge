# A bookseller has lots of books classified in 26 categories labeled A, B, ... Z. 
# Each book has a code c of 3, 4, 5 or more capitals letters. The 1st letter of a 
# code is the capital letter of the book category. In the bookseller's stocklist each code 
# c is followed by a space and by a positive integer n (int n >= 0) which indicates the
#  quantity of books of this code in stock.

# For example an extract of one of the stocklists could be:

# L = {"ABART 20", "CDXEF 50", "BKWRK 25", "BTSQZ 89", "DRTYM 60"}.
# or

# L = ["ABART 20", "CDXEF 50", "BKWRK 25", "BTSQZ 89", "DRTYM 60"] or ....
# You will be given a stocklist (e.g. : L) and a list of categories in capital letters e.g :

#   M = {"A", "B", "C", "W"} 
# or

#   M = ["A", "B", "C", "W"] or ...
# and your task is to find all the books of L with codes belonging to each category of M and to sum 
# their quantity according to each category.

# For the lists L and M of example you have to return the string (in Haskell/Clojure/Racket a 
# list of pairs):

#   (A : 20) - (B : 114) - (C : 50) - (W : 0)
# where A, B, C, W are the categories, 20 is the sum of the unique book of category A, 114 the 
# sum corresponding to "BKWRK" and "BTSQZ", 50 corresponding to "CDXEF" and 0 to category 'W' 
# since there are no code beginning with W.

# If L or M are empty return string is "" (Clojure and Racket should return an empty array/list instead).

# Note:
# In the result codes and their values are in the same order as in M.

#!/bin/bash
stock_list () {

    # declare -a liste=("a","b","c")
    #echo "${1}" #  "!" spreads the elements in the array of first argument
    #echo "${liste[@]}"
    
    
    
    for i in "${arr[@]}"; do
        echo $i
        echo "\n"
    done

}

#echo $(echo $@) # for collecting the command line arguments

declare -a arr="${@}"  # this brings all the arguments in one variable 
echo $arr

IFS=' ' read -ra ADDR <<< "$arr"  # IFS is internal field seperator. <<< this is called "here" and gives
                                  # the document at its right side to the command at its left side.       
for i in "${ADDR[@]}"; do
    echo ${i:0:1}
done

stock_list "$arr" 

# https://www.codewars.com/kata/54dc6f5a224c26032800005c/train/shell
# arg1="$1"
# arg2=("${!2}")
# arg3="$3"
# arg4=("${!4}")

# echo "arg1=$arg1"
# echo "arg2 array=${arg2[@]}"
# echo "arg2 #elem=${#arg2[@]}"
# echo "arg3=$arg3"
# echo "arg4 array=${arg4[@]}"
# echo "arg4 #elem=${#arg4[@]}"


# #!/bin/bash
# input="/path/to/txt/file"
# while IFS= read -r line
# do
#   echo "$line"
# done < "$input"

# The input file ($input) is the name of the file you need use by the read command. The read command 
# reads the file line by line, assigning each line to the $line bash shell variable. Once all lines are ,
# read from the file the bash while loop will stop. The internal field separator (IFS) is set to the empty
# string to preserve whitespace issues. This is a fail-safe feature.


# Simple as this.

# (bash)

# for i in * ; do mv -- "$i" "${i:0:5}" ; done
# Voila.

# And an explanation from Advanced Bash-Scripting Guide (Chapter 10. Manipulating Variables), (with extra 
# NOTEs inline to highlight the errors in that manual):

# Substring Extraction

# ${string:position}
# Extracts substring from $string at $position.

# If the $string parameter is "*" or "@", then this extracts the positional parameters, 
# starting at $position.

# ${string:position:length}
# Extracts $length characters of substring from $string at $position.

# NOTE missing quotes around parameter expansions! echo should not be used for arbitrary data.



#!/bin/bash
stock_list () {

    declare -a array=("")
    
    IFS="," read -ra str2 <<< $2
    for z in ${!str2[@]} ; do
      array[z]=${str2[z]}
    done
    
    declare -a array2=("")
    declare -a array3=("")
    IFS="," read -ra str1 <<< $1
    
    for i in ${!str1[@]}; do 
      array2[i]=${str1[i]}
    done
    let counter=0
    IFS=" " read -ra str4 <<< ${array2[@]}
    for t in ${str4[@]}; do
      if [[ $t =~ ^[[:digit:]]+$ ]]; then
        array3[counter]=$t
        counter=$((counter+1))
      fi
      
    done
    echo ${array[@]}
    echo ${array2[@]}
    echo ${!array3[@]}
    
}
stock_list "$1" "$2"


################# SOLUTIONS ###################
####### MINE ##############
# #!/bin/bash
# stock_list () {

#     if [ "$1" == "" -o "$2" == "" ]; then
#       echo ""
#     else
    
#       declare -a array=("")
      
#       IFS="," read -ra str2 <<< $2
#       for z in ${!str2[@]} ; do
#         array[z]=${str2[z]}
#       done
      
#       declare -a array2=("")
#       declare -a array3=("")
#       IFS="," read -ra str1 <<< $1
      
#       for i in ${!str1[@]}; do 
#         array2[i]=${str1[i]}
#       done
#       let counter=0
#       IFS=" " read -ra str4 <<< ${array2[@]}
#       for t in ${str4[@]}; do
#         if [[ $t =~ ^[[:digit:]]+$ ]]; then
#           array3[counter]=$t
#           counter=$((counter+1))
#         fi    
#       done

#       declare -a array4=("")
      
#       for i in ${!array2[@]}; do 
#         for t in ${!array[@]}; do
#           if [ "${array2[i]:0:1}" == "${array[t]}" ]; then
#             a=$(echo "${array4[t]}" | bc )  # this is for getting rid of the leading zeros which cause miscalculations in bash
#             b=$(echo "${array3[i]}" | bc )
#             array4[t]=$((a + b))
            
#           else
#             array4[t]=$((0 + array4[t]))
#           fi
#         done
#       done
#       #echo ${array4[@]}
#       for i in ${!array4[*]}; do
#         printf " (${array[i]} : ${array4[i]})"
#         if [ $i != $((${#array4[@]} - 1)) ]; then
#           printf " -"
#         fi
#       done
#     fi
    
    
    
# }
# stock_list "$1" "$2"

######## OTHER ############

# #!/bin/bash
# sol='
# from sys import argv
# def sol(slistOfArt, slistOfCat):
#     if (len(slistOfArt) == 0) or (len(slistOfCat) == 0):
#         return ""
#     listOfArt = slistOfArt.split(",")
#     listOfCat = slistOfCat.split(",")
#     result = ""
#     for cat in listOfCat:
#         total = 0
#         for book in listOfArt:
#             if (book[0] == cat[0]): 
#                 total += int(book.split(" ")[1])
#         if (len(result) != 0):
#             result += " - "
#         result += "(" + str(cat) + " : " + str(total) + ")"
#     return result
# a=sol(argv[1:][0], argv[1:][1])
# print a
# '
# stock_list () {
#     echo `python -c "$sol" "$1" "$2"`
# }
# stock_list "$1" "$2"