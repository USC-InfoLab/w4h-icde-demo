## ICDE Demo

### Demo Scenario

Follow these steps:

1. **Log in**  
    Login with:
    > username: admin  
    > password: admin

2. **Create test2 database**
    Click the "import dataset" button, you will see a page like this:

    ![import_page_create](../static/import_page_create.png)

    Create a new database instance by selecting "Create new W4H database instance":

    ![create_new_db](../static/create_new_db.png)

    Input the database name and click *create*:

    ![set_db_name](../static/set_db_name.png)

    You should see the following:

    ![create_success](../static/create_success.png)

    Select "Choose existing W4H database instance":

    ![choose_exist_db](../static/choose_exist_db.png)

    Select the database you just created:

    ![select_exist_db](../static/select_exist_db.png)

    Download sample data:

    [synthetic_subject_data.csv](https://github.com/USC-InfoLab/w4h-datasets/blob/main/synthetic_subject_data.csv)  
    [synthetic_timeseries_data.csv](https://github.com/USC-InfoLab/w4h-datasets/blob/main/synthetic_timeseries_data.csv)  

    Check "Populate subject table" and upload `synthetic_subject_data.csv`:

    ![upload_subject_csv](../static/upload_subject_csv.png)

    Click "Populate database" at the bottom:

    ![populate_db](../static/populate_db.png)

    Upload `synthetic_timeseries_data_reduced.csv`:

    ![upload_time_csv](../static/upload_time_csv.png)

    Click "Populate database":

    ![populate_db_time](../static/populate_db_time.png)

3. **Data analytics on the test2 dataset**  

    Click on the "Analyze Dataset" button and select test2 from the dropdown:

    ![input_select_db](../static/input_select_db.png)

    Select the subjects and control group you want to check

    ![subjects_and_control_group](../static/subjects_and_control_group.png)

    Set the analysis configuration

    ![analysis_configuration](../static/analysis_configuration.png)

    Click "show result" to display the data analytics.

4. **Streaming data analytics on the test2 dataset**  

    Click on the "Input Page" button and select test2 from the dropdown:

    ![input_select_db](../static/input_select_db.png)

    Select the subjects and control group you want to check

    ![subjects_and_control_group](../static/subjects_and_control_group.png)

    Set the analysis configuration for streaming data 

    ![streaming_analysis_configuration](../static/streaming_analysis_configuration.png)

    Click "show result" to display the data analytics.

See also [DEMO_SCENARIO.md](https://github.com/USC-InfoLab/w4h-icde-demo/blob/main/DEMO_SCENARIO.md)