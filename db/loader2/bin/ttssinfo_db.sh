#!/bin/bash
set -e
echo_on=1
myecho() {
  if (( "$echo_on" == "1" )); then
    echo "$*"
  else
   WriteToLog "$*"
  fi
}

usage="Usage:  ${0##*/}  \"input_location\" \"archive_location\" \"schema_name\" \"server_name\" \"port\"  \"user_name\" \"password\" [-doubleunzip] " 

if [[ $# < 7 ]]; then
    myecho $usage
    exit 1
fi

bin=`dirname "${BASH_SOURCE-$0}"`
bin=`cd "$bin">/dev/null; pwd`
dir_db=$bin/db

#set input/output location; default if paramater is empty string 
input_location=${1:-$bin/../result}
myecho input_location=$input_location
shift

output_location=${1:-$bin/../../archive}
myecho output_location=$output_location
shift

schema_name=${1:-kpi_tmo_test}
myecho schema_name=$schema_name
shift

serv_name=${1:-10.26.126.78}
myecho serv_name=$serv_name
shift

port=${1:-3306}
myecho port=$port
shift

user_name=${1:-user_boinc}
myecho user_name=$user_name
shift

password=${1:-Boinc@94588}
myecho password=$password
shift


USEDOUBLEUNZIP=0

#optional auguments
for i in "$@"
do
  case "${i^^}" in #use uppercase
	-DOUBLEUNZIP)
		USEDOUBLEUNZIP=1
		myecho use doubleunzip
		shift
		;;
	-X)
		USEX=1
		myecho use x
		shift
		;;
	-Y)	
		USEY=1
		myecho use y
		shift
		;;
	*)
		;;
  esac
done
 
#create log
#start
proc_log=$input_location/dbprocess.log
#remove an old one and create a new error log
if [ -f "$proc_log" ]; then
  rm -f "$proc_log"
fi

touch "$proc_log"
if [ -e "$proc_log" ]; then 
   echo_on=0
fi 

WriteToLog() {
  echo -n \[`date +%Y-%m-%d$' '%H:%M:%S `\] >> "$proc_log"
  echo  "  $1" >> "$proc_log"
}

exit_proc() {

  mv "$unzip_folder/$file_to_unzip" "$output_location"
  exit_code=${1:-0}
  local bremove=1

  if [ ! -d "$unzip_folder_sub" ]; then
    res_folder="$input_location"
    bremove=0
  else
    res_folder="$unzip_folder_sub"
  fi

  if [ -z "$file_to_unzip" ]; then
    zip_pathname="$input_location/result.zip"
  else
    zip_pathname="$input_location/$file_to_unzip"
  fi

  cd "$res_folder"
  mv "$proc_log" "$res_folder"
  zip -g -r "$zip_pathname" *
 
  #my myecho Moving result zip file $zip_pathname \=\=\>\> $output_loc
  if [ ! -d "$output_location" ]; then 
      mkdir "$output_location"
  fi 
  mv "$zip_pathname" "$output_location"
 
  #my myecho Cleaning up files...
  if [[ $bremove == 1 ]]; then
    cd "$res_folder/.."
    rm -rf *
  fi

  exit $exit_code
}

unset file_to_unzip
CheckInputFolder() {
    unset file_to_unzip
    local failed_msg=""
    if [ -d "$1" ]; then
	for i in $(ls -A "$1"); do
            # myecho "$i"
	    if [[ $i == *.zip ]]; then
		file_to_unzip=$i
                myecho found zipfile $file_to_unzip		
		break
	    fi
	done
	if [ -z "$file_to_unzip" ]; then
	    failed_msg="No zip file found in the given directory: $input_location"
	fi
    else
	failed_meg="The given directory $input_location doesn't exist!"
    fi

    if [ -z "$file_to_unzip" ]; then
	  myecho "Error mag - $failed_msg"
	  myecho "Process Terminated."
	  exit 1
    fi
}

#check input folder
myecho CheckInputFolder :$input_location
CheckInputFolder "$input_location"
 
#do doubleunzip 
if (( $USEDOUBLEUNZIP == 1 )); then
     myecho Double unzip start ...
     myecho Unzipping file: $input_location/$file_to_unzip
     #unzip -o "$input_location/$file_to_unzip" -d "$input_location"
     7za x -y "$input_location/$file_to_unzip" -o"$input_location"


    if (( $? > 0 )); then
	myecho "Unzipping $fileToUnzip failed."
	myecho "Process Terminated."
	exit 1
    else
	rm -f "$input_location/$file_to_unzip"
	myecho Unzipping doublezip file: Success
    fi 
fi    

#do normal unzip
#setup unzip directory
CheckInputFolder "$input_location"
#myfilename=${file_to_unzip##/*/}
zipfilename=${file_to_unzip%.zip}
unzip_folder=$input_location
unzip_folder_sub=$unzip_folder
#/$zipfilename

myecho "archiving zipfile $input_location/$file_to_unzip to $output_location"
cp -p "$input_location/$file_to_unzip" "$output_location"

myecho "unzipping zipfile $input_location/$file_to_unzip to $unzip_folder"
#unzip -o "$input_location/$file_to_unzip" -d "$unzip_folder" 
7za x -y "$input_location/$file_to_unzip" -o"$unzip_folder"
# -ir\!*.txt *status.log

if (( $? > 0 )); then
  myecho "Unzipping $file_to_unzip failed."
  myecho "Process Terminated."
  exit 1
else
  myecho Unzipping"$input_location/$file_to_unzip" : Success
  rm -f "$input_location/$file_to_unzip"
fi

if [ ! -d "$unzip_folder_sub" ]; then
    myecho "unzipped folder doesn't exist: $unzip_folder_sub"
    myecho "Process Terminated."
    exit 1    
fi

#file_inputlog="$bin/../${file_to_unzip%.zip}.log"
#touch "$file_inputlog"

file_maintoken_unzip="$unzip_folder_sub/Token.txt"

#reading token file
 myecho "Reading token file : $file_maintoken_unzip "
if [ -e "$file_maintoken_unzip" ]; then
  while read -r line || [[ -n "$line" ]] ; do
    #IFS='|' read -ra MyTokens <<< "$line"
    line2=${line//$'\n'}    
    line=${line2//$'\r'}
    line=${line// /_}
    MyTokens=(${line//|/ })
    if [[ ${MyTokens[0]} =~ GENERALINFO:* ]]; then
      sinfo_vendor=${MyTokens[1],,} #to lower case => ${string,,}
      sinfo_carrier=${MyTokens[3],,}
      sinfo_market=${MyTokens[6],,}
      sinfo_tech=${MyTokens[7],,}	
    fi
    #if [[ ${MyTokens[0]} =~ STD_DEV:* ]]; then
    #fi
  done < "$file_maintoken_unzip"	
else
  myecho "Token file $file_maintoken_unzip cannot be found."
  myecho "Process Terminated."
  exit 1
fi 

if [ -n $sinfo_vendor ] && [ -n $sinfo_carrier ] && [ -n $sinfo_market ] && [ -n $sinfo_tech ]
then
  myecho "vendor=$sinfo_vendor,carrier=$sinfo_carrier,market=$sinfo_market,tech=$sinfo_tech"
else
  myecho "Token file $file_maintoken_unzip corrupted."
  tokens="vendor=$sinfo_vendor,carrier=$sinfo_carrier,market=$sinfo_market,tech=$sinfo_tech"
  myecho "$tokens" 
  myecho "Process Terminated."
  exit 1
fi


path_sinfodb_loader=$bin/${sinfo_carrier}_${sinfo_tech}_sinfo_sqlldr.sh
if [ -e "$path_sinfo_loader" ]; then
    myecho "No DB loader found in the specified path: $path_sinfodb_loader" 
    myecho "Process Terminated."
    exit 1
fi
myecho sinfo db loader : $path_sinfodb_loader


#go through db_load_status file
file_dbloadstatus_unzip="$unzip_folder_sub/db_load_status.log"
if [ -e "$file_dbloadstatus_unzip" ]; then
  while read -r line || [[ -n "$line" ]] ; do
    #IFS='|' read -ra MyTokens <<< "$line"
    line2=${line//$'\n'}    
    line=${line2//$'\r'}
    line=${line// /_}
    MyTokens=(${line//|/ })
    #if [[ ${MyTokens[0]} =~ GENERALINFO:* ]]; then
      cur_date=${MyTokens[1],,} #to lower case => ${string,,}
    #fi
  done < "$file_dbloadstatus_unzip"	
  sed -i "s/<RECDATE>/$cur_date/g" "$file_maintoken_unzip"
else
  myecho "The file $file_dbloadstatus_unzip cannot be found."
  myecho "Process Terminated."
  exit 1
fi 

         myecho start loading $file_to_load
         myecho  "$path_sinfodb_loader" "$dir_db" "$unzip_folder_sub" "$cur_date" "$schema_name" "$serv_name" "$port" "$user_name" "$password" "100000" \> $unzip_folder_sub/${sinfo_tech}_sinfo_sqlldr.log 2\>\&1

         "$path_sinfodb_loader" "$dir_db" "$unzip_folder_sub" "$cur_date" "$schema_name" "$serv_name" "$port" "$user_name" "$password" "100000" > "$unzip_folder_sub/${sinfo_tech}_sinfo_sqlldr.log" 2>&1           
         myecho Loading data to database in "$unzip_folder_sub" completed.		             

#zipping result folder
# myecho Move process log to target directory $ $unzip_folder_sub
myecho Zipping data in $unzip_folder_sub/*.log \=\=\>\> $unzip_folder/$file_to_unzip ...

myecho mv $proc_log $unzip_folder_sub

#mv "$proc_log" "$unzip_folder_sub"

echo_on=1

cd "$unzip_folder"
#zip -g -r "$unzip_folder/$file_to_unzip" *
7za a "$unzip_folder/$file_to_unzip" -r *

myecho Moving result zip file $file_to_unzip \=\=\>\> $output_location
if [ ! -d "$output_location" ]; then 
    mkdir "$output_location"
fi 
mv "$unzip_folder/$file_to_unzip" "$output_location"
 
myecho Cleaning up files...
if [ -d "$unzip_folder_sub" ]; then
    rm -rf *
fi

exit 0
