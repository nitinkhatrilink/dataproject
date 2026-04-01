-- View: gold.fact_sales

-- DROP VIEW gold.fact_sales;

CREATE OR REPLACE VIEW gold.fact_sales
 AS
 SELECT sd.sls_ord_num AS order_number,
    pr.product_key,
    cu.customer_key,
    sd.sls_order_dt AS order_date,
    sd.sls_ship_dt AS shipping_date,
    sd.sls_due_dt AS due_date,
    sd.sls_sales AS sales_amount,
    sd.sls_quantity AS quantity,
    sd.sls_price AS price
   FROM silver.sales_detail sd
     LEFT JOIN gold.dim_products pr ON sd.sls_prd_key::text = pr.product_number::text
     LEFT JOIN gold.dim_customers cu ON sd.sls_cust_id = cu.customer_id;

ALTER TABLE gold.fact_sales
    OWNER TO postgres;

-- View: gold.dim_products

-- DROP VIEW gold.dim_products;

CREATE OR REPLACE VIEW gold.dim_products
 AS
 SELECT row_number() OVER (ORDER BY prd_start_dt, prd_id) AS product_key,
    prd_id AS product_id,
    prd_id AS product_number,
    prd_nm AS product_name,
    prd_line AS category,
    NULL::text AS subcategory,
    NULL::text AS maintenance,
    prd_cost AS cost,
    prd_line AS product_line,
    prd_start_dt AS start_date
   FROM silver.prd_info pn
  WHERE prd_end_dt IS NULL;

ALTER TABLE gold.dim_products
    OWNER TO postgres;

-- View: gold.dim_customers

-- DROP VIEW gold.dim_customers;

CREATE OR REPLACE VIEW gold.dim_customers
 AS
 SELECT row_number() OVER (ORDER BY ci.cst_id) AS customer_key,
    ci.cst_id AS customer_id,
    ci.cst_key AS customer_number,
    ci.cst_firstname AS first_name,
    ci.cst_lastname AS last_name,
    la.cntry AS country,
    ci.cst_marital_status AS marital_status,
        CASE
            WHEN ci.cst_gndr::text <> 'n/a'::text THEN ci.cst_gndr
            ELSE COALESCE(ca.gen, 'n/a'::character varying)
        END AS gender,
    ca.bdate AS birthdate,
    ci.cst_create_date AS create_date
   FROM silver.crm_cust_info ci
     LEFT JOIN silver.erp_cust_az12 ca ON ci.cst_key::text = ca.cid::text
     LEFT JOIN silver.erp_loc_a1 la ON ci.cst_key::text = la.cid::text;

ALTER TABLE gold.dim_customers
    OWNER TO postgres;

