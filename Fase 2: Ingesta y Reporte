-- ============================================================
-- PROYECTO CREDICORE - TAREA 4
-- FASE 2: INGESTA MASIVA E INTELIGENCIA DE NEGOCIOS
-- ============================================================


-- ============================================================
-- 1. VERIFICACIÓN INICIAL DE LA BASE DE DATOS Y TABLAS
-- ============================================================

USE CrediiCore;

SELECT
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
ORDER BY TABLE_SCHEMA, TABLE_NAME;


-- ============================================================
-- 2. VERIFICACIÓN DE REGISTROS EXISTENTES
-- ============================================================

USE CrediiCore;

SELECT COUNT(*) AS TotalClientes
FROM Operaciones.Clientes;

SELECT COUNT(*) AS TotalVehiculos
FROM Garantias.Vehiculos;

SELECT COUNT(*) AS TotalCreditos
FROM Operaciones.Creditos;


-- ============================================================
-- 3. VISUALIZACIÓN DE CLIENTES
-- ============================================================

USE CrediiCore;

SELECT *
FROM Operaciones.Clientes;


-- ============================================================
-- 4. LIMPIEZA DE DATOS ANTERIORES
-- NOTA: Ejecutar únicamente si se desea reiniciar la carga.
-- ============================================================

DELETE FROM Operaciones.Creditos;
DELETE FROM Garantias.Vehiculos;
DELETE FROM Operaciones.Clientes;


-- ============================================================
-- 5. INGESTA MASIVA - 1,500 VEHÍCULOS
-- ============================================================

USE CrediiCore;

;WITH Numeros AS
(
    SELECT TOP (1500)
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS N
    FROM sys.all_objects a
    CROSS JOIN sys.all_objects b
)
INSERT INTO Garantias.Vehiculos
(
    Modelo,
    Marca,
    Anio,
    Color,
    NumeroTituloPropiedad,
    Placa,
    NumeroChasis
)
SELECT
    CASE (N % 10)
        WHEN 0 THEN 'Corolla'
        WHEN 1 THEN 'Civic'
        WHEN 2 THEN 'Hilux'
        WHEN 3 THEN 'RAV4'
        WHEN 4 THEN 'Mazda 3'
        WHEN 5 THEN 'CR-V'
        WHEN 6 THEN 'Elantra'
        WHEN 7 THEN 'Tucson'
        WHEN 8 THEN 'Sentra'
        ELSE 'Yaris'
    END AS Modelo,

    CASE (N % 8)
        WHEN 0 THEN 'Toyota'
        WHEN 1 THEN 'Honda'
        WHEN 2 THEN 'Mazda'
        WHEN 3 THEN 'Hyundai'
        WHEN 4 THEN 'Nissan'
        WHEN 5 THEN 'Kia'
        WHEN 6 THEN 'Ford'
        ELSE 'Chevrolet'
    END AS Marca,

    2011 + (N % 16) AS Anio,

    CASE (N % 6)
        WHEN 0 THEN 'Blanco'
        WHEN 1 THEN 'Negro'
        WHEN 2 THEN 'Gris'
        WHEN 3 THEN 'Rojo'
        WHEN 4 THEN 'Azul'
        ELSE 'Plata'
    END AS Color,

    'TIT-' + RIGHT('000000' + CAST(N AS VARCHAR(6)), 6)
        AS NumeroTituloPropiedad,

    'P' + RIGHT('000000' + CAST(N AS VARCHAR(6)), 6)
        AS Placa,

    'CHS-' + RIGHT('000000000' + CAST(N AS VARCHAR(9)), 9)
        AS NumeroChasis

FROM Numeros;


-- ============================================================
-- 6. VERIFICACIÓN DE LOS 1,500 VEHÍCULOS
-- ============================================================

SELECT COUNT(*) AS TotalVehiculos
FROM Garantias.Vehiculos;


-- ============================================================
-- 7. COMPROBACIÓN DE REGISTROS Y RESTRICCIONES
-- ============================================================

SELECT TOP 10 *
FROM Garantias.Vehiculos
ORDER BY IdVehiculo;


-- ============================================================
-- 8. INGESTA OFIMÁTICA - 500 CLIENTES MEDIANTE EXCEL
-- ============================================================

/*
Las 500 sentencias INSERT fueron generadas mediante Excel
utilizando la función CONCATENAR.

Ejemplo de fórmula utilizada:

=CONCATENAR("INSERT INTO Operaciones.Clientes
(Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('";
B2;"', '";C2;"', '";D2;"', '";E2;"', '";F2;"');")

Las 500 sentencias generadas se ejecutaron en DBeaver.
*/


INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan2', 'Perez2', '1000000000002', '55550002', 'cliente2@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan3', 'Perez3', '1000000000003', '55550003', 'cliente3@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan4', 'Perez4', '1000000000004', '55550004', 'cliente4@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan5', 'Perez5', '1000000000005', '55550005', 'cliente5@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan6', 'Perez6', '1000000000006', '55550006', 'cliente6@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan7', 'Perez7', '1000000000007', '55550007', 'cliente7@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan8', 'Perez8', '1000000000008', '55550008', 'cliente8@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan9', 'Perez9', '1000000000009', '55550009', 'cliente9@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan10', 'Perez10', '1000000000010', '55550010', 'cliente10@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan11', 'Perez11', '1000000000011', '55550011', 'cliente11@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan12', 'Perez12', '1000000000012', '55550012', 'cliente12@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan13', 'Perez13', '1000000000013', '55550013', 'cliente13@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan14', 'Perez14', '1000000000014', '55550014', 'cliente14@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan15', 'Perez15', '1000000000015', '55550015', 'cliente15@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan16', 'Perez16', '1000000000016', '55550016', 'cliente16@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan17', 'Perez17', '1000000000017', '55550017', 'cliente17@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan18', 'Perez18', '1000000000018', '55550018', 'cliente18@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan19', 'Perez19', '1000000000019', '55550019', 'cliente19@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan20', 'Perez20', '1000000000020', '55550020', 'cliente20@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan21', 'Perez21', '1000000000021', '55550021', 'cliente21@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan22', 'Perez22', '1000000000022', '55550022', 'cliente22@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan23', 'Perez23', '1000000000023', '55550023', 'cliente23@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan24', 'Perez24', '1000000000024', '55550024', 'cliente24@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan25', 'Perez25', '1000000000025', '55550025', 'cliente25@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan26', 'Perez26', '1000000000026', '55550026', 'cliente26@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan27', 'Perez27', '1000000000027', '55550027', 'cliente27@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan28', 'Perez28', '1000000000028', '55550028', 'cliente28@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan29', 'Perez29', '1000000000029', '55550029', 'cliente29@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan30', 'Perez30', '1000000000030', '55550030', 'cliente30@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan31', 'Perez31', '1000000000031', '55550031', 'cliente31@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan32', 'Perez32', '1000000000032', '55550032', 'cliente32@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan33', 'Perez33', '1000000000033', '55550033', 'cliente33@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan34', 'Perez34', '1000000000034', '55550034', 'cliente34@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan35', 'Perez35', '1000000000035', '55550035', 'cliente35@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan36', 'Perez36', '1000000000036', '55550036', 'cliente36@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan37', 'Perez37', '1000000000037', '55550037', 'cliente37@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan38', 'Perez38', '1000000000038', '55550038', 'cliente38@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan39', 'Perez39', '1000000000039', '55550039', 'cliente39@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan40', 'Perez40', '1000000000040', '55550040', 'cliente40@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan41', 'Perez41', '1000000000041', '55550041', 'cliente41@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan42', 'Perez42', '1000000000042', '55550042', 'cliente42@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan43', 'Perez43', '1000000000043', '55550043', 'cliente43@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan44', 'Perez44', '1000000000044', '55550044', 'cliente44@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan45', 'Perez45', '1000000000045', '55550045', 'cliente45@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan46', 'Perez46', '1000000000046', '55550046', 'cliente46@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan47', 'Perez47', '1000000000047', '55550047', 'cliente47@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan48', 'Perez48', '1000000000048', '55550048', 'cliente48@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan49', 'Perez49', '1000000000049', '55550049', 'cliente49@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan50', 'Perez50', '1000000000050', '55550050', 'cliente50@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan51', 'Perez51', '1000000000051', '55550051', 'cliente51@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan52', 'Perez52', '1000000000052', '55550052', 'cliente52@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan53', 'Perez53', '1000000000053', '55550053', 'cliente53@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan54', 'Perez54', '1000000000054', '55550054', 'cliente54@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan55', 'Perez55', '1000000000055', '55550055', 'cliente55@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan56', 'Perez56', '1000000000056', '55550056', 'cliente56@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan57', 'Perez57', '1000000000057', '55550057', 'cliente57@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan58', 'Perez58', '1000000000058', '55550058', 'cliente58@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan59', 'Perez59', '1000000000059', '55550059', 'cliente59@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan60', 'Perez60', '1000000000060', '55550060', 'cliente60@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan61', 'Perez61', '1000000000061', '55550061', 'cliente61@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan62', 'Perez62', '1000000000062', '55550062', 'cliente62@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan63', 'Perez63', '1000000000063', '55550063', 'cliente63@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan64', 'Perez64', '1000000000064', '55550064', 'cliente64@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan65', 'Perez65', '1000000000065', '55550065', 'cliente65@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan66', 'Perez66', '1000000000066', '55550066', 'cliente66@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan67', 'Perez67', '1000000000067', '55550067', 'cliente67@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan68', 'Perez68', '1000000000068', '55550068', 'cliente68@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan69', 'Perez69', '1000000000069', '55550069', 'cliente69@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan70', 'Perez70', '1000000000070', '55550070', 'cliente70@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan71', 'Perez71', '1000000000071', '55550071', 'cliente71@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan72', 'Perez72', '1000000000072', '55550072', 'cliente72@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan73', 'Perez73', '1000000000073', '55550073', 'cliente73@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan74', 'Perez74', '1000000000074', '55550074', 'cliente74@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan75', 'Perez75', '1000000000075', '55550075', 'cliente75@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan76', 'Perez76', '1000000000076', '55550076', 'cliente76@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan77', 'Perez77', '1000000000077', '55550077', 'cliente77@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan78', 'Perez78', '1000000000078', '55550078', 'cliente78@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan79', 'Perez79', '1000000000079', '55550079', 'cliente79@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan80', 'Perez80', '1000000000080', '55550080', 'cliente80@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan81', 'Perez81', '1000000000081', '55550081', 'cliente81@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan82', 'Perez82', '1000000000082', '55550082', 'cliente82@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan83', 'Perez83', '1000000000083', '55550083', 'cliente83@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan84', 'Perez84', '1000000000084', '55550084', 'cliente84@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan85', 'Perez85', '1000000000085', '55550085', 'cliente85@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan86', 'Perez86', '1000000000086', '55550086', 'cliente86@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan87', 'Perez87', '1000000000087', '55550087', 'cliente87@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan88', 'Perez88', '1000000000088', '55550088', 'cliente88@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan89', 'Perez89', '1000000000089', '55550089', 'cliente89@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan90', 'Perez90', '1000000000090', '55550090', 'cliente90@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan91', 'Perez91', '1000000000091', '55550091', 'cliente91@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan92', 'Perez92', '1000000000092', '55550092', 'cliente92@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan93', 'Perez93', '1000000000093', '55550093', 'cliente93@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan94', 'Perez94', '1000000000094', '55550094', 'cliente94@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan95', 'Perez95', '1000000000095', '55550095', 'cliente95@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan96', 'Perez96', '1000000000096', '55550096', 'cliente96@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan97', 'Perez97', '1000000000097', '55550097', 'cliente97@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan98', 'Perez98', '1000000000098', '55550098', 'cliente98@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan99', 'Perez99', '1000000000099', '55550099', 'cliente99@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan100', 'Perez100', '1000000000100', '55550100', 'cliente100@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan101', 'Perez101', '1000000000101', '55550101', 'cliente101@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan102', 'Perez102', '1000000000102', '55550102', 'cliente102@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan103', 'Perez103', '1000000000103', '55550103', 'cliente103@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan104', 'Perez104', '1000000000104', '55550104', 'cliente104@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan105', 'Perez105', '1000000000105', '55550105', 'cliente105@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan106', 'Perez106', '1000000000106', '55550106', 'cliente106@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan107', 'Perez107', '1000000000107', '55550107', 'cliente107@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan108', 'Perez108', '1000000000108', '55550108', 'cliente108@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan109', 'Perez109', '1000000000109', '55550109', 'cliente109@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan110', 'Perez110', '1000000000110', '55550110', 'cliente110@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan111', 'Perez111', '1000000000111', '55550111', 'cliente111@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan112', 'Perez112', '1000000000112', '55550112', 'cliente112@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan113', 'Perez113', '1000000000113', '55550113', 'cliente113@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan114', 'Perez114', '1000000000114', '55550114', 'cliente114@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan115', 'Perez115', '1000000000115', '55550115', 'cliente115@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan116', 'Perez116', '1000000000116', '55550116', 'cliente116@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan117', 'Perez117', '1000000000117', '55550117', 'cliente117@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan118', 'Perez118', '1000000000118', '55550118', 'cliente118@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan119', 'Perez119', '1000000000119', '55550119', 'cliente119@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan120', 'Perez120', '1000000000120', '55550120', 'cliente120@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan121', 'Perez121', '1000000000121', '55550121', 'cliente121@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan122', 'Perez122', '1000000000122', '55550122', 'cliente122@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan123', 'Perez123', '1000000000123', '55550123', 'cliente123@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan124', 'Perez124', '1000000000124', '55550124', 'cliente124@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan125', 'Perez125', '1000000000125', '55550125', 'cliente125@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan126', 'Perez126', '1000000000126', '55550126', 'cliente126@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan127', 'Perez127', '1000000000127', '55550127', 'cliente127@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan128', 'Perez128', '1000000000128', '55550128', 'cliente128@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan129', 'Perez129', '1000000000129', '55550129', 'cliente129@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan130', 'Perez130', '1000000000130', '55550130', 'cliente130@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan131', 'Perez131', '1000000000131', '55550131', 'cliente131@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan132', 'Perez132', '1000000000132', '55550132', 'cliente132@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan133', 'Perez133', '1000000000133', '55550133', 'cliente133@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan134', 'Perez134', '1000000000134', '55550134', 'cliente134@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan135', 'Perez135', '1000000000135', '55550135', 'cliente135@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan136', 'Perez136', '1000000000136', '55550136', 'cliente136@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan137', 'Perez137', '1000000000137', '55550137', 'cliente137@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan138', 'Perez138', '1000000000138', '55550138', 'cliente138@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan139', 'Perez139', '1000000000139', '55550139', 'cliente139@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan140', 'Perez140', '1000000000140', '55550140', 'cliente140@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan141', 'Perez141', '1000000000141', '55550141', 'cliente141@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan142', 'Perez142', '1000000000142', '55550142', 'cliente142@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan143', 'Perez143', '1000000000143', '55550143', 'cliente143@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan144', 'Perez144', '1000000000144', '55550144', 'cliente144@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan145', 'Perez145', '1000000000145', '55550145', 'cliente145@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan146', 'Perez146', '1000000000146', '55550146', 'cliente146@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan147', 'Perez147', '1000000000147', '55550147', 'cliente147@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan148', 'Perez148', '1000000000148', '55550148', 'cliente148@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan149', 'Perez149', '1000000000149', '55550149', 'cliente149@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan150', 'Perez150', '1000000000150', '55550150', 'cliente150@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan151', 'Perez151', '1000000000151', '55550151', 'cliente151@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan152', 'Perez152', '1000000000152', '55550152', 'cliente152@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan153', 'Perez153', '1000000000153', '55550153', 'cliente153@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan154', 'Perez154', '1000000000154', '55550154', 'cliente154@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan155', 'Perez155', '1000000000155', '55550155', 'cliente155@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan156', 'Perez156', '1000000000156', '55550156', 'cliente156@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan157', 'Perez157', '1000000000157', '55550157', 'cliente157@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan158', 'Perez158', '1000000000158', '55550158', 'cliente158@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan159', 'Perez159', '1000000000159', '55550159', 'cliente159@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan160', 'Perez160', '1000000000160', '55550160', 'cliente160@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan161', 'Perez161', '1000000000161', '55550161', 'cliente161@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan162', 'Perez162', '1000000000162', '55550162', 'cliente162@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan163', 'Perez163', '1000000000163', '55550163', 'cliente163@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan164', 'Perez164', '1000000000164', '55550164', 'cliente164@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan165', 'Perez165', '1000000000165', '55550165', 'cliente165@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan166', 'Perez166', '1000000000166', '55550166', 'cliente166@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan167', 'Perez167', '1000000000167', '55550167', 'cliente167@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan168', 'Perez168', '1000000000168', '55550168', 'cliente168@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan169', 'Perez169', '1000000000169', '55550169', 'cliente169@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan170', 'Perez170', '1000000000170', '55550170', 'cliente170@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan171', 'Perez171', '1000000000171', '55550171', 'cliente171@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan172', 'Perez172', '1000000000172', '55550172', 'cliente172@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan173', 'Perez173', '1000000000173', '55550173', 'cliente173@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan174', 'Perez174', '1000000000174', '55550174', 'cliente174@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan175', 'Perez175', '1000000000175', '55550175', 'cliente175@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan176', 'Perez176', '1000000000176', '55550176', 'cliente176@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan177', 'Perez177', '1000000000177', '55550177', 'cliente177@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan178', 'Perez178', '1000000000178', '55550178', 'cliente178@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan179', 'Perez179', '1000000000179', '55550179', 'cliente179@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan180', 'Perez180', '1000000000180', '55550180', 'cliente180@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan181', 'Perez181', '1000000000181', '55550181', 'cliente181@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan182', 'Perez182', '1000000000182', '55550182', 'cliente182@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan183', 'Perez183', '1000000000183', '55550183', 'cliente183@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan184', 'Perez184', '1000000000184', '55550184', 'cliente184@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan185', 'Perez185', '1000000000185', '55550185', 'cliente185@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan186', 'Perez186', '1000000000186', '55550186', 'cliente186@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan187', 'Perez187', '1000000000187', '55550187', 'cliente187@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan188', 'Perez188', '1000000000188', '55550188', 'cliente188@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan189', 'Perez189', '1000000000189', '55550189', 'cliente189@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan190', 'Perez190', '1000000000190', '55550190', 'cliente190@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan191', 'Perez191', '1000000000191', '55550191', 'cliente191@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan192', 'Perez192', '1000000000192', '55550192', 'cliente192@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan193', 'Perez193', '1000000000193', '55550193', 'cliente193@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan194', 'Perez194', '1000000000194', '55550194', 'cliente194@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan195', 'Perez195', '1000000000195', '55550195', 'cliente195@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan196', 'Perez196', '1000000000196', '55550196', 'cliente196@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan197', 'Perez197', '1000000000197', '55550197', 'cliente197@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan198', 'Perez198', '1000000000198', '55550198', 'cliente198@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan199', 'Perez199', '1000000000199', '55550199', 'cliente199@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan200', 'Perez200', '1000000000200', '55550200', 'cliente200@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan201', 'Perez201', '1000000000201', '55550201', 'cliente201@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan202', 'Perez202', '1000000000202', '55550202', 'cliente202@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan203', 'Perez203', '1000000000203', '55550203', 'cliente203@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan204', 'Perez204', '1000000000204', '55550204', 'cliente204@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan205', 'Perez205', '1000000000205', '55550205', 'cliente205@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan206', 'Perez206', '1000000000206', '55550206', 'cliente206@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan207', 'Perez207', '1000000000207', '55550207', 'cliente207@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan208', 'Perez208', '1000000000208', '55550208', 'cliente208@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan209', 'Perez209', '1000000000209', '55550209', 'cliente209@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan210', 'Perez210', '1000000000210', '55550210', 'cliente210@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan211', 'Perez211', '1000000000211', '55550211', 'cliente211@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan212', 'Perez212', '1000000000212', '55550212', 'cliente212@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan213', 'Perez213', '1000000000213', '55550213', 'cliente213@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan214', 'Perez214', '1000000000214', '55550214', 'cliente214@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan215', 'Perez215', '1000000000215', '55550215', 'cliente215@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan216', 'Perez216', '1000000000216', '55550216', 'cliente216@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan217', 'Perez217', '1000000000217', '55550217', 'cliente217@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan218', 'Perez218', '1000000000218', '55550218', 'cliente218@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan219', 'Perez219', '1000000000219', '55550219', 'cliente219@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan220', 'Perez220', '1000000000220', '55550220', 'cliente220@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan221', 'Perez221', '1000000000221', '55550221', 'cliente221@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan222', 'Perez222', '1000000000222', '55550222', 'cliente222@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan223', 'Perez223', '1000000000223', '55550223', 'cliente223@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan224', 'Perez224', '1000000000224', '55550224', 'cliente224@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan225', 'Perez225', '1000000000225', '55550225', 'cliente225@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan226', 'Perez226', '1000000000226', '55550226', 'cliente226@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan227', 'Perez227', '1000000000227', '55550227', 'cliente227@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan228', 'Perez228', '1000000000228', '55550228', 'cliente228@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan229', 'Perez229', '1000000000229', '55550229', 'cliente229@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan230', 'Perez230', '1000000000230', '55550230', 'cliente230@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan231', 'Perez231', '1000000000231', '55550231', 'cliente231@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan232', 'Perez232', '1000000000232', '55550232', 'cliente232@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan233', 'Perez233', '1000000000233', '55550233', 'cliente233@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan234', 'Perez234', '1000000000234', '55550234', 'cliente234@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan235', 'Perez235', '1000000000235', '55550235', 'cliente235@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan236', 'Perez236', '1000000000236', '55550236', 'cliente236@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan237', 'Perez237', '1000000000237', '55550237', 'cliente237@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan238', 'Perez238', '1000000000238', '55550238', 'cliente238@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan239', 'Perez239', '1000000000239', '55550239', 'cliente239@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan240', 'Perez240', '1000000000240', '55550240', 'cliente240@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan241', 'Perez241', '1000000000241', '55550241', 'cliente241@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan242', 'Perez242', '1000000000242', '55550242', 'cliente242@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan243', 'Perez243', '1000000000243', '55550243', 'cliente243@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan244', 'Perez244', '1000000000244', '55550244', 'cliente244@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan245', 'Perez245', '1000000000245', '55550245', 'cliente245@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan246', 'Perez246', '1000000000246', '55550246', 'cliente246@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan247', 'Perez247', '1000000000247', '55550247', 'cliente247@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan248', 'Perez248', '1000000000248', '55550248', 'cliente248@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan249', 'Perez249', '1000000000249', '55550249', 'cliente249@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan250', 'Perez250', '1000000000250', '55550250', 'cliente250@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan251', 'Perez251', '1000000000251', '55550251', 'cliente251@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan252', 'Perez252', '1000000000252', '55550252', 'cliente252@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan253', 'Perez253', '1000000000253', '55550253', 'cliente253@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan254', 'Perez254', '1000000000254', '55550254', 'cliente254@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan255', 'Perez255', '1000000000255', '55550255', 'cliente255@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan256', 'Perez256', '1000000000256', '55550256', 'cliente256@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan257', 'Perez257', '1000000000257', '55550257', 'cliente257@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan258', 'Perez258', '1000000000258', '55550258', 'cliente258@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan259', 'Perez259', '1000000000259', '55550259', 'cliente259@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan260', 'Perez260', '1000000000260', '55550260', 'cliente260@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan261', 'Perez261', '1000000000261', '55550261', 'cliente261@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan262', 'Perez262', '1000000000262', '55550262', 'cliente262@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan263', 'Perez263', '1000000000263', '55550263', 'cliente263@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan264', 'Perez264', '1000000000264', '55550264', 'cliente264@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan265', 'Perez265', '1000000000265', '55550265', 'cliente265@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan266', 'Perez266', '1000000000266', '55550266', 'cliente266@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan267', 'Perez267', '1000000000267', '55550267', 'cliente267@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan268', 'Perez268', '1000000000268', '55550268', 'cliente268@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan269', 'Perez269', '1000000000269', '55550269', 'cliente269@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan270', 'Perez270', '1000000000270', '55550270', 'cliente270@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan271', 'Perez271', '1000000000271', '55550271', 'cliente271@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan272', 'Perez272', '1000000000272', '55550272', 'cliente272@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan273', 'Perez273', '1000000000273', '55550273', 'cliente273@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan274', 'Perez274', '1000000000274', '55550274', 'cliente274@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan275', 'Perez275', '1000000000275', '55550275', 'cliente275@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan276', 'Perez276', '1000000000276', '55550276', 'cliente276@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan277', 'Perez277', '1000000000277', '55550277', 'cliente277@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan278', 'Perez278', '1000000000278', '55550278', 'cliente278@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan279', 'Perez279', '1000000000279', '55550279', 'cliente279@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan280', 'Perez280', '1000000000280', '55550280', 'cliente280@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan281', 'Perez281', '1000000000281', '55550281', 'cliente281@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan282', 'Perez282', '1000000000282', '55550282', 'cliente282@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan283', 'Perez283', '1000000000283', '55550283', 'cliente283@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan284', 'Perez284', '1000000000284', '55550284', 'cliente284@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan285', 'Perez285', '1000000000285', '55550285', 'cliente285@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan286', 'Perez286', '1000000000286', '55550286', 'cliente286@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan287', 'Perez287', '1000000000287', '55550287', 'cliente287@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan288', 'Perez288', '1000000000288', '55550288', 'cliente288@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan289', 'Perez289', '1000000000289', '55550289', 'cliente289@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan290', 'Perez290', '1000000000290', '55550290', 'cliente290@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan291', 'Perez291', '1000000000291', '55550291', 'cliente291@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan292', 'Perez292', '1000000000292', '55550292', 'cliente292@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan293', 'Perez293', '1000000000293', '55550293', 'cliente293@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan294', 'Perez294', '1000000000294', '55550294', 'cliente294@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan295', 'Perez295', '1000000000295', '55550295', 'cliente295@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan296', 'Perez296', '1000000000296', '55550296', 'cliente296@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan297', 'Perez297', '1000000000297', '55550297', 'cliente297@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan298', 'Perez298', '1000000000298', '55550298', 'cliente298@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan299', 'Perez299', '1000000000299', '55550299', 'cliente299@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan300', 'Perez300', '1000000000300', '55550300', 'cliente300@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan301', 'Perez301', '1000000000301', '55550301', 'cliente301@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan302', 'Perez302', '1000000000302', '55550302', 'cliente302@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan303', 'Perez303', '1000000000303', '55550303', 'cliente303@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan304', 'Perez304', '1000000000304', '55550304', 'cliente304@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan305', 'Perez305', '1000000000305', '55550305', 'cliente305@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan306', 'Perez306', '1000000000306', '55550306', 'cliente306@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan307', 'Perez307', '1000000000307', '55550307', 'cliente307@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan308', 'Perez308', '1000000000308', '55550308', 'cliente308@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan309', 'Perez309', '1000000000309', '55550309', 'cliente309@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan310', 'Perez310', '1000000000310', '55550310', 'cliente310@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan311', 'Perez311', '1000000000311', '55550311', 'cliente311@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan312', 'Perez312', '1000000000312', '55550312', 'cliente312@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan313', 'Perez313', '1000000000313', '55550313', 'cliente313@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan314', 'Perez314', '1000000000314', '55550314', 'cliente314@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan315', 'Perez315', '1000000000315', '55550315', 'cliente315@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan316', 'Perez316', '1000000000316', '55550316', 'cliente316@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan317', 'Perez317', '1000000000317', '55550317', 'cliente317@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan318', 'Perez318', '1000000000318', '55550318', 'cliente318@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan319', 'Perez319', '1000000000319', '55550319', 'cliente319@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan320', 'Perez320', '1000000000320', '55550320', 'cliente320@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan321', 'Perez321', '1000000000321', '55550321', 'cliente321@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan322', 'Perez322', '1000000000322', '55550322', 'cliente322@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan323', 'Perez323', '1000000000323', '55550323', 'cliente323@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan324', 'Perez324', '1000000000324', '55550324', 'cliente324@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan325', 'Perez325', '1000000000325', '55550325', 'cliente325@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan326', 'Perez326', '1000000000326', '55550326', 'cliente326@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan327', 'Perez327', '1000000000327', '55550327', 'cliente327@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan328', 'Perez328', '1000000000328', '55550328', 'cliente328@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan329', 'Perez329', '1000000000329', '55550329', 'cliente329@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan330', 'Perez330', '1000000000330', '55550330', 'cliente330@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan331', 'Perez331', '1000000000331', '55550331', 'cliente331@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan332', 'Perez332', '1000000000332', '55550332', 'cliente332@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan333', 'Perez333', '1000000000333', '55550333', 'cliente333@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan334', 'Perez334', '1000000000334', '55550334', 'cliente334@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan335', 'Perez335', '1000000000335', '55550335', 'cliente335@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan336', 'Perez336', '1000000000336', '55550336', 'cliente336@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan337', 'Perez337', '1000000000337', '55550337', 'cliente337@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan338', 'Perez338', '1000000000338', '55550338', 'cliente338@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan339', 'Perez339', '1000000000339', '55550339', 'cliente339@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan340', 'Perez340', '1000000000340', '55550340', 'cliente340@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan341', 'Perez341', '1000000000341', '55550341', 'cliente341@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan342', 'Perez342', '1000000000342', '55550342', 'cliente342@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan343', 'Perez343', '1000000000343', '55550343', 'cliente343@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan344', 'Perez344', '1000000000344', '55550344', 'cliente344@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan345', 'Perez345', '1000000000345', '55550345', 'cliente345@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan346', 'Perez346', '1000000000346', '55550346', 'cliente346@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan347', 'Perez347', '1000000000347', '55550347', 'cliente347@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan348', 'Perez348', '1000000000348', '55550348', 'cliente348@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan349', 'Perez349', '1000000000349', '55550349', 'cliente349@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan350', 'Perez350', '1000000000350', '55550350', 'cliente350@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan351', 'Perez351', '1000000000351', '55550351', 'cliente351@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan352', 'Perez352', '1000000000352', '55550352', 'cliente352@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan353', 'Perez353', '1000000000353', '55550353', 'cliente353@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan354', 'Perez354', '1000000000354', '55550354', 'cliente354@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan355', 'Perez355', '1000000000355', '55550355', 'cliente355@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan356', 'Perez356', '1000000000356', '55550356', 'cliente356@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan357', 'Perez357', '1000000000357', '55550357', 'cliente357@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan358', 'Perez358', '1000000000358', '55550358', 'cliente358@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan359', 'Perez359', '1000000000359', '55550359', 'cliente359@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan360', 'Perez360', '1000000000360', '55550360', 'cliente360@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan361', 'Perez361', '1000000000361', '55550361', 'cliente361@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan362', 'Perez362', '1000000000362', '55550362', 'cliente362@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan363', 'Perez363', '1000000000363', '55550363', 'cliente363@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan364', 'Perez364', '1000000000364', '55550364', 'cliente364@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan365', 'Perez365', '1000000000365', '55550365', 'cliente365@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan366', 'Perez366', '1000000000366', '55550366', 'cliente366@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan367', 'Perez367', '1000000000367', '55550367', 'cliente367@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan368', 'Perez368', '1000000000368', '55550368', 'cliente368@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan369', 'Perez369', '1000000000369', '55550369', 'cliente369@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan370', 'Perez370', '1000000000370', '55550370', 'cliente370@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan371', 'Perez371', '1000000000371', '55550371', 'cliente371@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan372', 'Perez372', '1000000000372', '55550372', 'cliente372@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan373', 'Perez373', '1000000000373', '55550373', 'cliente373@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan374', 'Perez374', '1000000000374', '55550374', 'cliente374@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan375', 'Perez375', '1000000000375', '55550375', 'cliente375@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan376', 'Perez376', '1000000000376', '55550376', 'cliente376@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan377', 'Perez377', '1000000000377', '55550377', 'cliente377@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan378', 'Perez378', '1000000000378', '55550378', 'cliente378@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan379', 'Perez379', '1000000000379', '55550379', 'cliente379@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan380', 'Perez380', '1000000000380', '55550380', 'cliente380@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan381', 'Perez381', '1000000000381', '55550381', 'cliente381@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan382', 'Perez382', '1000000000382', '55550382', 'cliente382@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan383', 'Perez383', '1000000000383', '55550383', 'cliente383@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan384', 'Perez384', '1000000000384', '55550384', 'cliente384@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan385', 'Perez385', '1000000000385', '55550385', 'cliente385@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan386', 'Perez386', '1000000000386', '55550386', 'cliente386@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan387', 'Perez387', '1000000000387', '55550387', 'cliente387@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan388', 'Perez388', '1000000000388', '55550388', 'cliente388@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan389', 'Perez389', '1000000000389', '55550389', 'cliente389@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan390', 'Perez390', '1000000000390', '55550390', 'cliente390@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan391', 'Perez391', '1000000000391', '55550391', 'cliente391@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan392', 'Perez392', '1000000000392', '55550392', 'cliente392@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan393', 'Perez393', '1000000000393', '55550393', 'cliente393@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan394', 'Perez394', '1000000000394', '55550394', 'cliente394@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan395', 'Perez395', '1000000000395', '55550395', 'cliente395@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan396', 'Perez396', '1000000000396', '55550396', 'cliente396@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan397', 'Perez397', '1000000000397', '55550397', 'cliente397@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan398', 'Perez398', '1000000000398', '55550398', 'cliente398@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan399', 'Perez399', '1000000000399', '55550399', 'cliente399@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan400', 'Perez400', '1000000000400', '55550400', 'cliente400@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan401', 'Perez401', '1000000000401', '55550401', 'cliente401@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan402', 'Perez402', '1000000000402', '55550402', 'cliente402@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan403', 'Perez403', '1000000000403', '55550403', 'cliente403@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan404', 'Perez404', '1000000000404', '55550404', 'cliente404@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan405', 'Perez405', '1000000000405', '55550405', 'cliente405@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan406', 'Perez406', '1000000000406', '55550406', 'cliente406@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan407', 'Perez407', '1000000000407', '55550407', 'cliente407@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan408', 'Perez408', '1000000000408', '55550408', 'cliente408@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan409', 'Perez409', '1000000000409', '55550409', 'cliente409@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan410', 'Perez410', '1000000000410', '55550410', 'cliente410@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan411', 'Perez411', '1000000000411', '55550411', 'cliente411@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan412', 'Perez412', '1000000000412', '55550412', 'cliente412@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan413', 'Perez413', '1000000000413', '55550413', 'cliente413@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan414', 'Perez414', '1000000000414', '55550414', 'cliente414@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan415', 'Perez415', '1000000000415', '55550415', 'cliente415@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan416', 'Perez416', '1000000000416', '55550416', 'cliente416@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan417', 'Perez417', '1000000000417', '55550417', 'cliente417@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan418', 'Perez418', '1000000000418', '55550418', 'cliente418@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan419', 'Perez419', '1000000000419', '55550419', 'cliente419@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan420', 'Perez420', '1000000000420', '55550420', 'cliente420@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan421', 'Perez421', '1000000000421', '55550421', 'cliente421@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan422', 'Perez422', '1000000000422', '55550422', 'cliente422@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan423', 'Perez423', '1000000000423', '55550423', 'cliente423@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan424', 'Perez424', '1000000000424', '55550424', 'cliente424@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan425', 'Perez425', '1000000000425', '55550425', 'cliente425@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan426', 'Perez426', '1000000000426', '55550426', 'cliente426@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan427', 'Perez427', '1000000000427', '55550427', 'cliente427@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan428', 'Perez428', '1000000000428', '55550428', 'cliente428@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan429', 'Perez429', '1000000000429', '55550429', 'cliente429@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan430', 'Perez430', '1000000000430', '55550430', 'cliente430@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan431', 'Perez431', '1000000000431', '55550431', 'cliente431@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan432', 'Perez432', '1000000000432', '55550432', 'cliente432@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan433', 'Perez433', '1000000000433', '55550433', 'cliente433@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan434', 'Perez434', '1000000000434', '55550434', 'cliente434@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan435', 'Perez435', '1000000000435', '55550435', 'cliente435@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan436', 'Perez436', '1000000000436', '55550436', 'cliente436@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan437', 'Perez437', '1000000000437', '55550437', 'cliente437@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan438', 'Perez438', '1000000000438', '55550438', 'cliente438@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan439', 'Perez439', '1000000000439', '55550439', 'cliente439@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan440', 'Perez440', '1000000000440', '55550440', 'cliente440@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan441', 'Perez441', '1000000000441', '55550441', 'cliente441@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan442', 'Perez442', '1000000000442', '55550442', 'cliente442@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan443', 'Perez443', '1000000000443', '55550443', 'cliente443@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan444', 'Perez444', '1000000000444', '55550444', 'cliente444@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan445', 'Perez445', '1000000000445', '55550445', 'cliente445@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan446', 'Perez446', '1000000000446', '55550446', 'cliente446@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan447', 'Perez447', '1000000000447', '55550447', 'cliente447@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan448', 'Perez448', '1000000000448', '55550448', 'cliente448@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan449', 'Perez449', '1000000000449', '55550449', 'cliente449@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan450', 'Perez450', '1000000000450', '55550450', 'cliente450@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan451', 'Perez451', '1000000000451', '55550451', 'cliente451@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan452', 'Perez452', '1000000000452', '55550452', 'cliente452@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan453', 'Perez453', '1000000000453', '55550453', 'cliente453@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan454', 'Perez454', '1000000000454', '55550454', 'cliente454@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan455', 'Perez455', '1000000000455', '55550455', 'cliente455@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan456', 'Perez456', '1000000000456', '55550456', 'cliente456@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan457', 'Perez457', '1000000000457', '55550457', 'cliente457@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan458', 'Perez458', '1000000000458', '55550458', 'cliente458@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan459', 'Perez459', '1000000000459', '55550459', 'cliente459@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan460', 'Perez460', '1000000000460', '55550460', 'cliente460@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan461', 'Perez461', '1000000000461', '55550461', 'cliente461@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan462', 'Perez462', '1000000000462', '55550462', 'cliente462@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan463', 'Perez463', '1000000000463', '55550463', 'cliente463@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan464', 'Perez464', '1000000000464', '55550464', 'cliente464@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan465', 'Perez465', '1000000000465', '55550465', 'cliente465@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan466', 'Perez466', '1000000000466', '55550466', 'cliente466@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan467', 'Perez467', '1000000000467', '55550467', 'cliente467@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan468', 'Perez468', '1000000000468', '55550468', 'cliente468@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan469', 'Perez469', '1000000000469', '55550469', 'cliente469@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan470', 'Perez470', '1000000000470', '55550470', 'cliente470@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan471', 'Perez471', '1000000000471', '55550471', 'cliente471@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan472', 'Perez472', '1000000000472', '55550472', 'cliente472@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan473', 'Perez473', '1000000000473', '55550473', 'cliente473@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan474', 'Perez474', '1000000000474', '55550474', 'cliente474@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan475', 'Perez475', '1000000000475', '55550475', 'cliente475@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan476', 'Perez476', '1000000000476', '55550476', 'cliente476@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan477', 'Perez477', '1000000000477', '55550477', 'cliente477@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan478', 'Perez478', '1000000000478', '55550478', 'cliente478@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan479', 'Perez479', '1000000000479', '55550479', 'cliente479@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan480', 'Perez480', '1000000000480', '55550480', 'cliente480@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan481', 'Perez481', '1000000000481', '55550481', 'cliente481@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan482', 'Perez482', '1000000000482', '55550482', 'cliente482@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan483', 'Perez483', '1000000000483', '55550483', 'cliente483@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan484', 'Perez484', '1000000000484', '55550484', 'cliente484@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan485', 'Perez485', '1000000000485', '55550485', 'cliente485@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan486', 'Perez486', '1000000000486', '55550486', 'cliente486@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan487', 'Perez487', '1000000000487', '55550487', 'cliente487@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan488', 'Perez488', '1000000000488', '55550488', 'cliente488@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan489', 'Perez489', '1000000000489', '55550489', 'cliente489@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan490', 'Perez490', '1000000000490', '55550490', 'cliente490@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan491', 'Perez491', '1000000000491', '55550491', 'cliente491@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan492', 'Perez492', '1000000000492', '55550492', 'cliente492@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan493', 'Perez493', '1000000000493', '55550493', 'cliente493@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan494', 'Perez494', '1000000000494', '55550494', 'cliente494@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan495', 'Perez495', '1000000000495', '55550495', 'cliente495@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan496', 'Perez496', '1000000000496', '55550496', 'cliente496@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan497', 'Perez497', '1000000000497', '55550497', 'cliente497@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan498', 'Perez498', '1000000000498', '55550498', 'cliente498@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan499', 'Perez499', '1000000000499', '55550499', 'cliente499@correo.com');
INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo) VALUES ('Juan500', 'Perez500', '1000000000500', '55550500', 'cliente500@correo.com');



-- ============================================================
-- 9. VERIFICACIÓN DE LOS 500 CLIENTES
-- ============================================================

USE CrediiCore;

SELECT COUNT(*) AS TotalClientes
FROM Operaciones.Clientes;


-- ============================================================
-- 10. INGESTA PLANA - BULK INSERT DE CRÉDITOS
-- ============================================================

/*
Archivo utilizado:
creditos.txt

Delimitador de campos: |
Delimitador de filas: 0x0a
Ubicación dentro del contenedor Docker:
 /var/opt/mssql/creditos.txt
*/


-- ============================================================
-- 11. TABLA DE CARGA PARA LOS CRÉDITOS
-- ============================================================

CREATE TABLE Operaciones.CargaCreditos
(
    IdCliente INT NOT NULL,
    IdVehiculo INT NOT NULL,
    MontoCapital DECIMAL(18,2) NOT NULL,
    TasaInteresMensual DECIMAL(5,2) NOT NULL,
    Estado VARCHAR(20) NOT NULL,
    FechaDesembolso DATETIME NOT NULL
);

GO


-- ============================================================
-- 12. CARGA MASIVA MEDIANTE BULK INSERT
-- ============================================================

BULK INSERT Operaciones.CargaCreditos
FROM '/var/opt/mssql/creditos.txt'
WITH
(
    FIELDTERMINATOR = '|',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

GO


-- ============================================================
-- 13. PASO DE DATOS A LA TABLA REAL DE CRÉDITOS
-- ============================================================

INSERT INTO Operaciones.Creditos
(
    IdCliente,
    IdVehiculo,
    MontoCapital,
    TasaInteresMensual,
    Estado,
    FechaDesembolso
)
SELECT
    IdCliente,
    IdVehiculo,
    MontoCapital,
    TasaInteresMensual,
    Estado,
    FechaDesembolso
FROM Operaciones.CargaCreditos;

GO


-- ============================================================
-- 14. VERIFICACIÓN DE LOS 2,000 CRÉDITOS
-- ============================================================

SELECT COUNT(*) AS TotalCreditos
FROM Operaciones.Creditos;

GO


-- ============================================================
-- 15. VISUALIZACIÓN DE LOS CRÉDITOS CARGADOS
-- ============================================================

SELECT TOP 10 *
FROM Operaciones.Creditos
ORDER BY IdCredito;

GO


-- ============================================================
-- 16. VERIFICACIÓN FINAL DE LA CARGA MASIVA
-- ============================================================

USE CrediiCore;

SELECT COUNT(*) AS TotalClientes
FROM Operaciones.Clientes;

SELECT COUNT(*) AS TotalVehiculos
FROM Garantias.Vehiculos;

SELECT COUNT(*) AS TotalCreditos
FROM Operaciones.Creditos;

GO


-- ============================================================
-- 17. REPORTE 1 - RIESGO ACUMULADO
-- SUM Y AVG AGRUPADOS POR ESTADO
-- ============================================================

USE CrediiCore;

GO

SELECT
    Estado,
    SUM(MontoCapital) AS TotalCapitalPrestado,
    AVG(TasaInteresMensual) AS PromedioTasaInteres
FROM Operaciones.Creditos
GROUP BY Estado
ORDER BY Estado;

GO


-- ============================================================
-- 18. REPORTE 2 - CONCENTRACIÓN VEHICULAR
-- COUNT + GROUP BY + HAVING
-- ============================================================

USE CrediiCore;

GO

SELECT
    V.Marca,
    COUNT(C.IdCredito) AS TotalPrestamos
FROM Operaciones.Creditos C
INNER JOIN Garantias.Vehiculos V
    ON C.IdVehiculo = V.IdVehiculo
GROUP BY V.Marca
HAVING COUNT(C.IdCredito) > 50
ORDER BY TotalPrestamos DESC;

GO


-- ============================================================
-- 19. REPORTE 3 - ANÁLISIS DE EXTREMOS
-- MAX Y MIN
-- ============================================================

USE CrediiCore;

GO

SELECT
    MAX(MontoCapital) AS PrestamoMayor,
    MIN(MontoCapital) AS PrestamoMenor
FROM Operaciones.Creditos;

GO
