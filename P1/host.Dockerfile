FROM debian:bookworm

RUN apt install -y busybox

CMD ["bash"]