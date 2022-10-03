# ProjetoPIBD
"Projeto e Implementação de Banco de Dados" 
- Consiste na implementação de um sistema de controle de eventos científicos

## Instalação 
A execução pode ser feita online por Replit ou pelo Docker. O ambiente configura
o banco de dados via `start.sh` e abre um shell.
- Rode `bash start.sh` para reconstruir o banco de dados a partir dos scripts.
- Rode `bash repl.sh` para operar o banco de dados interativamente.

### Replit
O projeto suporta execução online por [Replit](https://replit.com/):
1. Crie uma conta caso necessário
2. Crie um novo Repl
3. Importe do github, usando o link do repositório
4. Execute com o botão de executar

### Docker
O projeto também suporta execução por um container do Docker:
1. Instale o docker no seu sistema
2. Se necessário, levante o daemon do docker:
   - (Linux) `sudo systemctl start docker.service`
3. (Linux) Execute o container com `bash run-docker.sh`, usando `sudo` caso
   permissões sejam necessárias

## Incluindo código fonte
O script de inicialização chama o arquivo `sql/index.sql`. Um macro é definido
`include(<caminho>)`, que expande para o conteúdo do arquivo referenciado
(recursivamente, relativamente ao arquivo que incluiu, e na mesma ordem). Para
incluir um novo script, coloque dentro da pasta `sql` e altere algum arquivo com
`include(<caminho do seu script>)` para incluir ele na saída final.

Veja os arquivos `index.sql` dentro da pasta `sql` para exemplos de uso prático.

## Alunos realizando o projeto

- Augusto Luchesi Matos, 740871, Bacharelado em Ciência da Computação - Grupo B
[@MatosAugusto](https://github.com/MatosAugusto)
- Carlos Eduardo Nascimento dos Santos, 791029, Bacharelado em Ciência da Computação - Grupo A
[@CarlosENdS](https://github.com/CarlosENdS)
- Enio da Costa Martinelli, 790891, Bacharelado em Ciência da Computação - Grupo B
[@enio-martinelli](https://github.com/enio-martinelli)
- Gabriel Meirelles Carvalho Orlando, 790728, Bacharelado em Ciência da Computação - Grupo C
[@Gab0410](https://github.com/Gab0410)
- Guilherme Santos de Godoy, 758710, Bacharelado em Ciência da Computação - Grupo B 
[@GuilhermeSGodoy](https://github.com/GuilhermeSGodoy)
- João Pedro Trevisan, 769774, Bacharelado em Ciência da Computação - Grupo A
[@JPChowder](https://github.com/JPChowder)
- João Vitor Azevedo Marciano, 743554, Bacharelado em Engenharia de Computação - Grupo C
[@JoaoVitorAzevedo](https://github.com/JoaoVitorAzevedo)
- Juan Salin Correa, 760573, Engenharia Elétrica - Grupo A
[@juan-scorrea](https://github.com/)
- Miguel Antonio de Oliveira, 772180, Bacharelado em Ciência da Computação - Grupo A
[@migeyel](https://github.com/)
- Nayra Kaline Santos Vidal, 769847, Bacharelado em Ciência da Computação - Grupo C
[@nayrakalinesv](https://github.com/nayrakalinesv)
- Sophia Santonastasio Schuster, 760936, Bacharelado em Ciência da Computação - Grupo B
[@Sophia-Schuster](https://github.com/)
- Vanessa de Cássia Alves, 795314, Bacharelado em Ciência da Computação - Grupo C
[@Vanessa-webusr](https://github.com/Vanessa-webusr)

## Histórico de Versão

* 0.1
    * Primeira versão
