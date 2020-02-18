CREATE TABLE IF NOT EXISTS northwind.customers (
  id integer NOT NULL,
  company VARCHAR(500) NULL DEFAULT NULL,
  last_name VARCHAR(500) NULL DEFAULT NULL,
  first_name VARCHAR(500) NULL DEFAULT NULL,
  email_address VARCHAR(500) NULL DEFAULT NULL,
  job_title VARCHAR(500) NULL DEFAULT NULL,
  business_phone VARCHAR(25) NULL DEFAULT NULL,
  home_phone VARCHAR(25) NULL DEFAULT NULL,
  mobile_phone VARCHAR(25) NULL DEFAULT NULL,
  fax_number VARCHAR(25) NULL DEFAULT NULL,
  address varchar(500) NULL DEFAULT NULL,
  city VARCHAR(500) NULL DEFAULT NULL,
  state_province VARCHAR(500) NULL DEFAULT NULL,
  zip_postal_code VARCHAR(15) NULL DEFAULT NULL,
  country_region VARCHAR(500) NULL DEFAULT NULL,
  web_page varchar(500) NULL DEFAULT NULL,
  notes varchar(500) NULL DEFAULT NULL,
  attachments varchar(500) NULL DEFAULT NULL);

CREATE TABLE IF NOT EXISTS northwind.employees (
  id integer NOT NULL,
  company VARCHAR(500) NULL DEFAULT NULL,
  last_name VARCHAR(500) NULL DEFAULT NULL,
  first_name VARCHAR(500) NULL DEFAULT NULL,
  email_address VARCHAR(500) NULL DEFAULT NULL,
  job_title VARCHAR(500) NULL DEFAULT NULL,
  business_phone VARCHAR(25) NULL DEFAULT NULL,
  home_phone VARCHAR(25) NULL DEFAULT NULL,
  mobile_phone VARCHAR(25) NULL DEFAULT NULL,
  fax_number VARCHAR(25) NULL DEFAULT NULL,
  address varchar(500) NULL DEFAULT NULL,
  city VARCHAR(500) NULL DEFAULT NULL,
  state_province VARCHAR(500) NULL DEFAULT NULL,
  zip_postal_code VARCHAR(15) NULL DEFAULT NULL,
  country_region VARCHAR(500) NULL DEFAULT NULL,
  web_page varchar(500) NULL DEFAULT NULL,
  notes varchar(500) NULL DEFAULT NULL,
  attachments varchar(500) NULL DEFAULT NULL);


CREATE TABLE IF NOT EXISTS northwind.privileges (
  id integer NOT NULL,
  privilege_name VARCHAR(500) NULL DEFAULT NULL);


CREATE TABLE IF NOT EXISTS northwind.employee_privileges (
  employee_id integer NOT NULL,
  privilege_id integer NOT NULL);




CREATE TABLE IF NOT EXISTS northwind.inventory_transaction_types (
  id integer NOT NULL,
  type_name VARCHAR(500) NOT NULL);


CREATE TABLE IF NOT EXISTS northwind.shippers (
  id integer NOT NULL,
  company VARCHAR(500) NULL DEFAULT NULL,
  last_name VARCHAR(500) NULL DEFAULT NULL,
  first_name VARCHAR(500) NULL DEFAULT NULL,
  email_address VARCHAR(500) NULL DEFAULT NULL,
  job_title VARCHAR(500) NULL DEFAULT NULL,
  business_phone VARCHAR(25) NULL DEFAULT NULL,
  home_phone VARCHAR(25) NULL DEFAULT NULL,
  mobile_phone VARCHAR(25) NULL DEFAULT NULL,
  fax_number VARCHAR(25) NULL DEFAULT NULL,
  address varchar(500) NULL DEFAULT NULL,
  city VARCHAR(500) NULL DEFAULT NULL,
  state_province VARCHAR(500) NULL DEFAULT NULL,
  zip_postal_code VARCHAR(15) NULL DEFAULT NULL,
  country_region VARCHAR(500) NULL DEFAULT NULL,
  web_page varchar(500) NULL DEFAULT NULL,
  notes varchar(500) NULL DEFAULT NULL,
  attachments varchar(500) NULL DEFAULT NULL);


CREATE TABLE IF NOT EXISTS northwind.orders_tax_status (
  id integer NOT NULL,
  tax_status_name VARCHAR(500) NOT NULL,
  PRIMARY KEY (id));

CREATE TABLE IF NOT EXISTS northwind.orders_status (
  id integer NOT NULL,
  status_name VARCHAR(500) NOT NULL,
  PRIMARY KEY (id));

CREATE TABLE IF NOT EXISTS northwind.orders (
  id integer NOT NULL,
  employee_id integer NULL DEFAULT NULL,
  customer_id integer NULL DEFAULT NULL,
  order_date timestamp NULL DEFAULT NULL,
  shipped_date timestamp NULL DEFAULT NULL,
  shipper_id integer NULL DEFAULT NULL,
  ship_name VARCHAR(500) NULL DEFAULT NULL,
  ship_address varchar(500) NULL DEFAULT NULL,
  ship_city VARCHAR(500) NULL DEFAULT NULL,
  ship_state_province VARCHAR(500) NULL DEFAULT NULL,
  ship_zip_postal_code VARCHAR(500) NULL DEFAULT NULL,
  ship_country_region VARCHAR(500) NULL DEFAULT NULL,
  shipping_fee DECIMAL(19,4) NULL DEFAULT '0.0000',
  taxes DECIMAL(19,4) NULL DEFAULT '0.0000',
  payment_type VARCHAR(500) NULL DEFAULT NULL,
  paid_date timestamp NULL DEFAULT NULL,
  notes varchar(500) NULL DEFAULT NULL,
  tax_rate decimal(19,4) NULL DEFAULT '0',
  tax_status_id integer NULL DEFAULT NULL,
  status_id integer NULL DEFAULT '0');

CREATE TABLE IF NOT EXISTS northwind.products (
  supplier_ids varchar(500) NULL DEFAULT NULL,
  id integer NOT NULL,
  product_code VARCHAR(25) NULL DEFAULT NULL,
  product_name VARCHAR(500) NULL DEFAULT NULL,
  description varchar(500) NULL DEFAULT NULL,
  standard_cost DECIMAL(19,4) NULL DEFAULT '0.0000',
  list_price DECIMAL(19,4) NOT NULL DEFAULT '0.0000',
  reorder_level integer NULL DEFAULT NULL,
  target_level integer NULL DEFAULT NULL,
  quantity_per_unit VARCHAR(500) NULL DEFAULT NULL,
  discontinued decimal(19,4) NOT NULL DEFAULT '0',
  minimum_reorder_quantity integer NULL DEFAULT NULL,
  category VARCHAR(500) NULL DEFAULT NULL,
  attachments varchar(500) NULL DEFAULT NULL);
CREATE TABLE IF NOT EXISTS northwind.purchase_order_status (
  id integer NOT NULL,
  status VARCHAR(500) NULL DEFAULT NULL);


CREATE TABLE IF NOT EXISTS northwind.suppliers (
  id integer NOT NULL,
  company VARCHAR(500) NULL DEFAULT NULL,
  last_name VARCHAR(500) NULL DEFAULT NULL,
  first_name VARCHAR(500) NULL DEFAULT NULL,
  email_address VARCHAR(500) NULL DEFAULT NULL,
  job_title VARCHAR(500) NULL DEFAULT NULL,
  business_phone VARCHAR(25) NULL DEFAULT NULL,
  home_phone VARCHAR(25) NULL DEFAULT NULL,
  mobile_phone VARCHAR(25) NULL DEFAULT NULL,
  fax_number VARCHAR(25) NULL DEFAULT NULL,
  address varchar(500) NULL DEFAULT NULL,
  city VARCHAR(500) NULL DEFAULT NULL,
  state_province VARCHAR(500) NULL DEFAULT NULL,
  zip_postal_code VARCHAR(15) NULL DEFAULT NULL,
  country_region VARCHAR(500) NULL DEFAULT NULL,
  web_page varchar(500) NULL DEFAULT NULL,
  notes varchar(500) NULL DEFAULT NULL,
  attachments varchar(500) NULL DEFAULT NULL);


CREATE TABLE IF NOT EXISTS northwind.purchase_orders (
  id integer NOT NULL,
  supplier_id integer NULL DEFAULT NULL,
  created_by integer NULL DEFAULT NULL,
  submitted_date timestamp NULL DEFAULT NULL,
  creation_date timestamp NULL DEFAULT NULL,
  status_id integer NULL DEFAULT '0',
  expected_date timestamp NULL DEFAULT NULL,
  shipping_fee DECIMAL(19,4) NOT NULL DEFAULT '0.0000',
  taxes DECIMAL(19,4) NOT NULL DEFAULT '0.0000',
  payment_date timestamp NULL DEFAULT NULL,
  payment_amount DECIMAL(19,4) NULL DEFAULT '0.0000',
  payment_method VARCHAR(500) NULL DEFAULT NULL,
  notes varchar(500) NULL DEFAULT NULL,
  approved_by integer NULL DEFAULT NULL,
  approved_date timestamp NULL DEFAULT NULL,
  submitted_by integer NULL DEFAULT NULL);


CREATE TABLE IF NOT EXISTS northwind.inventory_transactions (
  id integer NOT NULL,
  transaction_type integer NOT NULL,
  transaction_created_date timestamp NULL DEFAULT NULL,
  transaction_modified_date timestamp NULL DEFAULT NULL,
  product_id integer NOT NULL,
  quantity integer NOT NULL,
  purchase_order_id integer NULL DEFAULT NULL,
  customer_order_id integer NULL DEFAULT NULL,
  comments VARCHAR(255) NULL DEFAULT NULL);

CREATE TABLE IF NOT EXISTS northwind.invoices (
  id integer NOT NULL,
  order_id integer NULL DEFAULT NULL,
  invoice_date timestamp NULL DEFAULT NULL,
  due_date timestamp NULL DEFAULT NULL,
  tax DECIMAL(19,4) NULL DEFAULT '0.0000',
  shipping DECIMAL(19,4) NULL DEFAULT '0.0000',
  amount_due DECIMAL(19,4) NULL DEFAULT '0.0000');


CREATE TABLE IF NOT EXISTS northwind.order_details_status (
  id integer NOT NULL,
  status_name VARCHAR(500) NOT NULL);


CREATE TABLE IF NOT EXISTS northwind.order_details (
  id integer NOT NULL,
  order_id integer NOT NULL,
  product_id integer NULL DEFAULT NULL,
  quantity DECIMAL(18,4) NOT NULL DEFAULT '0.0000',
  unit_price DECIMAL(19,4) NULL DEFAULT '0.0000',
  discount decimal(19,4) NOT NULL DEFAULT '0',
  status_id integer NULL DEFAULT NULL,
  date_allocated timestamp NULL DEFAULT NULL,
  purchase_order_id integer NULL DEFAULT NULL,
  inventory_id integer NULL DEFAULT NULL);



CREATE TABLE IF NOT EXISTS northwind.purchase_order_details (
  id integer NOT NULL,
  purchase_order_id integer NOT NULL,
  product_id integer NULL DEFAULT NULL,
  quantity DECIMAL(18,4) NOT NULL,
  unit_cost DECIMAL(19,4) NOT NULL,
  date_received timestamp NULL DEFAULT NULL,
  posted_to_inventory decimal(19,4) NOT NULL DEFAULT '0',
  inventory_id integer NULL DEFAULT NULL);


CREATE TABLE IF NOT EXISTS northwind.sales_reports (
  group_by VARCHAR(500) NOT NULL,
  display VARCHAR(500) NULL DEFAULT NULL,
  title VARCHAR(500) NULL DEFAULT NULL,
  filter_row_source varchar(500) NULL DEFAULT NULL);


CREATE TABLE IF NOT EXISTS northwind.strings (
  string_id integer NOT NULL,
  string_data VARCHAR(255) NULL DEFAULT NULL);