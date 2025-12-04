# aerogalaxy-db

#  AeroGalaxy Database System

Este repositorio contiene la implementación de la base de datos para **AeroGalaxy**, una empresa dedicada al turismo espacial y misiones de investigación interplanetaria.

El proyecto demuestra el despliegue de contenedores utilizando **Docker**, la configuración de un motor de base de datos **PostgreSQL** y su administración gráfica mediante **pgAdmin 4**.

## Tecnologías Utilizadas

* **Docker Engine:** Para la orquestación de contenedores.
* **PostgreSQL v14:** Motor de base de datos relacional.
* **pgAdmin 4:** Interfaz gráfica de administración.
* **SQL:** Lenguaje para la definición (DDL) y manipulación (DML) de datos.

---

# Instrucciones de Despliegue

A continuación se detallan los comandos utilizados en la terminal para levantar la infraestructura.

1. Creación de la Red: Se creó una red para permitir la comunicación segura entre el contenedor de la base de datos y el de administración.
   
   Bash
   -> docker network create aerogalaxy-net 

3. Desplegar Base de Datos (PostgreSQL v14)
   
   Bash
   -> docker run -d --name aerogalaxy-db --network aerogalaxy-net -e POSTGRES_USER=aerogalaxy -e POSTGRES_PASSWORD=aerogalaxy_db -p 5432:5432 postgres:14 

5. Desplegar Administración (pgAdmin 4)
   
   Bash
   -> docker run -d --name aerogalaxy-pgadmin --network aerogalaxy-net -p 8080:80 -e PGADMIN_DEFAULT_EMAIL=usuario@aerogalaxy.com -e PGADMIN_DEFAULT_PASSWORD=galaxy#445 dpage/pgadmin4 

#Guía de Conexión
1. Acceso Web a pgAdmin
URL: http://localhost:8080

Usuario: usuario@aerogalaxy.com

Contraseña: galaxy#445

2. Configurar Servidor (Server Connection)
Dentro de pgAdmin, usa estos datos para conectar con el contenedor de la base de datos:

| Campo | Valor | Nota |
| :--- | :--- | :--- |
| **Name** | `Servidor AeroGalaxy` | Nombre descriptivo |
| **Host name/address** | `aerogalaxy-db` | Nombre del contenedor |
| **Port** | `5432` | Puerto interno |
| **Maintenance database** | `postgres` | Base por defecto |
| **Username** | `aerogalaxy` | Usuario del motor |
| **Password** | `aerogalaxy_db` | Contraseña del motor |

3. Archivos del Repositorio:
   ##El código SQL se ha dividido en dos archivos para mantener el orden. Es importante ejecutarlos en la secuencia indicada:

   1. ddl_estructura.sql (Ejecutar PRIMERO)
   Contiene los comandos CREATE TABLE. Define la estructura de las tablas.

   2. dml_datos.sql (Ejecutar SEGUNDO)
   Contiene los comandos INSERT. Puebla las tablas con los registros de prueba necesarios.

5. Cómo ejecutar los scripts en pgAdmin:
   
   * Conectarse al servidor y asegurarse de estar en la base de datos aerogalaxy.
   * Abrir la Query Tool.
   *  Copiar y ejecutar el contenido de ddl_estructura.sql.
   *  Borrar el editor, copiar y ejecutar el contenido de dml_datos.sql.

6. Cómo ejecutar los scripts en pgAdmin:
   
   * Conectarse al servidor y asegurarse de estar en la base de datos aerogalaxy.
   * Abrir la Query Tool.
   * Copiar y ejecutar el contenido de ddl_estructura.sql.
   * Borrar el editor, copiar y ejecutar el contenido de dml_datos.sql.


### AUTOR: ---- MARTIN ALVAREZ ----
