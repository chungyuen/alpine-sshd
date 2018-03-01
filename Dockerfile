FROM alpine:latest
MAINTAINER Jon Li <li@acm.org>

# add OpenSSH and clean
RUN apk add --update openssh \
&& rm  -rf /tmp/* /var/cache/apk/*

# add entrypoint script
ADD docker-entrypoint.sh /usr/local/bin

# refresh keys
RUN rm -rf /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_dsa_key

EXPOSE 22
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["/usr/sbin/sshd","-D"]
