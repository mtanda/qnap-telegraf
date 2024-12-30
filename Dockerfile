FROM arm32v7/telegraf:1.31.3

RUN echo "deb http://ftp.debian.org/debian/ bookworm main contrib non-free" >> /etc/apt/sources.list
RUN apt-get update && apt-get install --yes snmp-mibs-downloader
RUN echo "mibs +ALL" >> /etc/snmp/snmp.conf

COPY NAS.mib /usr/share/snmp/mibs/
COPY telegraf.conf /etc/telegraf/telegraf.conf
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["telegraf", "--config", "/etc/telegraf/telegraf.conf"]
