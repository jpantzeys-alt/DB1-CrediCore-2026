-- ============================================================
-- PROYECTO CREDICORE - TAREA 5 (FASE 3)
-- EL TEJIDO RELACIONAL Y ANÁLISIS ESTRATÉGICO
-- ============================================================

USE CrediiCore;
GO

-- 1. Limpieza previa 
ALTER TABLE Operaciones.Creditos DROP CONSTRAINT IF EXISTS FK_Creditos_Clientes;
ALTER TABLE Operaciones.Creditos DROP CONSTRAINT IF EXISTS FK_Creditos_Vehiculos;
GO

-- ============================================================
-- PARTE A: EL ESCUDO RELACIONAL
-- ============================================================

-- 1. Activación de Restricciones Foráneas (FOREIGN KEYS)

ALTER TABLE Operaciones.Creditos
ADD CONSTRAINT FK_Creditos_Clientes
FOREIGN KEY (IdCliente) REFERENCES Operaciones.Clientes(IdCliente);

ALTER TABLE Operaciones.Creditos
ADD CONSTRAINT FK_Creditos_Vehiculos
FOREIGN KEY (IdVehiculo) REFERENCES Garantias.Vehiculos(IdVehiculo);
GO

-- 2. La Prueba de Destrucción 
-- Intentamos borrar al cliente con ID 10, quien actualmente tiene un crédito activo.
-- ¡El motor de la base de datos bloqueará esto!
DELETE FROM Operaciones.Clientes 
WHERE IdCliente = 10;
GO

-- ============================================================
-- PARTE B: RECONSTRUCCIÓN DE LA REALIDAD (JOINs)
-- ============================================================

-- 1. El Reporte Maestro (INNER JOIN Triple)

SELECT 
    c.Nombres + ' ' + c.Apellidos AS NombreCliente,
    c.Telefono,
    v.Marca AS MarcaVehiculo,
    v.Placa,
    cr.MontoCapital,
    cr.Estado
FROM Operaciones.Creditos cr
INNER JOIN Operaciones.Clientes c 
    ON cr.IdCliente = c.IdCliente
INNER JOIN Garantias.Vehiculos v 
    ON cr.IdVehiculo = v.IdVehiculo;
GO

-- 2. Minería de Potenciales Clientes (LEFT JOIN) 
-- Buscar clientes que NUNCA han tramitado un crédito (Buscando los NULL)
SELECT 
    c.Nombres + ' ' + c.Apellidos AS NombreCliente,
    c.Telefono
FROM Operaciones.Clientes c
LEFT JOIN Operaciones.Creditos cr 
    ON c.IdCliente = cr.IdCliente
WHERE cr.IdCredito IS NULL;
GO

-- ============================================================
-- PARTE C: EL CEREBRO ANALÍTICO (SUBCONSULTAS)
-- ============================================================

-- 1. 
-- Créditos cuyo capital es estrictamente mayor al promedio histórico
SELECT 
    c.Nombres + ' ' + c.Apellidos AS NombreCliente,
    cr.MontoCapital
FROM Operaciones.Creditos cr
INNER JOIN Operaciones.Clientes c 
    ON cr.IdCliente = c.IdCliente
WHERE cr.MontoCapital > (
    -- Subconsulta que calcula el promedio en milisegundos
    SELECT AVG(MontoCapital) 
    FROM Operaciones.Creditos
);
GO

-- 2. Patrones Anidados (Subconsulta con IN)
-- Clientes que dejaron como garantía vehículos del 2011 hacia atrás.
SELECT 
    c.Nombres + ' ' + c.Apellidos AS NombreCliente,
    cr.IdCredito
FROM Operaciones.Creditos cr
INNER JOIN Operaciones.Clientes c 
    ON cr.IdCliente = c.IdCliente
WHERE cr.IdVehiculo IN (
    -- Subconsulta interna evaluando el año
    SELECT IdVehiculo 
    FROM Garantias.Vehiculos 
    WHERE Anio <= 2011
);
GO
-------


