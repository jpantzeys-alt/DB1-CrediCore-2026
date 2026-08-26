-- ============================================================
-- PROYECTO CrediCore
-- FASE 1 - Cimientos de Titanio
-- DDL y Restricciones de Dominio
-- ============================================================


-- ============================================================
-- 1. CREACIÓN DE LA BASE DE DATOS
-- ============================================================

USE master;


CREATE DATABASE Crediccore;
GO

-- ============================================================
-- 2. SELECCIÓN DE LA BASE DE DATOS
-- ============================================================

USE Crediccore;
GO


-- ============================================================
-- 3. CREACIÓN DE ESQUEMAS
-- ============================================================

CREATE SCHEMA Operaciones;
GO

CREATE SCHEMA Garantias;
GO


-- ============================================================
-- 4. TABLA CLIENTES
-- ============================================================

CREATE TABLE Operaciones.Clientes
(
    IdCliente INT IDENTITY(1,1) NOT NULL,
    Nombres VARCHAR(100) NOT NULL,
    Apellidos VARCHAR(100) NOT NULL,
    DPI VARCHAR(13) NOT NULL,
    Telefono VARCHAR(20) NOT NULL,
    Correo VARCHAR(150) NOT NULL
);



-- ============================================================
-- 5. RESTRICCIONES DE CLIENTES
-- ============================================================

ALTER TABLE Operaciones.Clientes
ADD CONSTRAINT PK_Clientes
PRIMARY KEY (IdCliente);
GO

ALTER TABLE Operaciones.Clientes
ADD CONSTRAINT UQ_Clientes_DPI
UNIQUE (DPI);
GO


-- ============================================================
-- 6. TABLA VEHICULOS
-- ============================================================

CREATE TABLE Garantias.Vehiculos
(
    IdVehiculo INT IDENTITY(1,1) NOT NULL,
    Modelo VARCHAR(50) NOT NULL,
    Marca VARCHAR(50) NOT NULL,
    Anio INT NOT NULL,
    Color VARCHAR(30) NOT NULL,
    NumeroTituloPropiedad VARCHAR(50) NOT NULL,
    Placa VARCHAR(20) NOT NULL,
    NumeroChasis VARCHAR(50) NOT NULL
);



-- ============================================================
-- 7. RESTRICCIONES DE VEHICULOS
-- ============================================================

ALTER TABLE Garantias.Vehiculos
ADD CONSTRAINT PK_Vehiculos
PRIMARY KEY (IdVehiculo);
GO

ALTER TABLE Garantias.Vehiculos
ADD CONSTRAINT CK_Vehiculos_Anio
CHECK (Anio >= 2011);
GO

ALTER TABLE Garantias.Vehiculos
ADD CONSTRAINT UQ_Vehiculos_Placa
UNIQUE (Placa);
GO

ALTER TABLE Garantias.Vehiculos
ADD CONSTRAINT UQ_Vehiculos_Chasis
UNIQUE (NumeroChasis);
GO


-- ============================================================
-- 8. TABLA CREDITOS
-- ============================================================

CREATE TABLE Operaciones.Creditos
(
    IdCredito INT IDENTITY(1,1) NOT NULL,
    IdCliente INT NOT NULL,
    IdVehiculo INT NOT NULL,
    MontoCapital DECIMAL(18,2) NOT NULL,
    TasaInteresMensual DECIMAL(5,2) NOT NULL,
    Estado VARCHAR(20) NOT NULL,
    FechaDesembolso DATETIME NOT NULL
);



-- ============================================================
-- 9. RESTRICCIONES DE CREDITOS
-- ============================================================

ALTER TABLE Operaciones.Creditos
ADD CONSTRAINT PK_Creditos
PRIMARY KEY (IdCredito);
GO

ALTER TABLE Operaciones.Creditos
ADD CONSTRAINT CK_Creditos_Monto
CHECK (MontoCapital > 1000);
GO

ALTER TABLE Operaciones.Creditos
ADD CONSTRAINT CK_Creditos_Tasa
CHECK (TasaInteresMensual >= 0);

ALTER TABLE Operaciones.Creditos
ADD CONSTRAINT DF_Creditos_Estado
DEFAULT 'Activo' FOR Estado;
GO

ALTER TABLE Operaciones.Creditos
ADD CONSTRAINT DF_Creditos_FechaDesembolso
DEFAULT GETDATE() FOR FechaDesembolso;
GO


-- ============================================================
-- FIN DEL SCRIPT
-- ============================================================

