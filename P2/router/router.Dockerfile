FROM debian:bookworm

RUN apt update -y && apt upgrade -y

RUN apt install -y curl lsb-release busybox

RUN curl -s https://deb.frrouting.org/frr/keys.gpg | tee /usr/share/keyrings/frrouting.gpg > /dev/null && \
    FRRVER="frr-stable" && \
    echo deb '[signed-by=/usr/share/keyrings/frrouting.gpg]' https://deb.frrouting.org/frr \
        $(lsb_release -s -c) $FRRVER | tee -a /etc/apt/sources.list.d/frr.list && \
    apt update -y && apt install -y frr frr-pythontools


ARG NAME
COPY ./${NAME}-network.sh /network.sh

COPY ./daemons /etc/frr/daemons
RUN mkdir -p /var/run/frr && chown -R frr:frr /var/run/frr && chown -R frr:frr /etc/frr
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh /network.sh

ENTRYPOINT ["/entrypoint.sh"]