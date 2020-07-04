# Your granny, who lives in town X0, has friends. These friends are given in an array, for example: array
# of friends is

# [ "A1", "A2", "A3", "A4", "A5" ].
# The order of friends is this array must not be changed since this order gives the order in which they 
# will be visited.

# These friends inhabit towns and you have an array with friends and towns, for example:

# [ ["A1", "X1"], ["A2", "X2"], ["A3", "X3"], ["A4", "X4"] ]
# or
# [ ("A1", "X1"), ("A2", "X2"), ("A3", "X3"), ("A4", "X4") ]
# or
# (C)
# {"A1", "X1", "A2", "X2", "A3", "X3", "A4", "X4"}
# which means A1 is in town X1, A2 in town X2... It can happen that we don't know the town of one of the 
# friends.

# Your granny wants to visit her friends and to know how many miles she will have to travel.

# You will make the circuit that permits her to visit her friends. For example here the circuit will contain:

# X0, X1, X2, X3, X4, X0 
# and you must compute the total distance

# X0X1 + X1X2 + .. + X4X0.
# For the distance, fortunately, you have a map (and a hashmap) that gives each distance X0X1, X0X2 and so on. 
# For example:

# [ ["X1", 100.0], ["X2", 200.0], ["X3", 250.0], ["X4", 300.0] ]
# or
# Map("X1" -> 100.0, "X2" -> 200.0, "X3" -> 250.0, "X4" -> 300.0)
# or (Coffeescript, Javascript)
# ['X1',100.0, 'X2',200.0, 'X3',250.0, 'X4',300.0 ]
# or
# (C)
# {"X1", "100.0", "X2", "200.0", "X3", "250.0", "X4", "300.0"}
# which means that X1 is at 100.0 miles from X0, X2 at 200.0 miles from X0, etc...

# More fortunately (it's not real life, it's a story...), the towns X0, X1, ..Xn are placed in the 
# following manner:

# X0X1X2 is a right triangle with the right angle in X1, X0X2X3 is a right triangle with the right angle
# in X2, etc...

# If a town Xi is not visited you will suppose that the triangle

# X0Xi-1Xi+1 is still a right triangle.

# (Ref: https://en.wikipedia.org/wiki/Pythagoras#Pythagorean_theorem)

# Task
# Can you help your granny and give her the distance to travel?

# Notes
# If you have some difficulty to see the tour I made a non terrific but maybe useful drawing:

# alternative text

# All languages
# See the data type of the parameters in the examples test cases.

# Towns can have other names that X0, X1, X2, ... Xn

# "tour" returns an int which is the floor of the total distance.

# https://www.codewars.com/kata/5536a85b6ed4ee5a78000035/train/shell

#!/bin/bash
tour () {

    IFS=" " read -ra arr1 <<< $1

    index1=$((${#arr1[@]}*2-1))  # first array's (index * 2 -1)
    
    #exists=0
    
    IFS=" " read -ra arr2 <<< $2
    

    #   first part...
    

    index2=$((${#arr2[@]}-1))


    # third part


    IFS=" " read -ra arr <<< $3
    last_index=$((${#arr[@]}-1))

    echo $last_index
    toplam=0
    i=0
    while (( $i < ${#arr[@]} )); do   # If you dont provide (( )), it s not working properly. DONT PUT [[ ]] FOR NUMBERS...
      if [[ ${arr[$i]} =~ ^[-+]?[0-9]+\.?[0-9]*$ ]]; then
        if (( $i < $last_index )); then

          coming_index=$(($i+2))
          echo $i
          echo ${arr[$coming_index-1]}
          echo ${arr2[@]}
          echo ${arr2[$coming_index-1]}
          echo ${arr1[@]}
          
          while (( $coming_index < ${#arr[@]} )); do
            if [[ "${arr2[@]}" != *"${arr[$coming_index-1]}"* ]]; then  # COMING INDEX SHOULD BE FOUND CORRECTLY 
              coming_index=$(($coming_index+2))                         # TO DO THAT YOU SHOULD WANDER TILL THE END...
            elif [[ "${arr1[@]}" != *"${arr2[$coming_index-1]}"* ]]; then
              coming_index=$(($coming_index+2))
            else
              echo 'break'
              break
            fi
          done
          echo $coming_index coming

          if (( $coming_index > $last_index )); then  # If you are using numbers in the comparison use (()) 
            echo "second break"
            last_index=$i
            break
          fi

          temp1=$(echo "(${arr[$coming_index]} * ${arr[$coming_index]})" | bc -l)
          temp2=$(echo "(${arr[$i]} * ${arr[$i]})" | bc -l)
          temp=$(echo "$temp1-$temp2" | bc )
          toplam=$(echo "$(echo "sqrt($temp)" | bc -l) + $toplam" | bc -l)
        fi
      
      else
        if [[ "${arr2[@]}" != *"${arr[$i]}"* ]]; then  # the position of the * sign is important. they shouldn't be inside "".
          i=$(($i+2))  
        else
          if [[ "${arr1[@]}" != *"${arr2[$i]}"* ]]; then
            i=$(($i+2))
          fi
        fi
      fi
      #echo $i
      i=$(($i+1))
      #echo $i
    done

    echo $(echo "$toplam + ${arr[1]} + ${arr[$last_index]}" | bc -l )
}

A="B1 B2"
B="B1 Y1 B2 Y2 B3 Y3 B4 Y4 B5 Y5"
C="Y1 50.0 Y2 70.0 Y3 90.0 Y4 110.0 Y5 150.0"

tour "$A" "$B" "$C"


# for i in ${#arr2[@]}; do
#       for t in ${arr1[@]}; do
#         if [[ "${arr2[$i]:1}" == "${t:1}" ]]; then
#           exists="1"
          
#         fi
#       done
      
#       if [[ "$exists" == "0" ]]; then
#         connection=$(($i+2))
#         arr2=(${arr2[@]:0:$i} ${arr2[@]}:$connection)
#       fi
#       exists="0"
#     done





# else
#         exists2=0
#         for t in ${arr2[@]}; do 
#           if [[ "${arr[$i]:1}" == "${t:1}" ]]; then
#             exists2=1
#           fi
#         done
#         if [[ $exists2 == 0 ]]; then
#           connection=$(($i+2))
#           arr=("${arr[@]:0:$i}" "${arr[@]:$connection}")
#         fi







# array=($(echo $3)) # This gives an array if the string is in proper shape