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
	echo ".......SINGLET......." 
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

#Function for doublet
function doublet() {
	echo ".......DOUBlET......."
	readValue
	HH=0
	TH=0
	HT=0
	TT=0
	for (( flip=1; flip<=noOfTimeFlipCoin; flip++ ))
	do
		randomFlip1=$((RANDOM%2))
		randomFlip2=$((RANDOM%2))

		if [[ $randomFlip1 -eq $HEAD && $randomFlip2 -eq $HEAD ]]
		then
			((HH+))
		elif [[ $randomFlip1 -eq $TAIL && $randomFlip2 -eq $HEAD ]]
		then
			((TH++))
		elif [[ $randomFlip1 -eq $HEAD && $randomFlip2 -eq $TAIL ]]
		then
			((HT++))
		elif [[ $randomFlip1 -eq $TAIL && $randomFlip2 -eq $TAIL ]]
		then
			((TT++))
		fi
	done

	perHH="$HH *100 / $noOfTimesFlipCoin"
	perTH="$TH *100 / $noOfTimesFlipCoin"
	perHT="$HT *100 / $noOfTimesFlipCoin"
	perTT="$TT *100 / $noOfTimesFlipCoin"

	doublet[perHH]=$perHH
	doublet[perTH]=$perTH
	doublet[perHT]=$perHT
	doublet[perTT]=$perTT

	#Printing key value pairs
	for key in "${!doublet[@]}"
	do
		echo "$key : ${doublet[$key]}"
	done
}

displayHeadTail
singlet
doublet
