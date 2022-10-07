FROM rkrahl/opensuse:15.4

RUN zypper --non-interactive install \
	squid && \
    sed -i -e 's/^\#\(cache_dir ufs .*\)/\1/' /etc/squid/squid.conf && \
    mkdir -p /run/squid && \
    /usr/sbin/squid -z -F -N -S -f /etc/squid/squid.conf

CMD ["/usr/sbin/squid",  "-F",  "-sY", "/etc/squid/squid.conf"]

EXPOSE 3128
