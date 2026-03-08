
CREATE OR REPLACE PROCEDURE bronze.load_bronze_tables()
LANGUAGE plpgsql
AS $$
BEGIN

RAISE NOTICE 'Bronze Load Started';

-- =====================================================
-- CRM CUSTOMER INFO
-- =====================================================
BEGIN
    RAISE NOTICE 'Loading crm_cust_info';

    TRUNCATE TABLE bronze.crm_cust_info;

    COPY bronze.crm_cust_info
    FROM 'E:/data/sql-data-warehouse-project-main/datasets/source_crm/cust_info.csv'
    DELIMITER ','
    CSV HEADER;

    RAISE NOTICE 'crm_cust_info loaded successfully';

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Error loading crm_cust_info: %', SQLERRM;
END;


-- =====================================================
-- PRODUCT INFO
-- =====================================================
BEGIN
    RAISE NOTICE 'Loading prd_info';

    TRUNCATE TABLE bronze.prd_info;

    COPY bronze.prd_info
    FROM 'E:/data/sql-data-warehouse-project-main/datasets/source_crm/prd_info.csv'
    DELIMITER ','
    CSV HEADER;

    RAISE NOTICE 'prd_info loaded successfully';

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Error loading prd_info: %', SQLERRM;
END;


-- =====================================================
-- SALES DETAILS
-- =====================================================
BEGIN
    RAISE NOTICE 'Loading sales_detail';

    TRUNCATE TABLE bronze.sales_detail;

    COPY bronze.sales_detail
    FROM 'E:/data/sql-data-warehouse-project-main/datasets/source_crm/sales_details.csv'
    DELIMITER ','
    CSV HEADER
    NULL '';

    RAISE NOTICE 'sales_detail loaded successfully';

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Error loading sales_detail: %', SQLERRM;
END;


-- =====================================================
-- ERP CUSTOMER
-- =====================================================
BEGIN
    RAISE NOTICE 'Loading erp_cust_az12';

    TRUNCATE TABLE bronze.erp_cust_az12;

    COPY bronze.erp_cust_az12
    FROM 'E:/data/sql-data-warehouse-project-main/datasets/source_erp/CUST_AZ12.csv'
    DELIMITER ','
    CSV HEADER;

    RAISE NOTICE 'erp_cust_az12 loaded successfully';

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Error loading erp_cust_az12: %', SQLERRM;
END;


-- =====================================================
-- CATEGORY DATA
-- =====================================================
BEGIN
    RAISE NOTICE 'Loading cat_g1';

    TRUNCATE TABLE bronze.cat_g1;

    COPY bronze.cat_g1
    FROM 'E:/data/sql-data-warehouse-project-main/datasets/source_erp/PX_CAT_G1V2.csv'
    DELIMITER ','
    CSV HEADER;

    RAISE NOTICE 'cat_g1 loaded successfully';

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Error loading cat_g1: %', SQLERRM;
END;


-- =====================================================
-- LOCATION DATA
-- =====================================================
BEGIN
    RAISE NOTICE 'Loading erp_loc_a1';

    TRUNCATE TABLE bronze.erp_loc_a1;

    COPY bronze.erp_loc_a1
    FROM 'E:/data/sql-data-warehouse-project-main/datasets/source_erp/LOC_A101.csv'
    DELIMITER ','
    CSV HEADER;

    RAISE NOTICE 'erp_loc_a1 loaded successfully';

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Error loading erp_loc_a1: %', SQLERRM;
END;


RAISE NOTICE 'Bronze Load Finished';

END;
$$;
