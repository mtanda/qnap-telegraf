FROM arm32v7/telegraf:1.31.3

COPY NAS.mib /usr/share/snmp/mibs/NAS.mib
COPY telegraf.conf /etc/telegraf/telegraf.conf
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["telegraf", "--config", "/etc/telegraf/telegraf.conf"]
