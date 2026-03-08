
CREATE SCHEMA bronze;

CREATE SCHEMA silver;

CREATE SCHEMA gold;

DROP TABLE IF EXISTS bronze.crm_cust_info;
DROP TABLE IF EXISTS bronze.prd_info;
DROP TABLE IF EXISTS bronze.sales_detail;
DROP TABLE IF EXISTS bronze.erp_cust_az12;
DROP TABLE IF EXISTS bronze.cat_g1;
DROP TABLE IF EXISTS bronze.erp_loc_a1;



CREATE TABLE bronze.crm_cust_info (
    cst_id INT,
    cst_key VARCHAR(50),
    cst_firstname VARCHAR(100),
    cst_lastname VARCHAR(100),
    cst_marital_status VARCHAR(20),
    cst_gndr VARCHAR(10),
    cst_create_date DATE
);

CREATE TABLE bronze.prd_info (
    prd_id INT,
    prd_key VARCHAR(50),
    prd_nm VARCHAR(150),
    prd_cost DECIMAL(10,2),
    prd_line VARCHAR(50),
    prd_start_dt DATE,
    prd_end_dt DATE
);

CREATE TABLE bronze.sales_detail (
    sls_ord_num VARCHAR(50),
    sls_prd_key VARCHAR(50),
     sls_cust_id  INT,
    sls_order_dt INT,
    sls_ship_dt  INT,
    sls_due_dt   INT,
    sls_sales    INT,
    sls_quantity INT,
    sls_price    INT
);



CREATE TABLE bronze.erp_cust_az12 (
    cid VARCHAR(100),
    bdate DATE,
    gen VARCHAR(10)
);


CREATE TABLE bronze.cat_g1 (
    id VARCHAR(100),
    cat VARCHAR(100),
    subcat VARCHAR(100),
    maintenance VARCHAR(50)
);


CREATE TABLE bronze.erp_loc_a1 (
    cid VARCHAR(100),
    cntry VARCHAR(100)
);
