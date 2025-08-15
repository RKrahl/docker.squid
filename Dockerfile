FROM rkrahl/opensuse:15.6

RUN zypper --non-interactive refresh

RUN zypper --non-interactive install \
	squid && \
    sed -i -e 's/^\#\(cache_dir ufs .*\)/\1/' /etc/squid/squid.conf && \
    mkdir -p /run/squid && \
    /usr/sbin/squid -z -F --foreground -S

CMD ["/usr/sbin/squid",  "-FC"]

EXPOSE 3128
