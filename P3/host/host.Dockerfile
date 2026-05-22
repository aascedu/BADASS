FROM debian:bookworm

RUN apt update -y && apt upgrade -y
RUN apt install -y busybox

COPY ./entrypoint.sh /entrypoint.sh
ARG NAME
COPY ./${NAME}-network.sh /network.sh
RUN chmod a+x /entrypoint.sh /network.sh

CMD ["/entrypoint.sh"]