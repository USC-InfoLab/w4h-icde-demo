# W4H Toolkit ICDE Demo

Follow this README to set up the W4H ICDE demonstration. Refer to [W4H Toolkit Demonstration Scenario](DEMO_SCENARIO.md) for running the demo.

## About

The [Wearables for Health (W4H) Toolkit](https://infolab.usc.edu/projects/W4H/) is a suite of Open Source tools for managing, analyzing, and visualizing wearable data used in health applications. The Toolkit leverages a novel Geospatial Multivariate Time Series (GeoMTS) abstraction, which enables streamlined management and analysis of wearable data. The ICDE Demo provides a preview of the following W4H Toolkit components:

- **[StreamSim](https://github.com/USC-InfoLab/StreamSim)**: A real-time data streaming simulator tool for tabular data.
- **[W4H ImportHub](https://github.com/USC-InfoLab/W4H-ImportHub)**: A gateway to ingesting datasets.
- **[pyGarminAPI](https://github.com/USC-InfoLab/pyGarminAPI)**: A Python library to interact with the Garmin API.
- **Analytics Dashboard**: Dashboard demonstrating the W4H capabilities

See also the [W4H Toolkit for Acquisition, Storage, Analysis and Visualization of Data from Wearable Devices](https://youtu.be/67a8kuMjSAU) video demonstration.

## How to Run the Demo

You can run the demo in 3 different ways:

1. DockerHub image (easiest)
2. Building a Docker image
3. From code base

### 1. DockerHub image

#### Requirements

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [pgAdmin](https://www.pgadmin.org/)
- [Postgres.app](https://postgresapp.com/downloads.html)

For this you will need a Postgres database loaded with sample data.

1. Set up the PostgreSQL instance with the sample datasets
2. In Docker download the `w4h:icde-demo` image from DockerHub
3. Configure access to your Postgres instance:

```bash
    mkdir icde-demo
    cd icde-demo
    mkdir conf
    cd conf
    wget https://raw.githubusercontent.com/USC-InfoLab/w4h-icde-demo/refs/heads/main/config/config.yaml.example
    cp config.yaml.example config.yaml #configure with your Postgres database information
```

4. Run the container:

    ```bash
    docker run -dp 8501:8501 -v ${PWD}/conf:/app/conf uscimsc/w4h:latest
    ```

### 2. Building a Docker image

#### Requirements

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)

#### Build Docker Image and run the Container

```shell
    #build the image
    docker build -t uscimsc/w4h:icde-demo .

    #run the container
    docker run -dp 8501:8501 -v ./conf:/app/conf uscimsc/w4h:icde-demo

    #run in interactive mode for debugging XXX: dashboard not working with this
    docker run -it -p 8501:8501 -v ./conf:/app/conf uscimsc/w4h:icde-demo /bin/zsh

    XXX: upload image to docker
```

### 3. From code base

#### Requirements

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [pgAdmin](https://www.pgadmin.org/)
- [Postgres.app](https://postgresapp.com/downloads.html)

The following instructions are provided for **Mac ONLY**!

#### Start the demo

1. Start `Postgres.app` server
    - Verify the installation running `pg_config --version`
    - Verify the connection with `pgAdmin`
```plaintext
            host: localhost
            port: 5432
            maintenance database: postgres
            user: postgres
            password: postgres
```
2. Start the dashboard
```bash
    python -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt
    python stream_sim.py&  
    streamlit run viz.py  #starts at: http://localhost:8501/
```
3. Load the data:
    - Login in the dashboard as 'admin' with password 'admin' (ignore errors if any)
    - Open ImportHup
    - Select 'Create new W4H database instance' and create 'demo' database clicking 'Create'. You should see a confirmation `Database 'demo' created!`
    - Under 'Choose existing W4H database instance' and 'Select an existing database', choose 'demo'
    - Under 'Choose a CSV file' click 'Browse files', and select [synthetic_subject_data.csv](https://drive.google.com/file/d/1yAx63xeIwhI_8_1pUqGX2JWbkuFb8e3l/view?usp=sharing), check 'Populate subject table?', click 'Populate Database'. You should see a confirmation 'Database populated!'.
    - Under 'Choose a CSV file' click 'Browse files', upload [synthetic_timeseries_data.csv](https://drive.google.com/open?id=1EvpYG1KKm51YlDUQ_ezDCNaVCLiS8tF4&usp=drive_fs), uncheck 'Populate subject table?', scroll down and click 'Populate Database'. Be patient this step takes some time!
