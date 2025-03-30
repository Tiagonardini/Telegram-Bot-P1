# Pasos para ejecutar el proyecto en Desarrollo

Sigue estos pasos para configurar y ejecutar el proyecto localmente utilizando el devcontainer, Docker Compose y un entorno virtual para depuración:

1. **Abrir el proyecto en modo Devcontainer**  
   - Abre el proyecto en VS Code.  
   - Cuando se detecte el archivo [.devcontainer/devcontainer.json](.devcontainer/devcontainer.json), selecciona "Reopen in Container" para iniciar el entorno de desarrollo.

2. **Configurar el archivo de entorno**  
   - Crea el archivo de variables de entorno copiando el archivo `.env.example`.  
   - En la terminal integrada, ejecuta:
     ```sh
     cp .env.example .env
     ```

3. **Levantar el servicio de PostgreSQL**  
   - Ejecuta el siguiente comando en la terminal integrada para iniciar el contenedor de PostgreSQL definido en [docker-compose.yaml](docker-compose.yaml):
     ```sh
     docker-compose up -d
     ```
   - Con el plugin de postgres pueden configurar la conexion a la base para probar que todo este funcionando

   ![connection](assert/postgres-connection-plugin.png)

   - Importar la Base de datos en caso que no funcione automaticamente

   ```bash
   docker cp ./sql-init/ telegram-bot-ia-talk-database-practica-01-postgres-1:/tmp/sql-scripts
   ```
   ```bash
   docker exec telegram-bot-ia-talk-database-practica-01-postgres-1 psql -U postgres -d postgres -f /tmp/sql-scripts/01-sakila-schema.sql
   ```
   ```bash
   docker exec telegram-bot-ia-talk-database-practica-01-postgres-1 psql -U postgres -d postgres -f /tmp/sql-scripts/02-sakila-data.sql
   ```



4. **Configurar el entorno virtual (venv) para depuración**  
   _Nota: Dado que el devcontainer se ejecuta en Linux, solo es necesario utilizar las instrucciones para Linux._  
   - Crea el entorno virtual en la raíz del proyecto:
     ```sh
     python3 -m venv .venv
     ```
   - Actívalo:
     ```sh
     source .venv/bin/activate
     ```
   - Instala las dependencias:
     ```sh
     pip install -r requirements.txt
     ```

5. **Ejecutar y depurar**  
   - Con el entorno configurado y la base de datos en funcionamiento, inicia la depuración presionando F5 o seleccionando la configuración "Python: Ejecutar main" desde la pestaña de depuración en VS Code.

Con estos pasos, tendrás levantado el servicio de PostgreSQL, el entorno Python con las librerías instaladas y la posibilidad de depurar el archivo [main.py](http://_vscodecontentref_/0). ¡Éxitos en el desarrollo!



