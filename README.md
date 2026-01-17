# iFood Case – Análise de Trip Records NYC

Este repositório contém o guia completo para execução do case, incluindo ingestão de dados, criação de tabelas, ETL e análises no **Databricks**, utilizando dados públicos de viagens da cidade de Nova York.

---

## 📌 Guia de Execução

### 1️⃣ Download dos Arquivos de Dados

1. Acesse a fonte oficial de dados:
   👉 [https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page)

2. Na seção **"Trip Record Data Download Links"**, faça o download dos arquivos necessários para a análise.

3. Para este case, foram utilizados **todos os arquivos de Janeiro/2023 a Maio/2023**.

---

### 2️⃣ Upload dos Arquivos no Databricks

1. No Databricks, acesse ou crie uma pasta chamada **`trip_record_data`** em **Volumes**, conforme o exemplo abaixo:

   <img width="860" height="528" alt="Databricks Volumes" src="https://github.com/user-attachments/assets/2ffc1761-b191-46ee-b4f5-ac72b49d3dc1" />

2. Realize o upload de todos os arquivos baixados para essa pasta.

> **Observação:**
> O caminho padrão utilizado no case é:
>
> ```
> workspace.default.trip_record_data
> ```
>
> Esse caminho pode ser alterado diretamente nos parâmetros dos scripts e queries, se necessário.

---

### 3️⃣ Criação de Tabelas e ETL

Execute os arquivos localizados na pasta **`src/`** diretamente no Databricks, **respeitando a ordem abaixo**:

1. **`table_creation.sql`**

   * Responsável pela criação de todas as tabelas utilizadas no case.

2. **`ingestion_tripdata.ipynb`**

   * Ingestão dos dados brutos em tabelas intermediárias.

3. **`data_transfer_tripdata.ipynb`**

   * Limpeza, transformação e carga dos dados para as tabelas finais de consumo.

---

### 4️⃣ Análises

1. Execute os scripts disponíveis na pasta **`analysis/`** no Databricks.
2. Esses scripts contemplam todas as análises solicitadas no case.

---

## ✅ Estrutura do Projeto (Resumo)

```
.
├── src/
│   ├── table_creation.sql
│   ├── ingestion_tripdata.ipynb
│   └── data_transfer_tripdata.ipynb
├── analysis/
│   └── *.sql / *.ipynb
└── README.md
```
