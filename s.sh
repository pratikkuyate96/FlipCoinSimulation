read -p "Enter the number of times coin flipped - " num

hhh=0

htt=0

tht=0

hht=0

thh=0

hth=0

tth=0

ttt=0

for (( i=0; i<$num; i++ ))

do

    coins=$(( RANDOM%8))

      case $coins in

					0 )

						((hhh++)) ;;

					1 )

						((htt++)) ;;

					2 )

						((tht++)) ;;

					3 )

						((hht++)) ;;

					4 )

						((thh++)) ;;

					5 )

						((tth++)) ;;

					6 )

						((hth++)) ;;

					7 )

						((ttt++)) ;;

					* )

						echo "Default" ;;

		esac

done

declare -A coin

 coin[HHH]=$hhh

 coin[HTT]=$htt

 coin[THT]=$tht  

 coin[HHT]=$hht

 coin[THH]=$thh

 coin[TTH]=$tth

 coin[HTH]=$hth  

 coin[TTT]=$ttt

	echo "Coin Signs-" ${!coin[@]}

	echo "Coin Values-" ${coin[@]} 

hhh1=$(($hhh*100))

hhhPercent=$(( $hhh1/$num ))

htt1=$(($htt*100))

httPercent=$(( $htt1/$num ))

tht1=$(($tht*100))

thtPercent=$(( $tht1/$num ))

hht1=$(($hht*100))

hhtPercent=$(( $htt1/$num ))

thh1=$(($thh*100))

thhPercent=$(( $thh1/$num ))

tth1=$(($tth*100))

tthPercent=$(( $tth1/$num ))

hth1=$(($hth*100))

hthPercent=$(( $hth1/$num ))

ttt1=$(($ttt*100))

tttPercent=$(( $ttt1/$num ))

echo "HHH Percentage- $hhhPercent"

echo "HTH Percentage- $hthPercent"

echo "THT Percentage- $thtPercent"

echo "HTT Percentage- $httPercent"

echo "HHT Percentage- $hhtPercent"

echo "TTH Percentage- $tthPercent"

echo "THH Percentage- $thhPercent"

echo "TTT Percentage- $tttPercent"
