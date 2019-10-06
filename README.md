Rales Engine API
================
* Rales Engine is a REST API built with a large database consisting of:
  :merchants, :customers, :invoices, :items, :invoice_items, and :transactions.

* Rales Engine includes 33 restful endpoints that return table data, business logic, and nested resource data.

### Setup
* Clone this repository and open the directory within terminal. 
* run bundle from with the project directory to install all project gems
* run rake db:{create, migrate} to create database and migrate all tables 
* run bundle exec rake import to seed the database with the CSV files.

## API Calls
Run a localhost server with `rails server` from with the project directory.

The base path for making any api request is `/api/v1`

## Example API Calls
`api/v1/merchants`
* returns all merchants from database

## Record Endpoints 
`/api/v1/merchants`
`/api/v1/merchants/:id`

`/api/v1/customers`
`/api/v1/customers/:id`

`/api/v1/items`
`/api/v1/items/:id`

`/api/v1/invoices`
`/api/v1/invoices/:id`

`/api/v1/invoice_items`
`/api/v1/invoice_items/:id`

`/api/v1/transactions`
`/api/v1/transactions/:id`

## Relationship Endpoints
`/api/v1/merchants/:id/items`
`/api/v1/merchants/:id/invoices`

`/api/v1/invoices/:id/transactions`
`/api/v1/invoices/:id/invoice_items`
`/api/v1/invoices/:id/items`
`/api/v1/invoices/:id/customer`
`/api/v1/invoices/:id/merchant`

`/api/v1/invoice_items/:id/invoice`
`/api/v1/invoice_items/:id/item`

`/api/v1/items/:id/invoice_items`
`/api/v1/items/:id/merchant`

`/api/v1/transactions/:id/invoice`

`/api/v1/customers/:id/invoices`
`/api/v1/customers/:id/transactions`

## Business Intelligence Endpoints 
`/api/v1/merchants/most_revenue?quantity=x`
`/api/v1/merchants/revenue?date=x`
`/api/v1/merchants/:id/favorite_customer`

`/api/v1/items/most_revenue?quantity=x`
`/api/v1/items/:id/best_day`

`/api/v1/customers/:id/favorite_merchant`
