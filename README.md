# W4H Toolkit Demo
## About the W4H Toolkit
The Wearables for Health (W4H) Integrated Toolkit Repository serves as a centralized hub for managing, analyzing, and visualizing wearable data in a seamless and efficient manner. This repository hosts a suite of open-source tools and frameworks meticulously engineered to facilitate end-to-end processing of wearable data, ranging from data ingestion from various sources to real-time and offline analytics, all the way to insightful visualization. At the core of the toolkit lies the novel Geospatial Multivariate Time Series (GeoMTS) abstraction, which enables streamlined management and analysis of wearable data. The repository encompasses key components such as StreamSim for simulating real-time data streaming, W4H ImportHub for integrating offline datasets, pyGarminAPI and pyFitbitAPI for efficient interaction with popular wearable device APIs, and an Integrated Analytics Dashboard for effective data extraction, presentation, and analysis.

### Toolkit Components
This toolkit comprises the following tools, each tailored to address specific needs in the wearable data lifecycle:

- **[StreamSim](https://github.com/USC-InfoLab/StreamSim)**: A real-time data streaming simulator tool for tabular data, aiding in testing real-time applications.

- **[W4H ImportHub](https://github.com/USC-InfoLab/W4H-ImportHub)**: Your gateway for seamlessly integrating stored datasets like CSV files into the W4H platform.

- **[pyGarminAPI](https://github.com/USC-InfoLab/pyGarminAPI)**: A Python library to interact with the Garmin API, facilitating the retrieval of activity and health data from Garmin devices.

- **Integrated Analytics Dashboard**: Core component for GeoMTS data extraction, presentation, and analysis, supporting both real-time and offline analytics on GeoMTS data. (Source code included in this repo)

- **[Approximate Aggregate Queries on GeoMTS](https://github.com/USC-InfoLab/fft_approximate)**: A PostgreSQL extension `fft_approximate` for quickly answering aggregate range queries on time series data using an approximate approach.

## Running the Demo

### Prerequisites
- Docker
- pgAdmin
- PostgreSQL
- Python and `pip` (if running without Docker)

### Setup
1. Configure Database Properties
    - Copy the example configuration file:
        ```shell
        cp static/config.yaml.example conf/config.yaml
        ```
    - Edit the copied file (`conf/config.yaml`) to specify your database properties:
        - `dbms`: Set to 'postgresql'
        - `host`: Your database host
            - macOS and Windows machines should use `host.docker.internal`
            - Linux machines should use `localhost`
        - `port`: Your database port
        - `user`: Your database username
        - `password`: Your database password
    
    Make sure your PostgreSQL database is populated with the necessary data
    - **Note:** If you plan to use Docker to run the demo, you can simply add the data within the ImportHub in the Toolkit

### Running the Demo Using Docker
1. **Build Docker Image:** First, navigate to the root directory and build the Docker image:
    ```shell
    docker build -t uscimsc/w4h:demo .
    ```
2. **Run the Container:** To start a container from the image, use the following command:
    ```shell
    docker run -dp 8501:8501 -v {your_conf_directory_absolute_path}:/app/conf uscimsc/w4h:demo
    ```
3. **Access the Dashboard**: After the container is up and running, you can access the dashboard at [http://localhost:8501](http://localhost:8501)

### Running the Demo Without Docker
1. **Install Required Packages:**
First, navigate to the project directory and install the necessary packages using `pip`:
    ```bash
    pip install -r requirements.txt
    ```

2. **Stream Simulation:**
To start the stream simulation service, run the following command:
    ```bash
    python stream_sim.py
    ```

3. **Start the Dashboard:**
After the stream simulation service is up and running, initiate the dashboard using `streamlit`:
    ```bash
    streamlit run viz.py
    ```
    Once the dashboard is started, you can access it via the URL provided by `streamlit` in your terminal.