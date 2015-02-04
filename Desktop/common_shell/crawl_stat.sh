# !/bin/sh
HOST="v041035.cm6 s097071.cm6 s097069.cm6"
TODAY = `date +%Y%m%d`
DIR = `dirname $0`
OUTPUT_EMPTY_WEIGHT_FILE="$DIR/crawl_res_stat_$TODAY"



function check_file()
{
	file=$1
	if [ -e $file ];then
		echo > $file
	else
		`touch $file`
	fi
}

function check_weight()
{
	file=$1
	host=$2
	output="$DIR/crawl_empty_weight_$TODAY"
	check_file $output

	if [ -e $file ];then
		ssh $1  -o ConnectTimeout=30 cat $file | grep "weight:0" | awk -F 'url:' '{gsub("}","",$2);a[$2]++;}END{asorti(a);for(i in a) {print i,a[i]}}' > $output
	fi

	echo "done" 
}

function check_crawl_papi_request()
{
	file=$1
	host=$2
	output="$DIR/check_crawl_papi_request"
}
