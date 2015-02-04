/usr/bin/test -e /bin/date && timestamp=`/bin/date +%s`
OUTPUT_FILE=`dirname $0`/crawl_`date +%Y-%m-%d`_data

if [ -e $OUTPUT_FILE ]; then
        echo > $OUTPUTFILE
else `touch $OUTPUT_FILE`

fi

HOST=`hostname`

function stat() {
        if [ -e $1 ] && [ -e $2 ];then

                REQ_LOG_FILE=$1
                RES_LOG_FILE=$2

                REQ_PAPI_CNT=`awk  '{s+=gsub(/haitao_debug/,"&")}END{print s}' $REQ_LOG_FILE`
                RES_PAPI_CNT=`awk  '{s+=gsub(/price_from_papi/,"&")}END{print s}' $RES_LOG_FILE`
                REQ_PAGE_CNT=`awk  '{s+=gsub(/haitao_offline_debug/,"&")}END{print s}' $REQ_LOG_FILE`
                RES_PAGE_CNT=`awk  '{s+=gsub(/price_from_page/,"&")}END{print s}' $RES_LOG_FILE`
                PAPI_SUCCESS_RAT=`awk 'BEGIN{printf "%.2f%\n",('$RES_PAPI_CNT'/'$REQ_PAPI_CNT')*100}'`
                PAGE_SUCCESS_RAT=`awk 'BEGIN{printf "%.2f%\n",('$RES_PAGE_CNT'/'$REQ_PAGE_CNT')*100}'`
                echo -e "$day\tREQ_PAPI_CNT=$REQ_PAPI_CNT\tRES_PAPI_CNT=$RES_PAPI_CNT\tREQ_PAGE_CNT=$REQ_PAGE_CNT\tRES_PAGE_CNT=$RES_PAGE_CNT\tPAPI_SUCCESS_RAT=$PAPI_SU
CCESS_RAT\tPAGE_SUCCESS_RAT=$PAGE_SUCCESS_RAT" >> $OUTPUT_FILE
        fi
}
function read_log() {

        if [ $1 -eq  1 ];then
                for d in $(seq 3)
                do

                        day=`date -d "$d day ago" +%Y-%m-%d`
                        echo $day
                        REQ_LOG_FILE=/home/admin/daigou/logs/$HOST/back/daigou-crawl-request.log.$day
                        RES_LOG_FILE=/home/admin/daigou/logs/$HOST/back/daigou-crawl-response.log.$day
                        stat $REQ_LOG_FILE $RES_LOG_FILE
                done
        else
                REQ_LOG_FILE=/home/admin/daigou/logs/$HOST/daigou-crawl-request.log
                RES_LOG_FILE=/home/admin/daigou/logs/$HOST/daigou-crawl-response.log
                stat $REQ_LOG_FILE $RES_LOG_FILE

        fi
}
read_log 1
read_log 2