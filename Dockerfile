# Container tentanto emular o comportamento do replit.
# Rodar com `bash run-docker.sh` para incluir o bind mount.
FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y nix
RUN nix-channel --add https://nixos.org/channels/nixpkgs-unstable \
    && nix-channel --update
COPY ./shell.nix ./replit.nix /tmp/
RUN nix-shell /tmp/shell.nix
RUN useradd -m runner \
    && mkdir /home/runner/ProjetoPIBD \
    && chown runner /home/runner/ProjetoPIBD
WORKDIR /home/runner/ProjetoPIBD
ENTRYPOINT nix-daemon >/dev/null & \
    (sleep 3 && runuser -u runner nix-shell -- --command "bash start.sh && bash")
