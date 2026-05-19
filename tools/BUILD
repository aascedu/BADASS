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
        echo "Lancement des commandes pour p1..."
        cd P1
        docker build -f ./host/host.Dockerfile --build-arg NAME=host -t host:stable ./host
        docker build -f ./router/router.Dockerfile --build-arg NAME=router -t router:stable ./router
        ;;
    p2)
        echo "Lancement des commandes pour p2..."
        cd P2
        docker build -f ./host/host.Dockerfile --build-arg NAME=hostA -t host-a:stable ./host
        docker build -f ./host/host.Dockerfile --build-arg NAME=hostB -t host-b:stable ./host
        docker build -f ./router/router.Dockerfile --build-arg NAME=routerA -t router-a:stable ./router
        docker build -f ./router/router.Dockerfile --build-arg NAME=routerB -t router-b:stable ./router
        ;;
    p3)
        echo "Lancement des commandes pour p3..."
        cd P3
        ;;
    *)
        echo "Erreur : Argument invalide '$1'." >&2
        echo "Seuls 'p1', 'p2' ou 'p3' sont acceptés." >&2
        exit 1
        ;;
esac