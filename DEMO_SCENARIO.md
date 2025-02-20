# W4H Toolkit Demo Scenario

See the [video demo](https://youtu.be/67a8kuMjSAU).

## Login and Data Upload

1. Access the dashboard at [http://localhost:8501](http://localhost:8501)
2. Login in the dashboard as 'admin' with password 'admin' (ignore errors if any)
3. Download sample data:
    - [synthetic_subject_data.csv](https://drive.google.com/file/d/1yAx63xeIwhI_8_1pUqGX2JWbkuFb8e3l/view?usp=sharing)
    - [synthetic_timeseries_data.csv](https://drive.google.com/open?id=1EvpYG1KKm51YlDUQ_ezDCNaVCLiS8tF4&usp=drive_fs)
4. Import sample data:
    - Click 'ImportHub' in the toolbar
    - Select 'Create new W4H database instance' and click 'Create' to create a 'demo' database . You should see a confirmation 'Database 'demo' created!'
    - Select 'Choose existing W4H database instance' and 'Select an existing database', choose 'demo'
    - Under 'Choose a CSV file' click 'Browse files', and select 'synthetic_subject_data.csv', check 'Populate subject table?', click 'Populate Database'. You should see a confirmation 'Database populated!'.
    - Under 'Choose a CSV file' click 'Browse files', upload 'synthetic_timeseries_data.csv', uncheck 'Populate subject table?', scroll down and click 'Populate Database'. Be patient this step takes some time!
