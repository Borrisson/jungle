# Jungle

A mini e-commerce application built entirely with Rails 4.2 for purposes of learning Rails by example.
[Below are screenshots of the project](#final-product)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe

## Final Product

!["screenshot of products page"](https://github.com/Borrisson/jungle/blob/master/public/images/product_index.png)
_screenshot of main page_
!["screenshot of product details"](https://github.com/Borrisson/jungle/blob/master/public/images/product_details.png)
_screenshot of product details_
!["screenshot of admin products](https://github.com/Borrisson/jungle/blob/master/public/images/admin_products_page.png)
_screenshot of admin products_
!["screenshot of login"](https://github.com/Borrisson/jungle/blob/master/public/images/login_view.png)
_screenshot of login_
