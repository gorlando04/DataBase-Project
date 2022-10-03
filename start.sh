#!/bin/bash
# Esse é o primeiro script a ser executado quando o container/replit executa.
# Atualmente, ele:
# - Cria a pasta do banco de dados
# - Configura o postgresql
# - Levanta o postgresql
# - Aplica o arquivo main.sql em `postgres`
#
# É esperado que o repositório esteja em /home/runner/ProjetoPIBD. O replit
# monta por padrão enquanto o Docker monta no script start-docker.sh
#
# As pastas de dados estão em:
# - dados /home/runner/postgres
# - socket /home/runner/postgres/...
# - logs /home/runner/postgres/postgresql.log

export PGDATA="/home/runner/postgres"

if [ ! -d $PGDATA ]; then
  initdb --auth-host=trust
  sed -i "s/#unix_socket_directories = '\/run\/postgresql'/unix_socket_directories='\/home\/runner\/postgres'/" \
    $PGDATA/postgresql.conf
fi

if [ ! -f $PGDATA/postmaster.pid ]; then
  pg_ctl -l $PGDATA/postgresql.log start
fi

m4 bundle.m4 sql/index.sql | psql --echo-all postgresql://127.0.0.1/postgres 
