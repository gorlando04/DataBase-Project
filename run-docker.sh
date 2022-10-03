docker build .
docker run --rm -it \
    -v "$(pwd):/home/runner/ProjetoPIBD" \
    $(docker build -q .)
