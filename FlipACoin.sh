#!/bin/bash

#Constant
HEAD=1
TAIL=0

declare -A singlet

#Function
function readValue() {
	read -p "Enter how many times flip the coin : " noOfTimeFlipCoin
}

#Function to display head or tail
function displayHeadTail() {
	randomFlip=$((RANDOM%2))

	if [[ $randomFlip -eq $HEAD ]]
	then
		echo "Head"
	else
		echo "Tail"
	fi
}

function singlet() {
	readValue
	countHead=0
	countTail=0
	for (( flip=1; flip<=noOfTimeFlipCoin; flip++ ))
	do
		randomFlip=$((RANDOM%2))
		if [ $randomFlip -eq $HEAD ]
		then
			((countHead++))
		else
			((countTail++))
		fi
	done
	#Calculate head and tail percent
	headPercent="$countHead *100 / $noOfTimeFlipCoin"
	tailPercent="$countTail *100 / $noOfTimeFlipCoin"
	#Store head and tail percentage in dictionary
	singlet[headPer]=$headPercent
	singlet[tailPer]=$tailPercent
	#Display head and tail percentage
	echo "headPer : " ${singlet[headPer]}
	echo "tailPer : " ${singlet[tailPer]}

	echo $singlet
}

displayHeadTail
singlet
