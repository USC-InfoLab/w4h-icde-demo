# W4H Toolkit ICDE Demo

W4H Toolkit ICDE demonstration. A video demo is available at [here](https://youtu.be/67a8kuMjSAU).

## About

The [Wearables for Health (W4H) Toolkit](https://infolab.usc.edu/projects/W4H/) is a suite of Open Source tools for managing, analyzing, and visualizing wearable data used in health applications. The Toolkit leverages a novel Geospatial Multivariate Time Series (GeoMTS) abstraction, which enables streamlined management and analysis of wearable data. The ICDE Demo provides a preview of the following W4H Toolkit components:

- **[StreamSim](https://github.com/USC-InfoLab/StreamSim)**: A real-time data streaming simulator tool for tabular data.
- **[W4H ImportHub](https://github.com/USC-InfoLab/W4H-ImportHub)**: A gateway to ingesting datasets.
- **[pyGarminAPI](https://github.com/USC-InfoLab/pyGarminAPI)**: A Python library to interact with the Garmin API.
- **Analytics Dashboard**: Dashboard demonstrating the W4H capabilities

See also the [W4H Toolkit for Acquisition, Storage, Analysis and Visualization of Data from Wearable Devices](https://youtu.be/67a8kuMjSAU) video demonstration.

## Run the Demo

The following instructions are provided for **Mac ONLY**!

You will need the following to run the demo:

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [pgAdmin](https://www.pgadmin.org/)
- [Postgres.app](https://postgresapp.com/downloads.html)

After you install Docker, pgAdmin and Postgres.app, start `Postgres.app` server and verify the installation:accessible:
    - Verify the installation running `pg_config --version`
    - Verify the connection with `pgAdmin`

```plaintext
            host: localhost
            port: 5432
            maintenance database: postgres
            user: postgres
            password: postgres
```

You can then run the demo in 3 different ways:

1. DockerHub image (easiest)
2. Building a Docker image
3. From code base

Once the platform is running, open the dashboard at http://localhost:8501/ and follow [DEMO_SCENARIO.md](DEMO_SCENARIO.md). See also the [video demo](https://youtu.be/67a8kuMjSAU).

### 1. DockerHub image

Download the [DockerHub w4h:icde-demo image](https://hub.docker.com/r/uscimsc/w4h) and run the container:

```bash
    docker pull uscimsc/w4h:icde-demo
    docker run -dp 8501:8501 uscimsc/w4h:icde-demo
```

### 2. Building a Docker image

Build a Docker Image and run the Container:

```shell
    #build the image
    docker build -t uscimsc/w4h:icde-demo .

    #run the container
    docker run -dp 8501:8501 -v ./conf:/app/conf uscimsc/w4h:icde-demo

    #run in interactive mode for debugging XXX: dashboard not working with this
    docker run -it -p 8501:8501 -v ./conf:/app/conf uscimsc/w4h:icde-demo /bin/zsh
```

### 3. From code base

From within this repository start the dashboard:

```bash
    python -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt
    python stream_sim.py&  
    streamlit run viz.py  # Starts the dashboard at: http://localhost:8501/
```
