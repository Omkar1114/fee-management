#!/bin/bash


declare -A cost students
cost=([COMP]=1000 [ELEC]=2000 [IT]=3000 [EXTC]=5000)

out_file()
{

	echo "Name=$name|Amount due=$remaining|Date-$NOW" >> $name
}

show_menus() {
	echo "                                                                                            "
	echo "~~~~~~~~~~~~~~~~~~~~~"	
	echo " M A I N - M E N U"
	echo "~~~~~~~~~~~~~~~~~~~~~"
	echo "1. NEW ADMISSION"
	echo "2. PAY DUE"
	echo "3.Exit"
}

read_options(){
	local choice
	read -p "Enter choice [ 1 - 3] " choice
	case $choice in
		1) one ;;
		2) two ;;
		3) exit 0;;
		*) echo  "Error..." && sleep 2
	esac
}

one(){
	echo "Enter the full name"
	read name

	name=${name%% *}

	echo "Enter the branch of choice"
	read branch

	echo "Fee of the chosen branch is ${cost[$branch]}" 
	
	students[$name]=${cost[$branch]}

	NOW=$(date +"%m-%d-%Y %H:%M")		

	remaining=${cost[$branch]}

	out_file $name remaining $NOW

	
}

two(){
	echo "Enter Student's name"
    read first

    first=${first%% *}
    
    echo "Amount due is ${students[$first]}"
    
    echo "Enter the amount received"
    read amount
    
    echo "Entered amount is being deducted from the total amount"
    students[$first]=$(( students[$first] - amount ))

    NOW=$(date +"%m-%d-%Y %H:%M")

    remaining=${students[$first]}

    out_file $first $remaining $NOW

    
    echo "$first 's remaining amount is ${students[$first]} "

   	
}


while true
do
 
	show_menus
	read_options
done
