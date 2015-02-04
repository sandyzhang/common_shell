#!/bin/sh

# {a[$1]++}   统计部分
# !b[$0]++{c[$1]++}   去重部分，这种方式很好理解
awk '{a[$1]++}!b[$0]++{c[$1]++}END{for (i in a) print i,"\t",a[i],"\t",c[i]}'  file