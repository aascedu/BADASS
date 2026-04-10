FROM debian:bookworm

RUN apt update -y && apt upgrade -y
RUN apt install -y busybox

CMD ["bash"]