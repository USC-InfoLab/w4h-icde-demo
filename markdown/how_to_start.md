# Use W4h dashboard to track your patients' health data

## Introduction

The W4H GeoMTS dashboard is designed to provide visualization and analysis capabilities for GeoMTS data catered specifically for Apple Watch demo purposes.

## How to play with it

0. **Log in**  
    We have provided a default account for you to test the system. In the future, w4h will be polished to support multiple users and password management.
    The default account is:
    > username: admin  
      password: admin

1. **Create/Manage your database instance in your DB server:**  

    At this moment, you should have read the Setting up tutorial and set up your database server.
    If you already have data in proper format in your database, you can skip this step.  
    Click the "import page" button on the left side of the dashboard, you will see a page like this:  

    ![import_page_create](../static/import_page_create.png)

    Let's start from creating a new database instance:  

    First, Select "Create new W4H database instance"

    ![create_new_db](../static/create_new_db.png)

    Second, type in the name of database you want to make, and click *create*. In this case we name it *"*test2*

    ![set_db_name](../static/set_db_name.png)

    If it's created successfully, you will see a message like this:  

    ![create_success](../static/create_success.png)

    Third, select "Choose existing W4H database instance"

    ![choose_exist_db](../static/choose_exist_db.png)

    Select the database you just created

    ![select_exist_db](../static/select_exist_db.png)

    For the Following step, if you need some test file, try to download here:

    [synthetic_subject_data.csv](https://drive.google.com/file/d/1yAx63xeIwhI_8_1pUqGX2JWbkuFb8e3l/view?usp=sharing)  
    [synthetic_timeseries_data_reduced.csv](https://drive.google.com/file/d/1EvpYG1KKm51YlDUQ_ezDCNaVCLiS8tF4/view?usp=sharing)  

    Fourth, Upload your subjects csv file, and check "Populate subject table name".

    ![upload_subject_csv](../static/upload_subject_csv.png)

    After making sure corresponding Column are all correct, click "Populate database" at the bottom.

    ![populate_db](../static/populate_db.png)

    Fifth, upload your time series csv file

    ![upload_time_csv](../static/upload_time_csv.png)

    After making sure corresponding Column are all correct, click "Populate database" at the bottom.  

    ![populate_db_time](../static/populate_db_time.png)

    (Optional)Sixth, open your DB management tool, such as PgAdmin4, and check if the data is populated correctly.

    ![pgadmin](../static/pgadmin.png)

2. **Choose your db in the input page, then setup it!**  

    Choose your db in the input page

    ![input_select_db](../static/input_select_db.png)

    Select the subjects and control group you want to check

    ![subjects_and_control_group](../static/subjects_and_control_group.png)

    Select if you want to simulate the data. Click "show result"

3. **Check the result page**  

    You are there!

    ![result_page](../static/result_page.png)
