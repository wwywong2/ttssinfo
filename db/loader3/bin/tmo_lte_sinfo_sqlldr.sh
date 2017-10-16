#!/bin/bash
set -e
usage="Usage: $0 \"path of sqls\" \"path of input file\" \"date\" \"schema\" \"host\" \"port\" \"db_userid\" \"db_password\" \"stddev_threshold\" "

if [[ $# < 10 ]]; then
    echo $usage
    exit 1
fi

v_path=$1
echo sql_path=$v_path
shift

v_datapath=$1
echo datapath=$v_datapath
shift

v_rec_date=$1
echo record_date=$v_rec_date
shift

v_database=$1
echo database=$v_database
shift

serv_name=$1
echo serv_name=$serv_name
shift

port=${1:-3360}
echo port=$port
shift

user_name=$1
echo user_name=$user_name
shift

pwd=$1
echo password=$pwd
shift

v_stddev_threshold_val=${1:-100000}
echo stddev_threshold=$v_stddev_threshold_val
shift

echo Start Time  `date +%Y-%m-%d-%H:%M:%S `
echo Loading from directory $v_path for file in $v_filename in $v_datapath - date - $v_rec_date in database $v_database

echo [`date +%Y-%m-%d-%H:%M:%S`] Recreate sql with replaced path name ...
oldfile=$v_path/load_data_lte_stg_template.sql
newfile=$v_path/load_data_lte_stg.sql
if [ ! -e "$oldfile" ]; then
  echo file: "$oldfile" not exist
  exit 1
fi

echo oldfile=$oldfile
echo newfile=$newfile
 
sed -e "s|\[##DataDir##\]|$v_datapath|" -e "s|\[##FileName##\]|$v_filename|" <"$oldfile" >"$newfile"
#sed "s|\[##DataDir##\]|$v_datapath|g" <"$oldfile" >"$newfile"

if (( $? > 0 )); then
  echo String replacement is failed for oldfile: $oldfile
  exit 1
fi

echo [`date +%Y-%m-%d-%H:%M:%S`]  mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database --local-infile -t -vvv -e  "call $v_database.new_partition('$v_database','$v_rec_date','lte');"
mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database --local-infile -t -vvv -e  "call $v_database.new_partition('$v_database','$v_rec_date','lte');"

echo [`date +%Y-%m-%d-%H:%M:%S`]  mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database --local-infile -t -vvv -e "source $newfile;"
mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database --local-infile -t -vvv -e "source $newfile;"

if (( $? > 0 )); then
    echo --- Error in loading data: load_data_lte_stg.sql ---
    echo --- Error in loading data: load_data_lte_stg.sql --- >> "$v_datapath/db_error.log"
    exit 1
fi

if (( $? == 0 )); then
    echo [`date +%Y-%m-%d-%H:%M:%S`]  mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database -t -vvv -e "set @p_date='$v_rec_date';SET @p_stddev_threshold_val=$v_stddev_threshold_val; source $v_path/call_stddev_check_lte.sql;" \> "$v_datapath/Log08_call_stddev_check_lte.log"
    mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database -t -vvv -e "set @p_date='$v_rec_date';SET @p_stddev_threshold_val=$v_stddev_threshold_val; source $v_path/call_stddev_check_lte.sql;" > "$v_datapath/Log08_call_stddev_check_lte.log"
    if (( $? > 0 )); then
        echo --- Error in loading data: call_stddev_check_lte.sql ---
        echo --- Error in loading data: call_stddev_check_lte.sql --- >> "$v_datapath/db_error.log"
        exit 1
    fi
    echo [`date +%Y-%m-%d-%H:%M:%S`]  mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database -e "truncate table s_info_lte_stg;"
    mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database -e "truncate table s_info_lte_stg;"
fi

# NEED TO ADD the code from batch to check stddev

if (( 1 > 0 )); then
    echo YES>> "$v_datapath/Log08_call_stddev_check_lte.log"
    echo [`date +%Y-%m-%d-%H:%M:%S`] Recreate sql with replaced path name ...
    oldfile=$v_path/load_data_lte_template.sql
    newfile=$v_path/load_data_lte.sql
    if [ ! -e "$oldfile" ]; then
      echo file: "$oldfile" not exist
      exit 1
    fi

    echo oldfile=$oldfile
    echo newfile=$newfile
     
    sed -e "s|\[##DataDir##\]|$v_datapath|" -e "s|\[##FileName##\]|$v_filename|" <"$oldfile" >"$newfile"
    #sed "s|\[##DataDir##\]|$v_datapath|g" <"$oldfile" >"$newfile"

    if (( $? > 0 )); then
      echo String replacement is failed for oldfile: $oldfile
      exit 1
    fi

    echo [`date +%Y-%m-%d-%H:%M:%S`]  mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database --local-infile -t -vvv -e  "call $v_database.delete_data('$v_database','$v_rec_date','lte');"
    mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database --local-infile -t -vvv -e  "call $v_database.delete_data('$v_database','$v_rec_date','lte');"
    
    echo [`date +%Y-%m-%d-%H:%M:%S`]  mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database --local-infile -t -vvv -e "source $newfile;"
    mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database --local-infile -t -vvv -e "source $newfile;"

    if (( $? > 0 )); then
        echo --- Error in loading data ---
        echo --- Error in loading data --- >> "$v_datapath/db_error.log"
        exit 1
    fi

    if (( $? == 0 )); then
        # ATT ALU EXTRA PARAM files
        if [ -e "$v_datapath/LTE_PARAM_ALU_EXTRA_LTECELL_2.txt" ]; then
            oldfile=$v_path/load_data_lte_alu_param_template.sql
            newfile=$v_path/load_data_lte_alu_param.sql
            if [ ! -e "$oldfile" ]; then
              echo file: "$oldfile" not exist
              #exit 1
            fi
            sed -e "s|\[##DataDir##\]|$v_datapath|" -e "s|\[##FileName##\]|$v_filename|" <"$oldfile" >"$newfile"
            echo [`date +%Y-%m-%d-%H:%M:%S`]  mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database -t -vvv -e "set @p_date='$v_rec_date'; source $v_path/load_data_lte_alu_param.sql;"
            mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database -t -vvv -e "set @p_date='$v_rec_date'; source $v_path/load_data_lte_alu_param.sql;"
            if (( $? > 0 )); then
                echo --- Error in processing load_data_lte_eric_param.sql ---
                echo --- Error in processing load_data_lte_eric_param.sql --- >> "$v_datapath/db_error.log"
                echo [`date +%Y-%m-%d-%H:%M:%S`]  mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database --local-infile -t -vvv -e  "call $v_database.delete_data('$v_database','$v_rec_date','lte');"
                mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database --local-infile -t -vvv -e  "call $v_database.delete_data('$v_database','$v_rec_date','lte');"
                #exit 1
            fi
        fi
        
        # ATT ERIC EXTRA PARAM files
        if [ -e "$v_datapath/LTE_PARAM_ERIC_EXTRA_LTECELL_2.txt" ]; then
            oldfile=$v_path/load_data_lte_eric_param_template.sql
            newfile=$v_path/load_data_lte_eric_param.sql
            if [ ! -e "$oldfile" ]; then
              echo file: "$oldfile" not exist
              #exit 1
            fi
            sed -e "s|\[##DataDir##\]|$v_datapath|" -e "s|\[##FileName##\]|$v_filename|" <"$oldfile" >"$newfile"
            echo [`date +%Y-%m-%d-%H:%M:%S`]  mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database -t -vvv -e "set @p_date='$v_rec_date'; source $v_path/load_data_lte_eric_param.sql;"
            mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database -t -vvv -e "set @p_date='$v_rec_date'; source $v_path/load_data_lte_eric_param.sql;"
            if (( $? > 0 )); then
                echo --- Error in processing load_data_lte_eric_param.sql ---
                echo --- Error in processing load_data_lte_eric_param.sql --- >> "$v_datapath/db_error.log"
                echo [`date +%Y-%m-%d-%H:%M:%S`]  mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database --local-infile -t -vvv -e  "call $v_database.delete_data('$v_database','$v_rec_date','lte');"
                mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database --local-infile -t -vvv -e  "call $v_database.delete_data('$v_database','$v_rec_date','lte');"
                #exit 1
            fi
        fi
        
        # TMO ERIC EXTRA PARAM files
        if [ -e "$v_datapath/LTE_PARAM_ERIC_LTECELL_3.txt" ]; then
            oldfile=$v_path/load_data_lte_eric_param_tmo_extra_template.sql
            newfile=$v_path/load_data_lte_eric_param_tmo_extra.sql
            if [ ! -e "$oldfile" ]; then
              echo file: "$oldfile" not exist
              #exit 1
            fi
            sed -e "s|\[##DataDir##\]|$v_datapath|" -e "s|\[##FileName##\]|$v_filename|" <"$oldfile" >"$newfile"
            echo [`date +%Y-%m-%d-%H:%M:%S`]  mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database -t -vvv -e "set @p_date='$v_rec_date'; source $v_path/load_data_lte_eric_param_tmo_extra.sql;"
            mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database -t -vvv -e "set @p_date='$v_rec_date'; source $v_path/load_data_lte_eric_param_tmo_extra.sql;"
            if (( $? > 0 )); then
                echo --- Error in processing load_data_lte_eric_param_tmo_extra.sql ---
                echo --- Error in processing load_data_lte_eric_param_tmo_extra.sql --- >> "$v_datapath/db_error.log"
                echo [`date +%Y-%m-%d-%H:%M:%S`]  mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database --local-infile -t -vvv -e  "call $v_database.delete_data('$v_database','$v_rec_date','umts');"
                mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database --local-infile -t -vvv -e  "call $v_database.delete_data('$v_database','$v_rec_date','umts');"
                #exit 1
            fi
        fi
        
        # TMO NSN EXTRA PARAM files
        if [ -e "$v_datapath/LTE_PARAM_NOKIA_LTECELL_2.txt" ]; then
            oldfile=$v_path/load_data_lte_nsn_param_tmo_extra_template.sql
            newfile=$v_path/load_data_lte_nsn_param_tmo_extra.sql
            if [ ! -e "$oldfile" ]; then
              echo file: "$oldfile" not exist
              #exit 1
            fi
            sed -e "s|\[##DataDir##\]|$v_datapath|" -e "s|\[##FileName##\]|$v_filename|" <"$oldfile" >"$newfile"
            echo [`date +%Y-%m-%d-%H:%M:%S`]  mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database -t -vvv -e "set @p_date='$v_rec_date'; source $v_path/load_data_lte_nsn_param_tmo_extra.sql;"
            mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database -t -vvv -e "set @p_date='$v_rec_date'; source $v_path/load_data_lte_nsn_param_tmo_extra.sql;"
            if (( $? > 0 )); then
                echo --- Error in processing load_data_lte_nsn_param_tmo_extra.sql ---
                echo --- Error in processing load_data_lte_nsn_param_tmo_extra.sql --- >> "$v_datapath/db_error.log"
                echo [`date +%Y-%m-%d-%H:%M:%S`]  mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database --local-infile -t -vvv -e  "call $v_database.delete_data('$v_database','$v_rec_date','umts');"
                mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database --local-infile -t -vvv -e  "call $v_database.delete_data('$v_database','$v_rec_date','umts');"
                #exit 1
            fi
        fi
        
        echo [`date +%Y-%m-%d-%H:%M:%S`]  mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database -t -vvv -e "set @p_date='$v_rec_date'; source $v_path/call_proc_lte.sql;" \> "$v_datapath/Log09_call_proc_lte.log"
        mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database -t -vvv -e "set @p_date='$v_rec_date'; source $v_path/call_proc_lte.sql;" > "$v_datapath/Log09_call_proc_lte.log"
        if (( $? > 0 )); then
            echo --- Error in processing call_proc_lte.sql ---
            echo --- Error in processing call_proc_lte.sql --- >> "$v_datapath/db_error.log"
            echo [`date +%Y-%m-%d-%H:%M:%S`]  mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database --local-infile -t -vvv -e  "call $v_database.delete_data('$v_database','$v_rec_date','lte');"
            mysql -h $serv_name -P $port -u $user_name -p$pwd $v_database --local-infile -t -vvv -e  "call $v_database.delete_data('$v_database','$v_rec_date','lte');"
            exit 1
        fi
    fi
fi

echo End Time: [`date +%Y-%m-%d-%H:%M:%S`]  

