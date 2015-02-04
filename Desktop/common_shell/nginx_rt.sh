#/bin/sh
cat /home/admin/cai/logs/cronolog/2014/11/2014-11-18-taobao-access_log  | awk '{if($2>500000){print $7}}' | awk -F? '{print $1}' | sort | uniq -c  | sort -nr  | head -10

cat /home/admin/cai/logs/cronolog/2014/11/2014-11-18-taobao-access_log  | awk '$7~/CrawlRes/{count++;sum+=$2}END{print sum/count}'