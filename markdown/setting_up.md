# Welcome to w4h setting up toturial!

## Prerequisites
Before getting started, ensure you have access to your database service, and have the following details ready:
- Database host
- Username
- Password
- Database name
- Port the database is listening on

## Setup
Follow the instructions below to either set up a new database or use your existing database. 

### 1. Setting up a new database
1. **Run a PostgreSQL Docker image:**
   - Use the following command to run a PostgreSQL container:
     ```bash
     docker run -d --name postgis-container -p <port_num>:<port_num> -e POSTGRES_USER=<postgres_user> -e POSTGRES_PASSWORD=<postgres_pwd> postgis/postgis
     ```
     Example:
     ```bash
     docker run -d --name postgis-container -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres postgis/postgis
     ```

2. **Obtain the database IP address:**
   - Find the container ID for the database using:
     ```bash
     docker ps
     ```
   - Retrieve the IP address of the container:
     ```bash
     docker inspect <db_container_id> | grep "IPAddress"
     ```

3. **Create the configuration file:**
   - Based on the [config.yaml.example](../app/static/config.yaml.example), create a `config.yaml` file and fill in the fields using the details from steps 1 and 2:
     ```yaml
     database:
       dbms: 'postgresql'
       host: <postgres_ip_address>
       port: <port_num>
       user: <postgres_user>
       password: <postgres_pwd>
     ```
2. **Save the configuration file:**
   - Rename the file to `config.yaml`

3. **Upload the config.yaml file:**
   - Upload the config.yaml file below and click on Update Config buttton.

### 2. Using your own database
1. **Create the configuration file:**
   - Refer to the example configuration file: [config.yaml.example](../app/static/config.yaml.example)
   - Create a new file named `config.yaml` and copy the contents of the example file.
   - Replace the following fields with your database details:
     ```yaml
     database:
       dbms: 'postgresql'
       host: <your_db_host>
       port: <your_db_port>
       user: <your_db_username>
       password: <your_db_password>
     ```
2. **Save the configuration file:**
   - Rename the file to `config.yaml` and place it in a directory named `conf`.

3. **Restart the Docker container:**
   - Shut down the current Docker container.
   - Re-run Docker with the following command:
     ```bash
     docker run -dp 8501:8501 -v {your_conf_directory_absolute_path}:/app/conf uscimsc/w4h:latest
     ```

### Follow the instruction on "How to Start" tutorial from the dropdown at the top of this page for next steps.
