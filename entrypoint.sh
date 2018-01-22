#!/bin/bash

APP_JAR=$1

#nmon starting
if [ $NMON_START = 1 ]; then
    echo "starting nmon capturing"
    nmon -f -s $CAPTURING_INTERVAL  -c $CAPTURING_COUNT -m $LOG_DIR
else
    echo "nmon capturing disabled"
fi

#run application
exec java $JAVA_OPTS -jar $APP_JAR