CREATE TABLE TipoVeiculos (
    ID_TipoVeiculo NUMBER PRIMARY KEY,
    Descricao VARCHAR2(100)
);

CREATE TABLE Veiculos (
    ID_Veiculo NUMBER PRIMARY KEY,
    Placa VARCHAR2(10),
    Marca VARCHAR2(50),
    Modelo VARCHAR2(50),
    Ano NUMBER,
    Cor VARCHAR2(20),
    TipoVeiculo NUMBER,
    FOREIGN KEY (TipoVeiculo) REFERENCES TipoVeiculos(ID_TipoVeiculo)
);

CREATE TABLE Rodovias (
    ID_Rodovia NUMBER PRIMARY KEY,
    Nome VARCHAR2(100),
    Extensao NUMBER,
    Localizacao VARCHAR2(100)
);

CREATE TABLE Pracas (
    ID_Praca NUMBER PRIMARY KEY,
    Nome VARCHAR2(100),
    Latitude NUMBER,
    Longitude NUMBER,
    RodoviaAssociada NUMBER,
    FOREIGN KEY (RodoviaAssociada) REFERENCES Rodovias(ID_Rodovia)
);

CREATE TABLE Usuarios (
    ID_Usuario NUMBER PRIMARY KEY,
    Nome VARCHAR2(100),
    Sobrenome VARCHAR2(100),
    Email VARCHAR2(100),
    Senha VARCHAR2(100),
    TipoUsuario NUMBER,
    FOREIGN KEY (TipoUsuario) REFERENCES ClasseUsuario(ID_ClasseUsuario)
);

CREATE TABLE ClasseUsuario (
    ID_ClasseUsuario NUMBER PRIMARY KEY,
    Nome VARCHAR2(50),
    Descricao VARCHAR2(100)
);

CREATE TABLE Precos (
    ID_Preco NUMBER PRIMARY KEY,
    TipoVeiculo NUMBER,
    PrecoPassagem NUMBER,
    FOREIGN KEY (TipoVeiculo) REFERENCES TipoVeiculos(ID_TipoVeiculo)
);

CREATE TABLE Transacoes (
    ID_Transacao NUMBER PRIMARY KEY,
    ID_Veiculo NUMBER,
    ID_Praca NUMBER,
    DataHoraTransacao TIMESTAMP,
    FOREIGN KEY (ID_Veiculo) REFERENCES Veiculos(ID_Veiculo),
    FOREIGN KEY (ID_Praca) REFERENCES Pracas(ID_Praca)
);

CREATE TABLE Pagamentos (
    ID_Pagamento NUMBER PRIMARY KEY,
    ID_Transacao NUMBER,
    ValorPago NUMBER,
    DataHoraPagamento TIMESTAMP,
    FOREIGN KEY (ID_Transacao) REFERENCES Transacoes(ID_Transacao)
);

CREATE TABLE Itens (
    ID_Item NUMBER PRIMARY KEY,
    DescricaoItem VARCHAR2(100)
);

CREATE TABLE Descontos (
    ID_Desconto NUMBER PRIMARY KEY,
    DescricaoDesconto VARCHAR2(100),
    ValorDesconto NUMBER
);

CREATE TABLE Monitoramento (
    ID_Monitoramento NUMBER PRIMARY KEY,
    ID_Praca NUMBER,
    DataHoraMonitoramento TIMESTAMP,
    Descricao VARCHAR2(100),
    FOREIGN KEY (ID_Praca) REFERENCES Pracas(ID_Praca)
);

CREATE TABLE Manutencoes (
    ID_Manutencao NUMBER PRIMARY KEY,
    ID_Praca NUMBER,
    DataHoraManutencao TIMESTAMP,
    Descricao VARCHAR2(100),
    FOREIGN KEY (ID_Praca) REFERENCES Pracas(ID_Praca)
);

CREATE TABLE ModelosCameras (
    ID_ModeloCamera NUMBER PRIMARY KEY,
    NomeModelo VARCHAR2(100),
    Descricao VARCHAR2(100)
);

CREATE TABLE Clientes (
    ID_Cliente NUMBER PRIMARY KEY,
    NomeCliente VARCHAR2(100),
    Endereco VARCHAR2(200),
    InformacoesContato VARCHAR2(100)
);

CREATE TABLE MonitoramentoEquipamentos (
    ID_Equipamento NUMBER PRIMARY KEY,
    NomeEquipamento VARCHAR2(100),
    TipoEquipamento VARCHAR2(100),
    NumeroSerie VARCHAR2(100),
    Fabricante VARCHAR2(100),
    Modelo VARCHAR2(100),
    StatusEquipamento VARCHAR2(100),
    DataHoraUltimaVerificacao TIMESTAMP,
    Descricao VARCHAR2(100)
);

CREATE TABLE Alertas (
    ID_Alerta NUMBER PRIMARY KEY,
    ID_Equipamento NUMBER,
    TipoAlerta VARCHAR2(100),
    PrioridadeAlerta VARCHAR2(100),
    DataHoraAlerta TIMESTAMP,
    DescricaoAlerta VARCHAR2(200),
    StatusAlerta VARCHAR2(100),
    ID_OperadorResponsavel NUMBER,
    FOREIGN KEY (ID_Equipamento) REFERENCES MonitoramentoEquipamentos(ID_Equipamento),
    FOREIGN KEY (ID_OperadorResponsavel) REFERENCES Usuarios(ID_Usuario)
);

CREATE TABLE HistoricoAlertas (
    ID_Historico NUMBER PRIMARY KEY,
    ID_Alerta NUMBER,
    DataHoraResolucao TIMESTAMP,
    DescricaoResolucao VARCHAR2(200),
    ID_OperadorResponsavelResolucao NUMBER,
    FOREIGN KEY (ID_Alerta) REFERENCES Alertas(ID_Alerta),
    FOREIGN KEY (ID_OperadorResponsavelResolucao) REFERENCES Usuarios(ID_Usuario)
);
