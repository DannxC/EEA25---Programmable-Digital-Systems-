# EEA25---Programmable-Digital-Systems-
Matter @ITA


## Explicação do LAB 7 (projeto mais completo feito até então):

### Introdução ao Projeto

"Para este projeto, meu objetivo foi implementar um processador single-cycle RISC-V, uma arquitetura de conjunto de instruções reduzido que é amplamente utilizada em sistemas embarcados e aplicações de baixo consumo energético. O foco era desenvolver o datapath e a unidade de controle do processador, e garantir que ele pudesse executar um conjunto básico de instruções RISC-V."

### Estrutura do Datapath

"No datapath, que é o coração do processador, cada componente foi cuidadosamente implementado para manipular os dados conforme instruído pelas instruções do programa. Os componentes chave incluem:

    Registradores (flopr): Utilizados para armazenar o contador de programa (PC) e outros valores intermediários durante a execução das instruções.
    Unidade Aritmética e Lógica (ALU): Responsável por executar operações aritméticas e lógicas, essencial para instruções como adição, subtração, AND, OR e comparações.
    Unidade de Extensão de Imediato (extend): Extende valores imediatos utilizados em instruções, ajustando-os para o tamanho correto.
    Multiplexadores (mux2 e mux3): Permitem a seleção de diferentes fontes de dados ou instruções com base nos sinais de controle.

### Unidade de Controle

"A unidade de controle é o cérebro do processador, gerando sinais de controle que orientam o fluxo de dados no datapath. Implementei esta unidade com base na decodificação das instruções, onde cada instrução RISC-V é interpretada e os sinais de controle correspondentes são gerados. Os módulos controller, maindec e aludec desempenham um papel vital nesta parte, interpretando a operação da instrução e definindo os sinais para as operações da ALU e o fluxo de dados."

### Desafios e Soluções

"Durante a implementação, enfrentei vários desafios técnicos, principalmente relacionados ao uso correto dos tipos de dados (reg vs. wire) em Verilog. Aprendi a distinguir entre esses dois tipos e a aplicá-los corretamente, dependendo se o sinal era uma entrada/saída de um módulo ou se era manipulado dentro de blocos procedurais (always).

Além disso, a conexão correta entre os módulos foi outra área de foco, onde tive que garantir que todos os sinais estivessem corretamente conectados e que a comunicação entre os módulos fosse feita de forma eficiente."

### Simulação e Teste

"Para validar a implementação do processador, desenvolvi um testbench que simulava o comportamento do processador carregando instruções de um arquivo riscvtest.txt. Isso permitiu verificar se o processador estava executando as instruções corretamente e escrevendo os valores esperados na memória."

### Conclusão e Aprendizados

"Este projeto foi uma oportunidade valiosa para aprofundar meu conhecimento em design de hardware digital e simulação com Verilog. Os desafios enfrentados e superados proporcionaram uma experiência prática significativa, reforçando minha compreensão da arquitetura RISC-V e dos conceitos de design de sistemas embarcados."