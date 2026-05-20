#! /bin/bash

###############################################################################
#                   BUILD - Build Ur Images Like a Daydreamer                 #
###############################################################################

if [ "$#" -ne 1 ]; then
    echo "Usage : $0 {p1|p2|p3}" >&2
    exit 1
fi

case "$1" in
    p1)
        echo "building p1..."
        cd P1
        docker build -f ./host/host.Dockerfile --build-arg NAME=host -t host:stable ./host
        docker build -f ./router/router.Dockerfile --build-arg NAME=router -t router:stable ./router
        ;;
    p2)
        echo "building p2..."
        cd P2
        docker build -f ./host/host.Dockerfile --build-arg NAME=hostA -t host-a:stable ./host
        docker build -f ./host/host.Dockerfile --build-arg NAME=hostB -t host-b:stable ./host
        docker build -f ./router/router.Dockerfile --build-arg NAME=routerA -t router-a:stable ./router
        docker build -f ./router/router.Dockerfile --build-arg NAME=routerB -t router-b:stable ./router
        ;;
    p3)
        echo "building p3..."
        cd P3
        ;;
    *)
        echo "Error : invalid argument '$1'." >&2
        echo "Only 'p1', 'p2' or 'p3' are accepted." >&2
        exit 1
        ;;
esac