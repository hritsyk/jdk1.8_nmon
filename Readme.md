Centos docker image with oracle jdk 1.8.0_151 and performance Monitor (nmon).
Could be extended and used for java projects, spring boot etc.

Usage:


 docker run -e NMON_START=1 \
                 -e CAPTURING_INTERVAL=<interval in sec> \
                 -e CAPTURING_COUNT=<caunt of capture, recomended min 300> \
                 -e [some other env param] \
                 -v [some_host_log_dir]:/logs \
                 [some_extended_image_from_hritsyk/jdk1.8.0_151_nmon]