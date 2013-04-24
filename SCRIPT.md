# How to build Yet Another Blog in Rails

## Initial setup

Create directory to store your project in.
Execute in a shell:

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

In a shell: `rake db:migrate`
(Observe beautiful but deadly YAML).

Add some fields to the post:

    rails generate migration AddFieldsToPost

Add to the new migration:

    change_table :posts do |table|
      table.string :title, null: false, default: ''
      table.string :body
    end

rake db:migrate

Add attr_accessible to Post:
  
    attr_accessible :title, :body

Then run `rails c` to enter the console.

Create a new post:

    Post.new(title: 'Chunky Bacon', body: 'Bacon is a vegetable')

You should see:

    => #<Post id: nil, created_at: nil, updated_at: nil, title: "Chunky Bacon", body: "Bacon is a vegetable">

Save that to a variable:

   post = _

Persist!

   post.save

Refresh the web browser, you should see an array of a single post object in YAML.
Let's make it a bit prettier.

## Creating posts

Examine routes. Make a link to the posts#new path.
Create a form to accept the post detail.
Add a rudimentary create action:

    def create
      @post = Post.create(params[:post])
      redirect_to posts_path
    end
