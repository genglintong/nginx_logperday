#!/bin/bash
#by zpblog.cn
#此脚本用于自动分割指定目录的日志，包括access_log和error_log
#每天00:00执行此脚本 将前一天的access_log拷贝为access_log-xxxx-xx-xx格式，并清空已拷贝的日志文件
#日志目录
LOG_PATH=/home/logs
#获取昨天的日期
YESTERDAY=$(date -d "yesterday" +%Y-%m-%d)
#分割日志
for a in ` find  ${LOG_PATH} -name "*.access_log" `;do cp $a $a-${YESTERDAY};echo ""  >$a;done
for e in ` find  ${LOG_PATH} -name "*.error_log" `;do cp $e $e-${YESTERDAY};echo ""  >$e;done
#删除7天前日志
find ${LOG_PATH} -mtime +7 -type f -name "*_log-*" -exec rm -f {} \;
