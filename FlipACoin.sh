#!/bin/bash

#Constant
HEAD=1

#Dictionarys
declare -A singletDictionary
declare -A doubletDictionary
declare -A tripletDictionary

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
	singletDictionary[headPer]=$headPercent
	singletDictionary[tailPer]=$tailPercent
	#Display head and tail percentage
	echo "headPer : " ${singlet[headPer]}
	echo "tailPer : " ${singlet[tailPer]}

	echo $singletDictionary
	singletWinComb
}

#Function to find singlet winning combination
function singletWinComb() {
	maxPercent=0
	for percent in "${singletDictionary[@]}"
	do
		greater=$(echo "$percent > $maxPercent" | bc -q)
		if [ $greater -eq 1 ]
		then
			maxPercent=$percent
		fi
	done
	winCount=0
	for comb in "${!singletDictionary[@]}"
	do
		equal=$(echo "${singletDictionary[$comb]}==$maxPercent" | bc -q)
		if [ $equal -eq 1 ]
		then
			winningComb[((winCount++))]=$comb
		fi
	done
	echo "Winning Combination : ${winningComb[@]}"
}

#Function for doublet
function doublet() {
	echo ".......DOUBLET......."
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
			((HH++))
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

	perHH="$HH *100 / $noOfTimeFlipCoin"
	perTH="$TH *100 / $noOfTimeFlipCoin"
	perHT="$HT *100 / $noOfTimeFlipCoin"
	perTT="$TT *100 / $noOfTimeFlipCoin"

	doubletDictionary[perHH]=$perHH
	doubletDictionary[perTH]=$perTH
	doubletDictionary[perHT]=$perHT
	doubletDictionary[perTT]=$perTT

	#Printing key value pairs
	for key in "${!doubletDictionary[@]}"
	do
		echo "$key : ${doubletDictionary[$key]}"
	done
	echo $doubleDictionary
	doubletWinComb
}

#Function to find winning combination in doublet
function doubletWinComb() {
	maxPercent=0
	for percent  in "${doubletDictionary[@]}"
	do
		greater=$(echo "$percent > $maxPercent" | bc -q)
		if [ $greater -eq 1 ]
		then
			maxPercent=$percent
		fi
	done
	winCount=0
	for comb in "${!doubletDictionary[@]}"
	do
		equal=$(echo "${doubletDictionary[$comb]}==$maxPercent" | bc -q)
		if [ $equal -eq 1 ]
		then
			winningCombs[((winCount++))]=$comb
		fi
	done
	echo "Winning Doublet Combination : ${winningComb[@]}"
}

#Funtion for triplet
function triplet() {
	echo ".......TRIPLET......."
	readValue
	HHH=0
	HHT=0
	HTH=0
	THH=0
	HTT=0
	THT=0
	TTH=0
	TTT=0

	for (( flip=1; flip<=$noOfTimeFlipCoin; flip++ ))
	do
	 	randomFlip1="$((RANDOM%2))"
	   randomFlip2="$((RANDOM%2))"
  		randomFlip3="$((RANDOM%2))"

		if [[ $randomFlip1 -eq $HEAD && $randomFlip2 -eq $HEAD && $randomFlip3 -eq $HEAD ]]
		then
			((HHH++))
		elif [[ $randomFlip1 -eq $HEAD && $randomFlip2 -eq $HEAD && $randomFlip3 -eq $TAIL ]]
		then
			((HHT++))
		elif [[ $randomFlip1 -eq $HEAD && $randomFlip2 -eq $TAIL && $randomFlip3 -eq $HEAD ]]
		then
			((HTH++))
		elif [[ $randomFlip1 -eq $TAIL && $randomFlip2 -eq $HEAD && $randomFlip3 -eq $HEAD ]]
		then
			((THH++))
		elif [[ $randomFlip1 -eq $HEAD && $randomFlip2 -eq $TAIL && $randomFlip3 -eq $TAIL ]]
		then
			((HTT++))
		elif [[ $randomFlip1 -eq $TAIL && $randomFlip2 -eq $HEAD && $randomFlip3 -eq $TAIL ]]
		then
			((THT++))
		elif [[ $randomFlip1 -eq $TAIL && $randomFlip2 -eq $TAIL && $randomFlip3 -eq $HEAD ]]
		then
			((TTH++))
		elif [[ $randomFlip1 -eq $TAIL && $randomFlip2 -eq $TAIL && $randomFlip3 -eq $TAIL ]]
		then
			((TTT++))
		fi
	done

	#Find percentage of combination
	perHHH="$HHH *100 / $noOfTimeFlipCoin"
	perHHT="$HHT *100 / $noOfTimeFlipCoin"
	perHTH="$HTH *100 / $noOfTimeFlipCoin"
	perTHH="$THH *100 / $noOfTimeFlipCoin"
	perHTT="$HTT *100 / $noOfTimeFlipCoin"
	perTHT="$THT *100 / $noOfTimeFlipCoin"
	perTTH="$TTH *100 / $noOfTimeFlipCoin"
	perTTT="$TTT *100 / $noOfTimeFlipCoin"

	#Store percentage of combination in dictionary
	triplateDictionary[perHHH]=$perHHH
	triplateDicitonary[perHHT]=$perHHT
	triplateDicitonary[perHTH]=$perHTH
	triplateDictionary[perTHH]=$perTHH
	triplateDictionary[perHTT]=$perHTT
	triplateDictionary[perTHT]=$perTHT
	triplateDictionary[perTTH]=$perTTH
	triplateDictionary[perTTT]=$perTTT

	for key in "${!triplateDictionary[@]}"
	do
		echo "$key : ${triplateDictionary[$key]}"
	done
	echo $tripletDictionary
	tripletWinComb
}

#Function to find winning combination in doublet
function tripletWinComb() {
	maxPercent=0
	for percent  in "${tripletDictionary[@]}"
	do
		greater=$(echo "$percent > $maxPercent" | bc -q)
		if [ $greater -eq 1 ]
		then
			maxPercent=$percent
		fi
	done
	winCount=0
	for comb in "${!tripletDictionary[@]}"
	do
		equal=$(echo "$tripletDictionary[$comb]}==$maxPercent" | bc -q)
		if [ $equal -eq 1 ]
		then
			winningCombs[((winCount++))]=$comb
		fi
	done
	echo "Winning Triplet Combination : ${winningCombs[@]}"
}

displayHeadTail
singlet
doublet
triplet
