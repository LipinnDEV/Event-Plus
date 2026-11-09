
# Event-Plus

Projeto acadêmico desenvolvido em **MySQL** para gerenciamento de eventos, organizadores, participantes e inscrições.

O Event-Plus foi desenvolvido com o objetivo de aplicar conceitos de modelagem e manipulação de bancos de dados relacionais, utilizando relacionamentos, restrições e consultas SQL para representar um sistema de gerenciamento de eventos.

## Sobre o Projeto

O banco de dados permite organizar eventos por categorias, relacionar eventos aos seus organizadores e controlar as inscrições dos participantes, incluindo o registro de presença.

## Estrutura do Banco de Dados

O projeto possui **5 tabelas principais**:

| Tabela | Descrição |
|---|---|
| `categoria` | Armazena as categorias dos eventos. |
| `organizador` | Registra os organizadores e seus contatos. |
| `participante` | Armazena os dados dos participantes. |
| `evento` | Contém informações sobre os eventos cadastrados. |
| `inscricao` | Gerencia as inscrições e o registro de presença. |

## Relacionamentos

- Cada evento pertence a uma categoria.
- Cada evento possui um organizador responsável.
- Participantes podem se inscrever em diferentes eventos.
- A tabela `inscricao` estabelece o relacionamento entre participantes e eventos.

## Tecnologias Utilizadas

- **MySQL**
- **SQL**
- **Relacionamentos e JOINs**
- **Chaves primárias e estrangeiras**
- **Constraints e integridade referencial**
- **Funções de agregação**
- **GROUP BY e HAVING**
- **Subconsultas e filtros**

## Funcionalidades

- Cadastro de categorias, organizadores e participantes.
- Cadastro de eventos com datas, valores e descrições.
- Gerenciamento de inscrições.
- Controle de presença dos participantes.
- Consulta de eventos por categoria.
- Identificação de eventos sem inscrições.
- Contagem de inscrições por evento.
- Cálculo de arrecadação.
- Consulta de participantes por cidade.
- Identificação de participantes inscritos em múltiplos eventos.
- Relatórios de eventos por organizador.

## Consultas SQL

O projeto inclui consultas SQL para demonstrar:

- Listagem e ordenação de eventos.
- Relacionamento entre eventos e categorias.
- Relacionamento entre eventos e organizadores.
- Consulta de participantes inscritos em eventos específicos.
- Contagem de inscrições utilizando `COUNT()`.
- Cálculo de arrecadação utilizando `SUM()` e operações matemáticas.
- Agrupamentos utilizando `GROUP BY`.
- Filtragem de resultados utilizando `HAVING`.
- Identificação de eventos sem participantes inscritos.
- Análise de inscrições e distribuição de participantes.

## Objetivo Acadêmico

Aplicar na prática os conceitos de banco de dados relacionais, desenvolvendo habilidades em modelagem, criação de tabelas, inserção de dados, relacionamentos e elaboração de consultas SQL.

---

**Event-Plus**  
Projeto acadêmico de Banco de Dados  
Desenvolvido para fins de aprendizado e prática de SQL.
