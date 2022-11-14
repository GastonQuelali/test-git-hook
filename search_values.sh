#! /bin/bash
if [[ ! -f "$1" ]]; then
	echo -e "Filename is not found";
	exit 1;
fi
if [[ ! -d "$2" ]]; then
	echo -e "Folder is not found";
	exit 1;
fi
#Delete the content of  result.txt
cat /dev/null > result.txt

echo -e "\n\nSearch script: $0";
echo -e "Source File: $1\n" ;
echo -e "Path seracrh destination folder: $2\n" ;
text=""
while IFS= read -r line || [ -n "$line" ]; do
	text="${line#*: \'}"
	text="${text%*\',}"
	if [[ $text != $line ]]; then
		file_name="${1##*/}";
		#echo -e "file name $file_name";
		#./search_script.sh "$text" $2 $file_name
		grep --exclude=$file_name --color=always -H -rw "$text" $2 >> result.txt;
		echo "================================================================================" >> result.txt
	fi
done < $1
echo -e "\n\n***************************** VIEW FILE  result.txt *********************************\n"
echo -e "RESULTS OF THE SOURCE FILE SEARCH $1 \n"
cat ./result.txt

# ./search_values.sh source_folder/launchMeter.ts destination_folder/
# ./search_values.sh destination_folder/launchMeter1.ts destination_folder/
