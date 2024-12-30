FROM telegraf:1.31.3-alpine

RUN apk add --no-cache net-snmp net-snmp-tools

RUN mkdir -p /usr/share/snmp/mibs

RUN echo "mibdirs /usr/share/snmp/mibs" >> /etc/snmp/snmp.conf && \
	echo "mibs +ALL" >> /etc/snmp/snmp.conf

COPY NAS.mib /usr/share/snmp/mibs/NAS.mib
COPY telegraf.conf /etc/telegraf/telegraf.conf
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["telegraf", "--config", "/etc/telegraf/telegraf.conf"]
