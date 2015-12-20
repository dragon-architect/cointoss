#! /bin/bash

# Creator:  Calyo Delphi
# Syntax:   cointoss [<tosses>]
# About:    Tosses a coin the specified number of <tosses>. If no number specified, tosses once

# Initialize variables (this habit is a holdover from C++ classes years ago):
RANDOM=$$       # Seed RANDOM with PID
heads=0         # No heads counted yet
tails=0         # No tails counted yet
alltosses=""    # No tosses recorded yet

if [[ $1 ]]; then   # If input is provided...
    tosses=$1       # Assign input to tosses variable
    
    # Calculate the number of heads/tails needed to win a toss:
    half=$(( $tosses / 2 + 1 ))
    
    # And output this number vs. the input:
    echo "Best $half out of $tosses?"
else    # Else, toss a coin once...
    echo "Tossing a coin!"
    tosses="1"
fi

# Loop through all of the tosses
# Had to use C-style syntax because {start..end} doesn't work with variables =_=
for (( i=1; i <= $tosses; i++ )); do
    # Pick a random number, then assign the modulus of division by 2
    val=$(( $RANDOM % 2 ))
    
    if [ $val == '1' ]; then    # If the modulus is 1, toss is heads:
        # Add to list of recorded tosses with a tab for spacing
        alltosses="${alltosses}Heads!\t"
        
        # Increment the count of heads
        heads=$(( $heads + 1 ))
    else    # Else, modulus is 0, toss is tails:
        # Add to list of recorded tosses with a tab for spacing
        alltosses="${alltosses}Tails!\t"
        
        # Increment the count of tails
        tails=$(( $tails + 1 ))
    fi
    
    # For every five lines, add a newline for spacing, except for the very last line:
    if [[ $(( $i % 5 )) -eq 0 && $(( $tosses - $i )) -ne 0 ]]; then
        alltosses="${alltosses}\n"
    fi
done    # End loop

# Echo the list of tosses
# -e ensures the escaped tabs & newlines are properly interpreted
echo -e $alltosses

# It's easy to count heads & tails for <=10 tosses
# When there are >10 tosses, output a count of heads & tails
if [[ $tosses -gt 10 ]]; then
    echo   # Blank line for neatness
    echo -e "Heads:\t$heads\nTails:\t$tails"
fi

# If the coin is tossed once, no need to say which side wins
# So this block executes only if the coin is tossed >1 times
if [[ $tosses -ne 1 ]]; then
    if [[ $heads -gt $tails ]]; then    # If heads > tails, then heads wins
        echo "Heads wins!"
    elif [[ $tails -gt $heads ]]; then  # Else if tails > heads, then tails wins
        echo "Tails wins!"
    else    # Otherwise, it's a tie (only possible for even inputs)
        echo "It's a tie!"
    fi
fi

