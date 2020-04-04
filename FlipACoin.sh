#!/bin/bash -x

#Function to display head or tail
function displayHeadTail() {
	randomCheck=$((RANDOM%2))

	if [[ $randomCheck -eq 1 ]]
	then
		echo "Head"
	else
		echo "Tail"
	fi
}

displayHeadTail
