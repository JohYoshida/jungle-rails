# Jungle

A mini e-commerce application built with Ruby on Rails 4.2, based on Lighthouse Labs' Jungle project. Created for the purpose of learning Rails and working with an existing codebase.


Users can add products to a shopping cart and purchase them using Stripe for transactions. They can register an account in order to leave reviews on products.

Average ratings are displayed on the product index page. Reviews and ratings can be found on individual product pages.

Admins can add new products or product categories to the site.

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example

## Features
View all products, or sort by category, and add products to your shopping cart.
!['View all products or sort by category'](https://github.com/JohYoshida/jungle-rails/blob/master/data/products-index.png?raw=true)

Review individual products, see their information, and reviews left by other users.
!['View product and its reviews'](https://github.com/JohYoshida/jungle-rails/blob/master/data/products-show.png?raw=true)

Purchase products in your shopping cart using Stripe for payments.
!['Purchase products in cart'](https://github.com/JohYoshida/jungle-rails/blob/master/data/my-cart.png?raw=true)

Upon successful purchase, review your order. If you're logged in, you will receive an email with a breakdown of your order.
!['Review your order'](https://github.com/JohYoshida/jungle-rails/blob/master/data/order-confirmation.png?raw=true)

As an admin, add or remove products, and create new categories to arrange them under
!['Add products'](https://github.com/JohYoshida/jungle-rails/blob/master/data/admin-categories.png?raw=true)

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
