# is a float or integer?
if [[ $1 =~ ^[-+]?[0-9]+\.?[0-9]*$ ]]; then
    echo "digit"
fi


# is an integer
if [[ $1 =~ ^[[:digit:]]+$ ]]; then
    echo "digit"
fi

aaa=$((050 + 0))
echo $aaa


# is not an integer
if [[ ! $2 =~ ^[[:digit:]]+$ ]]; then
    echo "not digit"
fi

# -----------------

if [[ $3 = *[[:digit:]]* ]]; then
    echo "contains"
    # $3 does it contain a number
else
    echo "not contain"
    # $3 doesnt contain a number
fi

# ---------------

# One approach is to use a regular expression, like so:

# re='^[0-9]+$'
# if ! [[ $yournumber =~ $re ]] ; then
#    echo "error: Not a number" >&2; exit 1
# fi
# If the value is not necessarily an integer, consider amending the regex appropriately; for instance:

# ^[0-9]+([.][0-9]+)?$
# ...or, to handle numbers with a sign:

# ^[+-]?[0-9]+([.][0-9]+)?$


# ---------------------------------------


# case $string in
#     ''|*[!0-9]*) echo bad ;;
#     *) echo good ;;
# esac