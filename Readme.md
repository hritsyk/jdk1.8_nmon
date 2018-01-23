## Centos docker image with oracle jdk 1.8.0_162 and performance Monitor (nmon).

Could be extended and used for java projects, spring boot etc.

To extend just define Dockerfile for given java application like this:

```
FROM igrytsyk/jdk

ADD app.jar /

CMD ["/app.jar"]
```

and run it by command

```
docker run -e JAVA_OPTS="-Xms1024M -Xmx2048M" some_extended_image
```

###Linux process monitoring feature:

Image include [NMON](http://nmon.sourceforge.net/pmwiki.php) tool.

To run extended image with nmon:
```
docker run \
 -e JAVA_OPTS="-Xms1024M -Xmx2048M" \
 -e NMON_START=1 \
 -e CAPTURING_INTERVAL=1 \
 -e CAPTURING_COUNT=300 \
 some_extended_image
``` 
*NMON_START*=1 turn on nmon to save data in csv files (0 by default)

*CAPTURING_INTERVAL*=1 means you want to capture data every 1 seconds (1 by default)
 
*CAPTURING_COUNT*=300 means you want 300 data points or snap shots (300 by default)

nmon logs will be collected in /logs dir inside container.

###Schedule tasks runner feature:
It is possible to execute sh scripts or application packed to jar archive with given delay.
For instance, it might be shell for uploading nmon files to s3 bucket or so on.

To run with scheduled tasks:
1. Provide shell of jar you want to execute. 
2. In extended image add it's to /scheduled-tasks folder
```
FROM igrytsyk/jdk

ADD app.jar /

ADD some-task.sh /scheduled-tasks/some-task.sh

CMD ["/app.jar"]
```

3. Provide env variable with delay in seconds.

```
docker run -e JAVA_OPTS="-Xms1024M -Xmx2048M" -e SCHEDULED_TASK_INTERVAL=60 some_extended_image
```
