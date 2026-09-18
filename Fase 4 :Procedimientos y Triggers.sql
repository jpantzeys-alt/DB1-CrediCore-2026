USE CrediiCore;
GO

-- ============================================================
-- PROYECTO CREDICORE - FASE 4
-- PROGRAMABILIDAD Y AUDITORÍA ACTIVA
-- ============================================================

-- ============================================================
-- 1. TABLAS DE SOPORTE PARA LÓGICA Y AUDITORÍA
-- ============================================================
IF OBJECT_ID('Operaciones.HistorialPagos', 'U') IS NULL
BEGIN
    CREATE TABLE Operaciones.HistorialPagos (
        IdPago INT IDENTITY(1,1) PRIMARY KEY,
        IdCredito INT NOT NULL,
        MontoAbono DECIMAL(18,2) NOT NULL,
        FechaPago DATETIME DEFAULT GETDATE(),
        CONSTRAINT FK_Historial_Creditos FOREIGN KEY (IdCredito) REFERENCES Operaciones.Creditos(IdCredito)
    );
END
GO

IF SCHEMA_ID('Auditoria') IS NULL
    EXEC('CREATE SCHEMA Auditoria');
GO

IF OBJECT_ID('Auditoria.Logs_Creditos', 'U') IS NULL
BEGIN
    CREATE TABLE Auditoria.Logs_Creditos (
        IdLog INT IDENTITY(1,1) PRIMARY KEY,
        Accion VARCHAR(255) NOT NULL,
        ValorAnterior DECIMAL(5,2),
        ValorNuevo DECIMAL(5,2),
        FechaHora DATETIME DEFAULT GETDATE()
    );
END
GO

-- ============================================================
-- PARTE A: LA CAPA DE ABSTRACCIÓN (VISTAS)
-- ============================================================
CREATE OR ALTER VIEW Operaciones.vw_AtencionAlCliente AS
SELECT 
    c.Nombres + ' ' + c.Apellidos AS NombreCliente, 
    cr.IdCredito AS NumeroCredito,                  
    v.Marca AS MarcaVehiculo,                       
    cr.Estado AS EstadoCredito,                     
    cr.SaldoActual 
FROM Operaciones.Creditos cr                        
INNER JOIN Operaciones.Clientes c                   
    ON cr.IdCliente = c.IdCliente                   
INNER JOIN Garantias.Vehiculos v                    
    ON cr.IdVehiculo = v.IdVehiculo;                
GO

-- ============================================================
-- PARTE B: LÓGICA DE NEGOCIO SEGURA (STORED PROCEDURE)
-- ============================================================
CREATE OR ALTER PROCEDURE Operaciones.SP_ProcesarPago
    @IdCredito INT,
    @MontoAbono DECIMAL(18,2)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRAN; 

        DECLARE @SaldoActual DECIMAL(18,2);
        
        -- Obtener el saldo actual del crédito
        SELECT @SaldoActual = SaldoActual 
        FROM Operaciones.Creditos 
        WHERE IdCredito = @IdCredito;

        -- Validación de negocio
        IF @MontoAbono > @SaldoActual
        BEGIN
            -- Lanza un error intencional y salta al CATCH
            THROW 50000, 'Error: El monto de abono supera el saldo actual del crédito.', 1;
        END

        -- 1. Registrar el pago
        INSERT INTO Operaciones.HistorialPagos (IdCredito, MontoAbono)
        VALUES (@IdCredito, @MontoAbono);

        -- 2. Actualizar el saldo
        UPDATE Operaciones.Creditos
        SET SaldoActual = SaldoActual - @MontoAbono
        WHERE IdCredito = @IdCredito;

        COMMIT TRAN; 
    END TRY
    BEGIN CATCH
        -- Si ocurre cualquier error, se deshace todo
        IF @@TRANCOUNT > 0
            ROLLBACK TRAN;
        
        -- Relanzar el error para que la aplicación frontend se entere
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO

-- ============================================================
-- PARTE C: EL AUDITOR SILENCIOSO (TRIGGER)
-- ============================================================
CREATE OR ALTER TRIGGER Operaciones.TR_Auditoria_TasaInteres
ON Operaciones.Creditos
AFTER UPDATE
AS
BEGIN
    -- Verifica si la columna afectada fue específicamente TasaInteres
    IF UPDATE(TasaInteres)
    BEGIN
        INSERT INTO Auditoria.Logs_Creditos (Accion, ValorAnterior, ValorNuevo, FechaHora)
        SELECT 
            'Modificación sospechosa de Tasa de Interés en Crédito ID: ' + CAST(i.IdCredito AS VARCHAR),
            d.TasaInteres, 
            i.TasaInteres, 
            GETDATE()
        FROM inserted i
        INNER JOIN deleted d ON i.IdCredito = d.IdCredito
        WHERE i.TasaInteres <> d.TasaInteres; -- Asegura que el valor realmente cambió
    END
END;
GO
