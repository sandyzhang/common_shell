#! /bin/sh

/usr/bin/test -e /bin/date && timestamp=`/bin/date +%s`

HOST=v048155.cm6
REQ_LOG_FILE=/home/admin/daigou/logs/$HOST/daigou-crawl-request.log
RES_LOG_FILE=/home/admin/daigou/logs/$HOST/daigou-crawl-response.log

REQ_PAPI_CNT=`awk  '{s+=gsub(/haitao_debug/,"&")}END{print s}' $REQ_LOG_FILE`
RES_PAPI_CNT=`awk  '{s+=gsub(/haitao_debug/,"&")}END{print s}' $RES_LOG_FILE`


REQ_PAGE_CNT=`awk  '{s+=gsub(/haitao_offline_debug/,"&")}END{print s}' $REQ_LOG_FILE`
RES_PAGE_CNT=`awk  '{s+=gsub(/haitao_offline_debug/,"&")}END{print s}' $RES_LOG_FILE`


PAPI_SUCCESS_RAT=`echo "sclae=2; $REQ_PAPI_CNT/$RES_PAPI_CNT" | bc`
PAGE_SUCCESS_RAT=`echo "sclae=2; $REQ_PAGE_CNT/$RES_PAGE_CNT" | bc`


echo -e "$timestamp\tREQ_PAPI_CNT=$REQ_PAPI_CNT RES_PAPI_CNT=$RES_PAPI_CNT REQ_PAGE_CNT=$REQ_PAGE_CNT RES_PAGE_CNT=$RES_PAGE_CNT PAPI_SUCCESS_RAT=$PAPI_SUCCESS_RAT PAGE_SUCCESS_RAT=$PAGE_SUCCESS_RAT" 





