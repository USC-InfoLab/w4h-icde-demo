# W4H Toolkit ICDE Demo

Follow this README to set up the W4H ICDE demonstration. Refer to [W4H Toolkit Demonstration Scenario](DEMO_SCENARIO.md) for running the demo.

## About

The [Wearables for Health (W4H) Toolkit](https://infolab.usc.edu/projects/W4H/) is a suite of Open Source tools for managing, analyzing, and visualizing wearable data used in health applications. The Toolkit leverages a novel Geospatial Multivariate Time Series (GeoMTS) abstraction, which enables streamlined management and analysis of wearable data. The ICDE Demo provides a preview of the following W4H Toolkit components:

- **[StreamSim](https://github.com/USC-InfoLab/StreamSim)**: A real-time data streaming simulator tool for tabular data.
- **[W4H ImportHub](https://github.com/USC-InfoLab/W4H-ImportHub)**: A gateway to ingesting datasets.
- **[pyGarminAPI](https://github.com/USC-InfoLab/pyGarminAPI)**: A Python library to interact with the Garmin API.
- **Analytics Dashboard**: Dashboard demonstrating the W4H capabilities

## Demo Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [PostgreSQL](https://www.postgresql.org/) instance with connection information
- [Python](https://www.python.org/) 3.12 and `pip` (if running from source)
- [pgAdmin](https://www.pgadmin.org/) to access your database (optional)

## How to Run the Demo

You can run the demo in different ways:

1. DockerHub image (easiest)
2. Building a Docker image
3. From code base

### 1. DockerHub image

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

1. Set up the PostgreSQL instance with the sample datasets
2. Clone repository: `git clone https://github.com/USC-InfoLab/w4h-icde-demo.git`
3. Configure access to your Postgres instance:

    ```bash
    cd conf
    cp config.yaml.example config.yaml #configure with your Postgres database information
    ```

4. **Build Docker Image:**:

    ```shell
    docker build -t uscimsc/w4h:icde-demo .
    ```

5. Create and configure `config.yaml` to access your Postgres database instance:

    ```bash
    cd ./conf
    cp config.yaml.example config.yaml #configure with your Postgres database information
    ```

6. **Run the Container:** To start a container from the image, use the following command:

```bash
    cd w4h-icde-demo
    
    #build the image
    docker build -t uscimsc/w4h:icde-demo .

    #run the container
    docker run -dp 8501:8501 -v ./conf:/app/conf uscimsc/w4h:icde-demo

    #run in interactive mode for debugging XXX: dashboard not working with this
    docker run -it -p 8501:8501 -v ./conf:/app/conf uscimsc/w4h:icde-demo /bin/zsh
```

### 3. From code base

1. Set up the PostgreSQL instance with the sample datasets

- For example using [Postgres.app](https://postgresapp.com/downloads.html) on Mac
- Verify the installation running `pg_config --version`

2. **Install Required Packages:**

From the project directory install the necessary packages using `pip`:

```bash
    pip3 install -r requirements.txt
```

3. **Stream Simulation:**
Start the stream simulation service, run the following command:

```bash
    python3 stream_sim.py
```

4. **Start the Dashboard:**
After the stream simulation service is up and running, initiate the dashboard using `streamlit`:

```bash
    streamlit run viz.py
```

Once the dashboard is started, you can access it via the URL provided by `streamlit` in your terminal.
