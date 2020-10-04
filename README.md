# README

A Rails API designed to specifications described here:
https://github.com/pbc/devtest

Private API requests:
GET /private/locations/:country_code
GET /private/target_groups/:country_code
POST /private/evaluate_target          

Public API requests:
GET /public/locations/:country_code
GET /public/target_groups/:country_code

Basic HTML authorization credentials:
Username: admin
Password: pw

Country codes for test/development DB entries:
FI, PL, DE

POST request must contain a JSON hash containing:
country_code (e.g. FI)
target_group_id (a value between 1 and 3)
locations (an array of hashes: { id: 123, panel_size: 200 })

![db_diagram](https://user-images.githubusercontent.com/69091357/95027241-aef83180-069f-11eb-9634-b43e4198f941.png)
