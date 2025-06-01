# Modelo Conceitual

Este diretório contém materiais relacionados ao **Modelo Conceitual de Dados**, a primeira etapa da modelagem de banco de dados. Ele representa, de forma abstrata e independente de tecnologias, os **principais elementos de informação do sistema**, como entidades, atributos e relacionamentos.

---

## 🔹 O que é o Modelo Conceitual?

O **modelo conceitual** descreve **quais informações** devem ser armazenadas em um banco de dados, sem se preocupar com a forma de implementação técnica. Ele é uma representação **visual e de alto nível**, utilizada para facilitar o entendimento e validação das regras de negócio por parte de usuários, analistas e desenvolvedores.

- Baseado nos **requisitos levantados junto ao cliente**.
- Representado comumente por **DERs (Diagramas Entidade-Relacionamento)**.
- Focado em capturar a **essência e estrutura lógica das informações** do domínio do sistema.

---

## 🔹 Componentes do Modelo Conceitual

Os principais elementos que compõem um modelo conceitual são:

- **Entidades** → Representam objetos ou conceitos relevantes do mundo real.  
  *Exemplos: FARMÁCIA, PRODUTO, FARMACÊUTICO.*

- **Atributos** → São as propriedades ou características que descrevem uma entidade.  
  *Exemplos: nome_farmacia, valor_produto, RG_farmaceutico.*

- **Relacionamentos** → Indicam como as entidades se associam entre si.  
  *Exemplos: FARMÁCIA vende PRODUTO, FARMACÊUTICO trabalha em FARMÁCIA.*

- **Cardinalidade** → Define a quantidade de ocorrências entre entidades associadas.  
  *Exemplos: 1:1, 1:N, N:N.*

---

## 🔹 Exemplo de Modelo Conceitual

Abaixo está o exemplo visual de um modelo conceitual para um sistema de gestão de farmácias:

<img src="../../../../images/conceitual.png">

### Entidade: FARMÁCIA
- `CNPJ_farmacia` *(identificador)*
- `nome_farmacia`
- `end_farmacia`
- `tel_farmacia`

### Entidade: PRODUTO
- `cod_produto` *(identificador)*
- `qtd_produto`
- `valor_produto`

### Entidade: FARMACÊUTICO
- `RG_farmaceutico` *(identificador)*
- `nome_farmaceutico`

---

## 🔗 Relacionamentos

- **FARMÁCIA vende PRODUTO**  
  *Cardinalidade: (1,1) - (1,N)*  
  Cada farmácia vende **um ou mais produtos**, e cada produto é vendido por **uma única farmácia**.

- **FARMACÊUTICO trabalha em FARMÁCIA**  
  *Cardinalidade: (1,N) - (1,1)*  
  Cada farmácia possui **um ou mais farmacêuticos**, e cada farmacêutico trabalha em **apenas uma farmácia**.

Esses relacionamentos são representados graficamente por losangos conectando as entidades e acompanhados das cardinalidades nas extremidades das linhas.

---

## 🔹 Quando utilizar o Modelo Conceitual?

O modelo conceitual é ideal para:

- **Início de um projeto**, ao levantar os requisitos com o cliente.
- **Validar a estrutura dos dados** com usuários não técnicos.
- **Servir de base** para a construção dos modelos **lógico** e **físico**.

---

O modelo conceitual é essencial para garantir uma base sólida e bem estruturada para o banco de dados. Ele reduz riscos de erros no desenvolvimento, promove uma comunicação clara entre os envolvidos e assegura que as informações mais importantes estejam representadas corretamente desde o início do projeto.
