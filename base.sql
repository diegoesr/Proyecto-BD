Código para generar tablas
/*Tabla empleado*/
CREATE TABLE EMPLEADO (
    idEmp NUMBER(4) PRIMARY KEY,
    nombreEmp VARCHAR(10),
    apPatEmp VARCHAR(10),
    apMatEmp VARCHAR(10),
    rfc VARCHAR(13) UNIQUE,
    nss NUMBER(11) UNIQUE,
    tipoEmp VARCHAR(10) CHECK (tipoEmp IN ('Ingeniero', 'Tecnico', 'Ayudante')), 
    empSuperv NUMBER(3) REFERENCES EMPLEADO(idEmp)
);

/*Tabla para correoemp*/
CREATE TABLE CORREOEMP (
    idEmp NUMBER(4),
    correo VARCHAR(20),
    CONSTRAINT pk_correoemp PRIMARY KEY (correo),
    CONSTRAINT fk_correoemp FOREIGN KEY (idEmp) REFERENCES EMPLEADO(idEmp)
);

/*tabla para telemp*/
CREATE TABLE TELEMP (
    idEmp NUMBER(4),
    telefono NUMBER(10),
    CONSTRAINT pk_telefono PRIMARY KEY (telefono),
    CONSTRAINT fk_telefono_empleado FOREIGN KEY (idEmp) REFERENCES EMPLEADO(idEmp)
);

/*Tabla instalacion*/
CREATE TABLE INSTALACION (
    folioInsta NUMBER(4) PRIMARY KEY,
    tipoInsta VARCHAR(10),
    ubicacion VARCHAR(10),
    costoTotal NUMBER(10) CONSTRAINT check_costoTotal CHECK (costoTotal >=0),
    firmaAutorizacion VARCHAR(10)
);

/*Tabla para cliente*/
CREATE TABLE CLIENTE (
    idCliente NUMBER(4) PRIMARY KEY,
    ubicacion VARCHAR(20),
    nombreCte VARCHAR(20),
    apPatCte VARCHAR(20),
    apMatCte VARCHAR(20)
);

/*Tabla para correocte*/
CREATE TABLE CORREOCTE (
    idCliente NUMBER(4) REFERENCES CLIENTE(idCliente),
    correoCte VARCHAR(20),
    PRIMARY KEY (idCliente)
);
/*Tabla para telcte*/
CREATE TABLE TELCTE (
    idCliente NUMBER(4) REFERENCES CLIENTE(idCliente),
    telefono NUMBER(10),
    PRIMARY KEY (idCliente)
);
/*Tabla para almacen*/
CREATE TABLE ALMACEN (
    idAlmacen NUMBER(18) PRIMARY KEY,
    ubicacion VARCHAR(18)
);

/*Tabla para material*/
CREATE TABLE MATERIAL (
    codMaterial NUMBER(4) PRIMARY KEY,
    nombre VARCHAR(20),
    cantidad NUMBER(20)
);

/*Tabla para herramienta*/
CREATE TABLE HERRAMIENTA (
    numSerie NUMBER(4) PRIMARY KEY,
    nombre VARCHAR(20),
    descripcion VARCHAR(30)
);

/*Tabla para empsuperv*/
CREATE TABLE EMPSUPERV (
    idEmp NUMBER(4) REFERENCES EMPLEADO(idEmp),
    PRIMARY KEY (idEmp)
);

/*Tabla para empinsta*/
CREATE TABLE EMPINSTA (
    idEmpInsta NUMBER PRIMARY KEY,
    idEmp NUMBER REFERENCES EMPLEADO(idEmp) NOT NULL,
    folioInsta NUMBER REFERENCES INSTALACION(folioInsta) NOT NULL,
    CONSTRAINT empinsta_unique UNIQUE (idEmp, folioInsta)
);

/*Tabla para clienteinsta*/
CREATE TABLE CLIENTEINSTA (
    idCteInsta NUMBER PRIMARY KEY,
    idCliente NUMBER REFERENCES CLIENTE(idCliente) NOT NULL,
    folioInsta NUMBER REFERENCES INSTALACION(folioInsta) NOT NULL,
    fechaInstala DATE,
    CONSTRAINT clienteinsta_unique UNIQUE (idCliente, folioInsta)
);


/*Tabla para instaalmacen*/
CREATE TABLE InstaAlmacen (
    idInstaAlmacen NUMBER PRIMARY KEY,
    idAlmacen NUMBER REFERENCES ALMACEN(idAlmacen) NOT NULL,
    folioInsta NUMBER REFERENCES INSTALACION(folioInsta) NOT NULL,
    CONSTRAINT instaalmacen_unique UNIQUE (idAlmacen, folioInsta)
);

/*Tabla para mateherra*/
CREATE TABLE MateHerra (
    idMateHerra NUMBER PRIMARY KEY,
    idMaterial NUMBER REFERENCES MATERIAL(codMaterial) NOT NULL,
    numSerie NUMBER REFERENCES HERRAMIENTA(numSerie) NOT NULL,
    CONSTRAINT mateherra_unique UNIQUE (idMaterial, numSerie)
);



/*Tabla para almacenmateherra*/
CREATE TABLE ALMACENMATEHERRA (
    idAlmaHerra NUMBER PRIMARY KEY,
    idMateHerra NUMBER REFERENCES MateHerra(idMateHerra) NOT NULL,
    idAlmacen NUMBER REFERENCES ALMACEN(idAlmacen) NOT NULL,
    registroEnt VARCHAR(20),
    registroSal VARCHAR(10),
    prestamo NUMBER(3),
    CONSTRAINT almacenmateherra_unique UNIQUE (idMateHerra, idAlmacen)
);

CREATE TABLE BITACORAGARANTIA (
    folioInsta NUMBER(3) PRIMARY KEY,
    fechaInstalacion DATE,
    fechaVencimientoGarantia DATE
);


Inserción de datos 
— — Inserción de empleados
INSERT INTO EMPLEADO VALUES (0001, 'Juan', 'Perez', 'Gomez', 'ABC123456DEF', 12345678901, 'Ingeniero', 1);
INSERT INTO EMPLEADO VALUES (0002, 'Maria', 'Garcia', 'Lopez', 'XYZ987654ABC', 98765432102, 'Tecnico', 1);
INSERT INTO EMPLEADO VALUES (0003, 'Carlos', 'Rodriguez', 'Martinez', 'DEF123456ABC', 23456789012, 'Ayudante', 1);
INSERT INTO EMPLEADO VALUES (0004, 'Ana', 'Lopez', 'Santos', 'GHI987654JKL', 34567890123, 'Ingeniero', 2);
INSERT INTO EMPLEADO VALUES (0005, 'Pedro', 'Gomez', 'Fernandez', 'JKL123456MNO', 45678901234, 'Tecnico', 2);
INSERT INTO EMPLEADO VALUES (0006, 'Laura', 'Fernandez', 'Gutierrez', 'MNO987654PQR', 56789012345, 'Ayudante', 3);
INSERT INTO EMPLEADO VALUES (0007, 'Sergio', 'Martinez', 'Perez', 'PQR123456STU', 67890123456, 'Ingeniero', 3);
INSERT INTO EMPLEADO VALUES (0008, 'Isabel', 'Santos', 'Ramirez', 'STU987654VWX', 78901234567, 'Tecnico', 4);
INSERT INTO EMPLEADO VALUES (0009, 'Luis', 'Gutierrez', 'Hernandez', 'VWX123456YZA', 89012345678, 'Ayudante', 4);
INSERT INTO EMPLEADO VALUES (0010, 'Elena', 'Ramirez', 'Fernandez', 'YZA987654BCD', 90123456789, 'Ingeniero', 5);


— — Inserción correo empleado
INSERT INTO CORREOEMP VALUES (0001, 'juan.perez@email.com');
INSERT INTO CORREOEMP VALUES (0002, 'maria.gar@email.com');
INSERT INTO CORREOEMP VALUES (0003, 'carlos.rdz@email.com');
INSERT INTO CORREOEMP VALUES (0004, 'ana.lopez@email.com');
INSERT INTO CORREOEMP VALUES (0005, 'pedro.gz@email.com');
INSERT INTO CORREOEMP VALUES (0006, 'laura.fdz@email.com');
INSERT INTO CORREOEMP VALUES (0007, 'sergio.mtz@email.com');
INSERT INTO CORREOEMP VALUES (0008, 'isabel.ram@email.com');
INSERT INTO CORREOEMP VALUES (0009, 'luis.gtz@email.com');
INSERT INTO CORREOEMP VALUES (0010, 'elena.ramz@email.com');


-- Insertar filas en la tabla TELEMP
INSERT INTO TELEMP VALUES (0001, 1234567890);
INSERT INTO TELEMP VALUES (0002, 9876543210);
INSERT INTO TELEMP VALUES (0003, 2345678901);
INSERT INTO TELEMP VALUES (0004, 3456789012);
INSERT INTO TELEMP VALUES (0005, 4567890123);
INSERT INTO TELEMP VALUES (0006, 5678901234);
INSERT INTO TELEMP VALUES (0007, 6789012345);
INSERT INTO TELEMP VALUES (0008, 7890123456);
INSERT INTO TELEMP VALUES (0009, 8901234567);
INSERT INTO TELEMP VALUES (0010, 9012345678);




-- Insertar filas en la tabla INSTALACION para Campana Extractora
INSERT INTO INSTALACION VALUES (0001, 'Campana', 'Cocina1', 1500, 'Autorizado');
INSERT INTO INSTALACION VALUES (0002, 'Campana', 'Cocina2', 1800, 'Autorizado');
INSERT INTO INSTALACION VALUES (0003, 'Campana', 'Cocina3', 2000, 'Autorizado');
INSERT INTO INSTALACION VALUES (0004, 'Campana', 'Cocina4', 1600, 'Autorizado');
INSERT INTO INSTALACION VALUES (0005, 'Campana', 'Cocina5', 2200, 'Autorizado');
INSERT INTO INSTALACION VALUES (0006, 'Campana', 'Cocina6', 2500, 'Autorizado');
INSERT INTO INSTALACION VALUES (0007, 'Campana', 'Cocina7', 1700, 'Autorizado');
INSERT INTO INSTALACION VALUES (0008, 'Campana', 'Cocina8', 1900, 'Autorizado');
INSERT INTO INSTALACION VALUES (0009, 'Campana', 'Cocina9', 2100, 'Autorizado');
INSERT INTO INSTALACION VALUES (0010, 'Campana', 'Cocina10', 2000, 'Autorizado');


-- Insertar filas en la tabla CLIENTE
INSERT INTO CLIENTE VALUES (0031, 'Ubicacion1', 'Rosa', 'Martinez', 'Gomez');
INSERT INTO CLIENTE VALUES (0032, 'Ubicacion2', 'Javier', 'Lopez', 'Hernandez');
INSERT INTO CLIENTE VALUES (0033, 'Ubicacion3', 'Silvia', 'Rodriguez', 'Ramirez');
INSERT INTO CLIENTE VALUES (0034, 'Ubicacion4', 'Roberto', 'Gomez', 'Fernandez');
INSERT INTO CLIENTE VALUES (0035, 'Ubicacion5', 'Carmen', 'Fernandez', 'Santos');
INSERT INTO CLIENTE VALUES (0036, 'Ubicacion6', 'Alejandro', 'Perez', 'Lopez');
INSERT INTO CLIENTE VALUES (0037, 'Ubicacion7', 'Beatriz', 'Gutierrez', 'Santos');
INSERT INTO CLIENTE VALUES (0038, 'Ubicacion8', 'Fernando', 'Ramirez', 'Hernandez');
INSERT INTO CLIENTE VALUES (0039, 'Ubicacion9', 'Paola', 'Hernandez', 'Martinez');
INSERT INTO CLIENTE VALUES (0040, 'Ubicacion10', 'Hector', 'Lopez', 'Fernandez');


-- Insertar filas en la tabla CORREOCTE
INSERT INTO CORREOCTE VALUES (0031, 'rosa.mtz@email.com');
INSERT INTO CORREOCTE VALUES (0032, 'javier.lpz@email.com');
INSERT INTO CORREOCTE VALUES (0033, 'silvia.rdz@email.com');
INSERT INTO CORREOCTE VALUES (0034, 'robert.gmz@email.com');
INSERT INTO CORREOCTE VALUES (0035, 'carmen.fdz@email.com');
INSERT INTO CORREOCTE VALUES (0036, 'ale.perez@email.com');
INSERT INTO CORREOCTE VALUES (0037, 'beatriz.gz@email.com');
INSERT INTO CORREOCTE VALUES (0038, 'fer.ramz@email.com');
INSERT INTO CORREOCTE VALUES (0039, 'paola.hdz@email.com');
INSERT INTO CORREOCTE VALUES (0040, 'hector.lpz@email.com');


-- Insertar filas adicionales en la tabla TELCTE
INSERT INTO TELCTE VALUES (0031, 1112223333);
INSERT INTO TELCTE VALUES (0032, 4445556666);
INSERT INTO TELCTE VALUES (0033, 7778889999);
INSERT INTO TELCTE VALUES (0034, 2223334444);
INSERT INTO TELCTE VALUES (0035, 5556667777);
INSERT INTO TELCTE VALUES (0036, 8889990000);
INSERT INTO TELCTE VALUES (0037, 3334445555);
INSERT INTO TELCTE VALUES (0038, 6667778888);
INSERT INTO TELCTE VALUES (0039, 9990001111);
INSERT INTO TELCTE VALUES (0040, 1231231234);


-- Insertar filas en la tabla ALMACEN
INSERT INTO ALMACEN VALUES (0061, 'UbicacionA');
INSERT INTO ALMACEN VALUES (0062, 'UbicacionB');
INSERT INTO ALMACEN VALUES (0063, 'UbicacionC');
INSERT INTO ALMACEN VALUES (0064, 'UbicacionD');
INSERT INTO ALMACEN VALUES (0065, 'UbicacionE');
INSERT INTO ALMACEN VALUES (0066, 'UbicacionF');
INSERT INTO ALMACEN VALUES (0067, 'UbicacionG');
INSERT INTO ALMACEN VALUES (0068, 'UbicacionH');
INSERT INTO ALMACEN VALUES (0069, 'UbicacionI');
INSERT INTO ALMACEN VALUES (0070, 'UbicacionJ');

-- Insertar filas en la tabla MATERIAL
INSERT INTO MATERIAL VALUES (0101, 'MaterialA', 50);
INSERT INTO MATERIAL VALUES (0102, 'MaterialB', 75);
INSERT INTO MATERIAL VALUES (0103, 'MaterialC', 100);
INSERT INTO MATERIAL VALUES (0104, 'MaterialD', 25);
INSERT INTO MATERIAL VALUES (0105, 'MaterialE', 60);
INSERT INTO MATERIAL VALUES (0106, 'MaterialF', 90);
INSERT INTO MATERIAL VALUES (0107, 'MaterialG', 120);
INSERT INTO MATERIAL VALUES (0108, 'MaterialH', 40);
INSERT INTO MATERIAL VALUES (0109, 'MaterialI', 80);
INSERT INTO MATERIAL VALUES (0110, 'MaterialJ', 130);

-- Insertar filas en la tabla HERRAMIENTA
INSERT INTO HERRAMIENTA VALUES (201, 'Martillo', 'Herramienta de golpeo');
INSERT INTO HERRAMIENTA VALUES (202, 'Destornillador', 'Herramienta para tornillos');
INSERT INTO HERRAMIENTA VALUES (203, 'Sierra', 'Herramienta de corte');
INSERT INTO HERRAMIENTA VALUES (204, 'Llave Inglesa', 'Herramienta para tuercas');
INSERT INTO HERRAMIENTA VALUES (205, 'Taladro', 'Herramienta para perforar');
INSERT INTO HERRAMIENTA VALUES (206, 'Pinzas', 'Herramienta de agarre');
INSERT INTO HERRAMIENTA VALUES (207, 'Nivel', 'Herramienta de medicion');
INSERT INTO HERRAMIENTA VALUES (208, 'Cinta Métrica', 'Herramienta para tomar medidas’);
INSERT INTO HERRAMIENTA VALUES (209, 'Cincel', 'Herramienta para desbastar');
INSERT INTO HERRAMIENTA VALUES (210, 'Lijadora', 'Herramienta para lijar’);

-- Insertar filas en la tabla EMPSUPERV
INSERT INTO EMPSUPERV VALUES (0001);
INSERT INTO EMPSUPERV VALUES (0002);
INSERT INTO EMPSUPERV VALUES (0003);
INSERT INTO EMPSUPERV VALUES (0004);
INSERT INTO EMPSUPERV VALUES (0005);
INSERT INTO EMPSUPERV VALUES (0006);
INSERT INTO EMPSUPERV VALUES (0007);
INSERT INTO EMPSUPERV VALUES (0008);
INSERT INTO EMPSUPERV VALUES (0009);
INSERT INTO EMPSUPERV VALUES (0010);

-- Insertar filas en la tabla EMPINSTA
INSERT INTO EMPINSTA VALUES (0081, 0001, 0001);
INSERT INTO EMPINSTA VALUES (0082, 0002, 0002);
INSERT INTO EMPINSTA VALUES (0083, 0003, 0003);
INSERT INTO EMPINSTA VALUES (0084, 0004, 0004);
INSERT INTO EMPINSTA VALUES (0085, 0005, 0005);
INSERT INTO EMPINSTA VALUES (0086, 0006, 0006);
INSERT INTO EMPINSTA VALUES (0087, 0007, 0007);
INSERT INTO EMPINSTA VALUES (0088, 0008, 0008);
INSERT INTO EMPINSTA VALUES (0089, 0009, 0009);
INSERT INTO EMPINSTA VALUES (0090, 0010, 0010);

-- Insertar filas en la tabla CLIENTEINSTA
INSERT INTO CLIENTEINSTA VALUES (0091, 0031, 0001, TO_DATE('2023-01-01', 'YYYY-MM-DD'));
INSERT INTO CLIENTEINSTA VALUES (0092, 0032, 0002, TO_DATE('2023-02-15', 'YYYY-MM-DD'));
INSERT INTO CLIENTEINSTA VALUES (0093, 0033, 0003, TO_DATE('2023-03-10', 'YYYY-MM-DD'));
INSERT INTO CLIENTEINSTA VALUES (0094, 0034, 0004, TO_DATE('2023-04-22', 'YYYY-MM-DD'));
INSERT INTO CLIENTEINSTA VALUES (0095, 0035, 0005, TO_DATE('2023-05-05', 'YYYY-MM-DD'));
INSERT INTO CLIENTEINSTA VALUES (0096, 0036, 0006, TO_DATE('2023-06-18', 'YYYY-MM-DD'));
INSERT INTO CLIENTEINSTA VALUES (0097, 0037, 0007, TO_DATE('2023-07-09', 'YYYY-MM-DD'));
INSERT INTO CLIENTEINSTA VALUES (0098, 0038, 0008, TO_DATE('2023-08-30', 'YYYY-MM-DD'));
INSERT INTO CLIENTEINSTA VALUES (0099, 0039, 0009, TO_DATE('2023-09-14', 'YYYY-MM-DD'));
INSERT INTO CLIENTEINSTA VALUES (0100, 0040, 0010, TO_DATE('2023-10-03', 'YYYY-MM-DD'));

-- Insertar filas en la tabla INSTAALMACEN
INSERT INTO InstaAlmacen VALUES (0301, 0061, 0001);
INSERT INTO InstaAlmacen VALUES (0302, 0062, 0002);
INSERT INTO InstaAlmacen VALUES (0303, 0063, 0003);
INSERT INTO InstaAlmacen VALUES (0304, 0064, 0004);
INSERT INTO InstaAlmacen VALUES (0305, 0065, 0005);
INSERT INTO InstaAlmacen VALUES (0306, 0066, 0006);
INSERT INTO InstaAlmacen VALUES (0307, 0067, 0007);
INSERT INTO InstaAlmacen VALUES (0308, 0068, 0008);
INSERT INTO InstaAlmacen VALUES (0309, 0069, 0009);
INSERT INTO InstaAlmacen VALUES (0400, 0070, 0010);

-- Insertar filas en la tabla MATEHERRA
INSERT INTO MateHerra VALUES (0401, 0101, 201);
INSERT INTO MateHerra VALUES (0402, 0102, 202);
INSERT INTO MateHerra VALUES (0403, 0103, 203);
INSERT INTO MateHerra VALUES (0404, 0104, 204);
INSERT INTO MateHerra VALUES (0405, 0105, 205);
INSERT INTO MateHerra VALUES (0406, 0106, 206);
INSERT INTO MateHerra VALUES (0407, 0107, 207);
INSERT INTO MateHerra VALUES (0408, 0108, 208);
INSERT INTO MateHerra VALUES (0409, 0109, 209);
INSERT INTO MateHerra VALUES (0500, 0110, 210);


-- Insertar filas en la tabla ALMACENMATEHERRA
INSERT INTO ALMACENMATEHERRA VALUES (0501, 0401, 0061, '2023-01-01', NULL, NULL);
INSERT INTO ALMACENMATEHERRA VALUES (0502, 0402, 0062, '2023-02-15', NULL, NULL);
INSERT INTO ALMACENMATEHERRA VALUES (0503, 0403, 0063, '2023-03-10', NULL, NULL);
INSERT INTO ALMACENMATEHERRA VALUES (0504, 0404, 0064, '2023-04-22', NULL, NULL);
INSERT INTO ALMACENMATEHERRA VALUES (0506, 0406, 0066, '2023-06-18', NULL, NULL);
INSERT INTO ALMACENMATEHERRA VALUES (0507, 0407, 0067, '2023-07-09', NULL, NULL);
INSERT INTO ALMACENMATEHERRA VALUES (0508, 0408, 0068, '2023-08-30', NULL, NULL);
INSERT INTO ALMACENMATEHERRA VALUES (0509, 0409, 0069, '2023-09-14', NULL, NULL);
INSERT INTO ALMACENMATEHERRA VALUES (0600, 0500, 0070, '2023-10-03', NULL, NULL);

-----------------Algebra relacional----------------------------------------
/*Consulta empleados que son ingenieros*/

SELECT *
FROM EMPLEADO
WHERE tipoEmp = 'Ingeniero';

/*Consulta que nos da el nombre del cliente y la fecha en la que se realizo la instalacion*/

SELECT C.nombreCte, CI.fechaInstala
FROM CLIENTE C
JOIN CLIENTEINSTA CI ON C.idCliente = CI.idCliente
JOIN INSTALACION I ON CI.folioInsta = I.folioInsta;

/*Consulta que lista los tipo de empleados que son y cuantos supervisores supervisan*/

SELECT E.nombreEmp, E.tipoEmp, E.empSuperv
FROM EMPLEADO E;


/*Consulta que muestra los precios de la instalación el nombre del empleado que la realizó y el nombre del cliente que la autorizo*/

SELECT I.folioInsta, I.costoTotal, E.nombreEmp AS Empleado, C.nombreCte AS ClienteAutorizador
FROM INSTALACION I
JOIN CLIENTEINSTA CI ON I.folioInsta = CI.folioInsta
JOIN CLIENTE C ON CI.idCliente = C.idCliente
JOIN EMPLEADO E ON I.folioInsta = E.idEmp;

/*Nos da los datos de todos los clientes junto con la informacion de las instalaciones que se les realizo*/

SELECT C.idCliente, C.nombreCte, I.folioInsta, I.tipoInsta, I.ubicacion, I.costoTotal, I.firmaAutorizacion
FROM CLIENTE C
JOIN CLIENTEINSTA CI ON C.idCliente = CI.idCliente
JOIN INSTALACION I ON CI.folioInsta = I.folioInsta;




-------------------2 JOIN----------------------------------------------------
INNER JOIN
/*Consulta con INNER JOIN entre 'EMPLEADO' Y 'CORREOEMP'
Esta consulta mostrara solo los empleados que tienen una direccion de correo electronico*/

SELECT E.idEmp, E.nombreEmp, CE.correo
FROM EMPLEADO E
INNER JOIN CORREOEMP CE ON E.idEmp = CE.idEmp;

LEFT JOIN
/* Consulta que muestra todos los clientes, incluso aquellos que no tienen una dirección de correo electrónico asociada*/

SELECT C.idCliente, C.nombreCte, CO.correoCte
FROM CLIENTE C
LEFT JOIN CORREOCTE CO ON C.idCliente = CO.idCliente;




---------------Consultas de agregacion------------------------------------
/*Consulta que utiliza las tablas INSTALACION y CLIENTEINSTA para 
calcular el costo promedio de instalación por tipo de instalación.*/

SELECT
    i.tipoInsta,
    AVG(i.costoTotal) AS costoPromedioInstalacion
FROM
    INSTALACION i
LEFT JOIN
    CLIENTEINSTA ci ON i.folioInsta = ci.folioInsta
GROUP BY
    i.tipoInsta;


/*Consulta que calcula el costo total promedio  de las instalaciones que se han realizado en dónde las instalaron y el tipo de instalación que se realizó*/

SELECT
    tipoInsta,
    ubicacion,
    AVG(costoTotal) AS costoPromedio
FROM
    INSTALACION
GROUP BY
    tipoInsta, ubicacion;



-------------------Vistas----------------------------------------------------
/*Vista que muestra información detallada sobre los empleados, incluyendo su información de contacto*/

CREATE VIEW VistaEMPLEADO AS
SELECT 
    E.idEmp,
    E.nombreEmp,
    E.apPatEmp,
    E.apMatEmp,
    E.rfc,
    E.nss,
    E.tipoEmp,
    E.empSuperv,
    CE.correo AS correoEmp,
    TE.telefono AS telefonoEmp
FROM EMPLEADO E
LEFT JOIN CORREOEMP CE ON E.idEmp = CE.idEmp
LEFT JOIN TELEMP TE ON E.idEmp = TE.idEmp;

/*Vista que muestra información sobre las instalaciones, incluyendo los detalles del cliente y del empleado asociado*/

CREATE VIEW VistaINSTALACION AS
SELECT 
    I.folioInsta,
    I.tipoInsta,
    I.ubicacion AS ubicacionInsta,
    I.costoTotal,
    I.firmaAutorizacion,
    CI.fechaInstala,
    C.idCliente,
    C.ubicacion AS ubicacionCte,
    C.nombreCte,
    C.apPatCte,
    C.apMatCte,
    EI.idEmp AS idEmpSupervisor
FROM INSTALACION I
JOIN CLIENTEINSTA CI ON I.folioInsta = CI.folioInsta
JOIN CLIENTE C ON CI.idCliente = C.idCliente
LEFT JOIN EMPINSTA EI ON I.folioInsta = EI.folioInsta;





------------------Procedimientos almacenados-----------------------

/*Es un procedimiento almacenado para dar de alta a un nuevo empleado:*/
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE AltaNuevoEmpleado(
    vidEmp EMPLEADO.idEmp%TYPE,
    vnombreEmp EMPLEADO.nombreEmp%TYPE,
    vapPatEmp EMPLEADO.apPatEmp%TYPE,
    vapMatEmp EMPLEADO.apMatEmp%TYPE,
    vrfc EMPLEADO.rfc%TYPE,
    vnss EMPLEADO.nss%TYPE,
    vtipoEmp EMPLEADO.tipoEmp%TYPE,
    vempSuperv EMPLEADO.empSuperv%TYPE
)
AS
    vEmpId EMPLEADO.idEmp%TYPE;

BEGIN
    -- Verificar si el empleado ya existe
    SELECT idEmp INTO vEmpId FROM EMPLEADO
    WHERE idEmp = vidEmp;

    IF (SQL%FOUND) THEN
        dbms_output.put_line('El empleado ya existe');
    END IF;

    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('Empleado no encontrado: ' || vnombreEmp);
        INSERT INTO EMPLEADO (idEmp, nombreEmp, apPatEmp, apMatEmp, rfc, nss, tipoEmp, empSuperv)
        VALUES (vidEmp, vnombreEmp, vapPatEmp, vapMatEmp, vrfc, vnss, vtipoEmp, vempSuperv);
        COMMIT;
        dbms_output.put_line('Datos del empleado insertado: ' || vnombreEmp);
END;
/

EXEC AltaNuevoEmpleado(0801, 'Nayeli', 'Alvarez', 'Robledo', 'RFC127466789', 12345888901, 'Ingeniero', NULL);


/*Es un procedimiento almacenado para almacenar nuevo material que llega recientemente y se necesita registrar en la tabla de los materiales*/

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE AlmacenarNuevoMaterial(
    vcodMaterial MATERIAL.codMaterial%TYPE,
    vnombre MATERIAL.nombre%TYPE,
    vcantidad MATERIAL.cantidad%TYPE
)
AS
    vMaterialId MATERIAL.codMaterial%TYPE;

BEGIN
    -- Verificar si el material ya existe
    SELECT codMaterial INTO vMaterialId FROM MATERIAL
    WHERE codMaterial = vcodMaterial;

    IF (SQL%FOUND) THEN
        dbms_output.put_line('El material ya existe');
    END IF;

    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('Material no encontrado: ' || vcodMaterial);

        -- Insertar nuevo material
        INSERT INTO MATERIAL (codMaterial, nombre, cantidad)
        VALUES (vcodMaterial, vnombre, vcantidad);

        COMMIT;
        dbms_output.put_line('Datos del material insertados, código: ' || vcodMaterial);
END;
/

EXEC AlmacenarNuevoMaterial(0991, 'Taladro Trupper', 100);

-----------------DISPARADOR BITACORA---------------------
/**/

CREATE OR REPLACE TRIGGER BitacoraGarantia
AFTER INSERT ON INSTALACION
FOR EACH ROW
DECLARE
    v_fechaInstalacion DATE;
    v_fechaVencimientoGarantia DATE;
BEGIN
    -- Obtener la fecha de instalación y calcular la fecha de vencimiento de la garantía (30 días después)
    v_fechaInstalacion := :NEW.firmaAutorizacion; -- Suponiendo que la firma de autorización representa la fecha de instalación
    v_fechaVencimientoGarantia := v_fechaInstalacion + 30;

    -- Insertar en la bitácora
    INSERT INTO BITACORAGARANTIA (folioInsta, fechaInstalacion, fechaVencimientoGarantia)
    VALUES (:NEW.folioInsta, v_fechaInstalacion, v_fechaVencimientoGarantia);
END;
/



-- Insertar algunos registros de prueba en BITACORAGARANTIA
INSERT INTO BITACORAGARANTIA (folioInsta, fechaInstalacion, fechaVencimientoGarantia)
VALUES (1, TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-31', 'YYYY-MM-DD'));

INSERT INTO BITACORAGARANTIA (folioInsta, fechaInstalacion, fechaVencimientoGarantia)
VALUES (2, TO_DATE('2023-02-15', 'YYYY-MM-DD'), TO_DATE('2023-03-17', 'YYYY-MM-DD'));

INSERT INTO BITACORAGARANTIA (folioInsta, fechaInstalacion, fechaVencimientoGarantia)
VALUES (3, TO_DATE('2023-03-10', 'YYYY-MM-DD'), TO_DATE('2023-04-09', 'YYYY-MM-DD'));