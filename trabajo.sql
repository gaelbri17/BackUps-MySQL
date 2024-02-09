CREATE DATABASE trabajo;

USE trabajo


- Crear la tabla de empleados
CREATE TABLE empleados (
    id_empleados INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    departamento_id INT,
    salario DECIMAL(10, 2)
);

-- Insertar datos de empleados
INSERT INTO empleados (nombre, departamento_id, salario) VALUES
('Juan', 1, 3000.00),
('María', 2, 3500.00),
('Pedro', 1, 3200.00),
('Ana', 3, 2800.00),
('Luis', 2, 3000.00);

-- Crear la tabla de departamentos
CREATE TABLE departamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

-- Insertar datos de departamentos
INSERT INTO departamentos (nombre) VALUES
('Ventas'),
('Marketing'),
('TI');

-- Crear la tabla de ventas
CREATE TABLE ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    producto_id INT,
    cantidad_vendida INT,
    fecha DATE
);

-- Insertar datos de ventas
INSERT INTO ventas (producto_id, cantidad_vendida, fecha) VALUES
(1, 10, '2024-02-01'),
(2, 15, '2024-02-01'),
(1, 8, '2024-02-02'),
(3, 12, '2024-02-02'),
(2, 20, '2024-02-03');

-- Crear la tabla de productos
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10, 2)
);

-- Insertar datos de productos
INSERT INTO productos (nombre, precio) VALUES
('Producto A', 20.00),
('Producto B', 25.00),
('Producto C', 30.00);

SELECT * FROM ventas;

-- Funciones de Agregado en MySQL
SELECT COUNT(*) AS total_ventas FROM ventas; -- Contar el número total de registros en la tabla ventas

SELECT SUM(cantidad_vendida) AS total_productos_vendidos FROM ventas; -- Calcular la cantidad total de productos vendidos

SELECT AVG(cantidad_vendida) AS promedio_productos_por_venta FROM ventas; -- Calcular el promedio de productos vendidos por transacción

-- Tipos de JOIN en MySQL
SELECT empleados.nombre, departamentos.nombre AS departamento
FROM empleados
INNER JOIN departamentos ON empleados.departamento_id = departamentos.id; -- INNER JOIN: Obtener la información de los empleados junto con el departamento al que pertenecen

SELECT empleados.nombre, departamentos.nombre AS departamento
FROM empleados
LEFT JOIN departamentos ON empleados.departamento_id = departamentos.id; -- LEFT JOIN: Obtener todos los empleados y la información de su departamento si tienen uno

SELECT empleados.nombre, departamentos.nombre AS departamento
FROM empleados
RIGHT JOIN departamentos ON empleados.departamento_id = departamentos.id; -- RIGHT JOIN: Obtener todos los departamentos y la información de los empleados que pertenecen a cada uno (si los hay)

-- Subconsultas en MySQL
SELECT nombre
FROM productos
WHERE id = (
    SELECT producto_id
    FROM ventas
    GROUP BY producto_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
); -- Subconsulta para obtener el producto más vendido