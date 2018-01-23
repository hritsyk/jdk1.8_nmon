#!/usr/bin/env bash

while true;
 do
        for f in /scheduled-tasks/*; do
			case "$f" in
				*.sh)     echo "$0: running $f"; . "$f" ;;
				*.jar)    echo "$0: running $f"; exec java $JAVA_OPTS -jar "$f" echo ;;
				*)        echo "$0: ignoring $f" ;;
			esac
			echo
		done
 sleep $SCHEDULED_TASK_INTERVAL;
done
