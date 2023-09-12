# README
This is a boilerplate for new rails app using:
- Rails 7
- Esbuild for compile assets
- Rspec for unit test
- Rubopcop for check styleguide
- Dotenv for manage env variable
- Sidekiq for background job
- Active storage for image upload & image processing
- Capistrano for deployment
- Github CI for CI/CD
- Tabler for admin interface
- Up to date ...
## Get Started
### Environments
- Ruby 3.1.2
- Rails 7.0.4
- Node 16.x or higher
- Postgresql 14.5
- Redis

### Setup project
```bash
# Clone project
git clone git@github.com:vinhmai570/rails_boilerplate.git

# Build images docker & run project
docker-compose up -d --build
```

### Admins scaffold
You can run command follow this pattern to generate admin scaffold
```bash
bin/rails generate admins:scaffold model field:type field:type
```
Example
```
bin/rails generate admins:scaffold posts title:string body:text published:boolean
```

### Debugging
This project using default debugger of Rails 7 - Ruby debug (https://github.com/ruby/debug) 
with foreman.
When run project we run server with command in docker 
```bash
rdbg -O -n -c -- bin/rails server -p 3000 -b 0.0.0.0
```
So if we want to debugging, we will exec to docker container and run command debug follow:
```bash
# exec to docker container app
docker-compose exec app bash

# run rdbg for watching debug breakpoint
rdbg -A
# then type 'c' to continue breakpoint in debugger
# we can run 'h' to get all command of ruby debug
```
