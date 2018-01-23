#!/bin/bash

APP_JAR=$1

#nmon starting
if [ $NMON_START = 1 ]; then
    echo "starting nmon capturing"
    nmon -f -s $CAPTURING_INTERVAL  -c $CAPTURING_COUNT -m /logs
else
    echo "nmon capturing disabled"
fi

./scheduled-task-runner.sh &

#run application
exec java $JAVA_OPTS -jar $APP_JAR