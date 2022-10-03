DROP DATABASE teste;
CREATE DATABASE teste;
\c teste
\set ON_ERROR_STOP true

include(geral/index.sql)
include(convites/index.sql)
include(editais/index.sql)
include(avaliadores/index.sql)
include(views/index.sql)
