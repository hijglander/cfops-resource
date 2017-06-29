FROM concourse/busyboxplus:base

RUN wget https://pivotal-cfops.s3.amazonaws.com/release/linux64/v2.0.48/cfops
RUN mv cfops /usr/local/bin
RUN chmod +x /usr/local/bin/cfops

ENV RUN_DIR '/root/pcfbackup'
ENV LOG_DIR '/root/pcfbackup/log'

RUN mkdir -p $RUN_DIR
RUN mkdir -p $LOG_DIR

ADD scripts /root/scripts

CMD ["/root/scripts/ctl.sh", "start", ">>/root/pcfbackup/ctl.log 2>&1 &"]
