#Creacion de Base de datos.
CREATE DATABASE telovendosprint;
#Creacion de usuario para base de datos.
CREATE USER 'admintiendasprint'@'localhost' IDENTIFIED BY '123456789';
#Uso de la base datos recien creada.
USE telovendosprint;
#Asignacion de provilegios en la base de datos para usuario creado anteriormente.
GRANT ALL PRIVILEGES ON telovendosprint TO 'admintiendasprint'@'localhost';
#Actualizacion en funcion del reconocimiento de los provilegios asignados.
FLUSH PRIVILEGES;

#Creacion tabla Cliente
CREATE TABLE Cliente(
	nombre varchar(30),
	apellido varchar(30),
	direccion varchar(40)
)

#Creacion tabla Producto

CREATE TABLE Producto(
	id_producto int NOT NULL AUTO_INCREMENT,
	precio int,
	categoria varchar(30),
	proveedor int,
	color varchar(30),
	stock int,
	PRIMARY KEY(id_producto),
	FOREIGN KEY (proveedor) REFERENCES Proveedor(id_proveedor)
)

#Creacion tabla Proveedor

CREATE TABLE Proveedor(
	id_proveedor int NOT NULL AUTO_INCREMENT,
	nombre_representante_legal varchar(30),
	nombre_corporativo varchar(15),
	telefono_contacto_1 varchar(15),
	telefono_contacto_2 varchar(15),
	nombre_recibe_llamada varchar(25),
	categoria_productos varchar(15),
	correo_electronico varchar(50),
	PRIMARY KEY (id_proveedor)
)

# - Añadir 5 filas con informacion a tabla Proveedor
insert into Proveedor (nombre_representante_legal, nombre_corporativo, telefono_contacto_1, telefono_contacto_2, nombre_recibe_llamada, categoria_productos, correo_electronico) values ('Marlyn', 'Dabfeed', '7424187339', '9417402395', 'Rory', 'Finance', 'rpenchen0@hatena.ne.jp');
insert into Proveedor (nombre_representante_legal, nombre_corporativo, telefono_contacto_1, telefono_contacto_2, nombre_recibe_llamada, categoria_productos, correo_electronico) values ('Casi', 'Skinix', '5763845277', '2605138162', 'Errick', 'Public Util', 'etavener1@dion.ne.jp');
insert into Proveedor (nombre_representante_legal, nombre_corporativo, telefono_contacto_1, telefono_contacto_2, nombre_recibe_llamada, categoria_productos, correo_electronico) values ('Robin', 'Gabcube', '9977269750', '5498495594', 'Shani', 'Technology', 'sstockport2@blogs.com');
insert into Proveedor (nombre_representante_legal, nombre_corporativo, telefono_contacto_1, telefono_contacto_2, nombre_recibe_llamada, categoria_productos, correo_electronico) values ('Alie', 'Oyope', '1161261827', '9857701737', 'Udell', 'Technology', 'uguerola3@csmonitor.com');
insert into Proveedor (nombre_representante_legal, nombre_corporativo, telefono_contacto_1, telefono_contacto_2, nombre_recibe_llamada, categoria_productos, correo_electronico) values ('Ruggiero', 'Npath', '9793322716', '2181911078', 'Giulietta', 'Health Care', 'gpolin4@chron.com');

# - Añadir 5 filas con informacion a tabla Cliente
insert into Cliente (nombre, apellido, direccion) values ('Shawnee', 'Wallington', '653 North Drive');
insert into Cliente (nombre, apellido, direccion) values ('Wye', 'Bourner', '96 Declaration Trail');
insert into Cliente (nombre, apellido, direccion) values ('Paquito', 'Moehle', '449 Namekagon Point');
insert into Cliente (nombre, apellido, direccion) values ('Gonzalo', 'Tovey', '174 Moland Crossing');
insert into Cliente (nombre, apellido, direccion) values ('Carissa', 'Handke', '91 Briar Crest Street');

# - Añadir 10 filas con informacion a tabla producto
insert into Producto (precio, categoria, proveedor, color, stock) values (325, 'Teclados', 3, 'Red', 97);
insert into Producto (precio, categoria, proveedor, color, stock) values (627, 'Linea Blanca', 1, 'Crimson', 43);
insert into Producto (precio, categoria, proveedor, color, stock) values (546, 'Linea Blanca', 5, 'Mauv', 100);
insert into Producto (precio, categoria, proveedor, color, stock) values (874, 'Pantalla', 2, 'Mauv', 15);
insert into Producto (precio, categoria, proveedor, color, stock) values (586, 'Audifonos', 2, 'Indigo', 45);
insert into Producto (precio, categoria, proveedor, color, stock) values (192, 'Linea Blanca', 5, 'Purple', 51);
insert into Producto (precio, categoria, proveedor, color, stock) values (411, 'Pantalla', 1, 'Green', 13);
insert into Producto (precio, categoria, proveedor, color, stock) values (66, 'Linea Blanca', 4, 'Orange', 29);
insert into Producto (precio, categoria, proveedor, color, stock) values (438, 'Audifonos', 2, 'Red', 68);
insert into Producto (precio, categoria, proveedor, color, stock) values (658, 'Audifonos', 1, 'Maroon', 85);


# - Cuál es la categoría de productos que más se repite. 
SELECT categoria, COUNT(*) as cantidad from Producto GROUP BY categoria ORDER BY cantidad DESC LIMIT 1;

# - Cuáles son los productos con mayor stock 
SELECT categoria, SUM(stock) as cantidad from Producto GROUP BY categoria ORDER BY cantidad DESC LIMIT 1;

# - Qué color de producto es más común en nuestra tienda. 
SELECT color, SUM(stock) as cantidad from Producto GROUP BY color ORDER BY cantidad DESC LIMIT 1 ;

# - Cual o cuales son los proveedores con menor stock de productos. 
SELECT Proveedor.nombre_corporativo, SUM(Producto.stock) as cantidad from Proveedor  
INNER JOIN Producto ON Proveedor.id_proveedor = Producto.proveedor GROUP BY Proveedor.nombre_corporativo ORDER BY cantidad ASC LIMIT 1  ;

# - Cambien la categoría de productos más popular por ‘Electrónica y computación’. 
UPDATE  Producto SET categoria = 'Electrónica y computación' WHERE categoria = 'Linea Blanca'









