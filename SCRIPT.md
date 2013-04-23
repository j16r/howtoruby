# How to build Yet Another Blog in Rails

## Initial setup

Create directory
echo 1.9.3-p392 > .ruby-version
echo yab > .ruby-gemsets
gem install rails -v 3.2.13
rails new .
# No need to bundle install
add thin to gemset
add haml to gemset

## Routing and the first controller

Add the following line to config/routes.rb:

    resources :posts

Look at routes using `rake routes`. Should see:

        posts GET    /posts(.:format)          posts#index
              POST   /posts(.:format)          posts#create
     new_post GET    /posts/new(.:format)      posts#new
    edit_post GET    /posts/:id/edit(.:format) posts#edit
         post GET    /posts/:id(.:format)      posts#show
              PUT    /posts/:id(.:format)      posts#update
              DELETE /posts/:id(.:format)      posts#destroy

Add PostsController (optionally use `rails generate controller posts`).

## Models

Add Post.rb in app/models (optionally use `rails generate model Post`).
Load all the posts in the controller:

    @posts = Post.all

Output the posts in the view:

    = debug @posts

rake db:migrate
(Observe beautiful but deadly YAML).



