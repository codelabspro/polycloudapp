'''polycloudapp

Cloud services using Ruby on Rails


'''Directory structure
.
├── Gemfile
├── Gemfile.lock
├── README.rdoc
├── Rakefile
├── app
│   ├── assets
│   │   ├── images
│   │   ├── javascripts
│   │   │   └── application.js
│   │   └── stylesheets
│   │       └── application.css
│   ├── controllers
│   │   ├── application_controller.rb (Must be subclassed for our controllers)
│   │   └── concerns
│   ├── helpers
│   │   └── application_helper.rb (View helpers)
│   ├── mailers (Send out mailers)
│   ├── models (Contains models)
│   │   └── concerns (Concerns are shared behavior between models)
│   └── views
│       └── layouts
│           └── application.html.erb (Default template layout)
├── bin (Commands that are specific to our application)
│   ├── bundle
│   ├── rails
│   ├── rake
│   ├── setup
│   └── spring
├── config
│   ├── application.rb (Global settings in our application)
│   ├── boot.rb
│   ├── database.yml (Database configuration for each application)
│   ├── environment.rb
│   ├── environments
│   │   ├── development.rb
│   │   ├── production.rb
│   │   └── test.rb
│   ├── initializers
│   │   ├── assets.rb
│   │   ├── backtrace_silencers.rb
│   │   ├── cookies_serializer.rb
│   │   ├── filter_parameter_logging.rb
│   │   ├── inflections.rb
│   │   ├── mime_types.rb
│   │   ├── session_store.rb
│   │   └── wrap_parameters.rb
│   ├── locales
│   │   └── en.yml
│   ├── routes.rb (Where our different routes are pointed to)
│   └── secrets.yml
├── config.ru
├── db
│   └── seeds.rb
├── lib (Different library code for our application)
│   ├── assets
│   └── tasks (rake tasks which work with our application)
├── log (Contains logs to our application)
├── public
│   ├── 404.html
│   ├── 422.html
│   ├── 500.html
│   ├── favicon.ico
│   └── robots.txt
├── test (Use rspec for testing)
│   ├── controllers
│   ├── fixtures
│   ├── helpers
│   ├── integration
│   ├── mailers
│   ├── models
│   └── test_helper.rb
├── tmp
│   └── cache
│       └── assets
└── vendor
 └── assets
     ├── javascripts
     └── stylesheets

'''Steps for creating this app

 - rails new polycloudapp

 - bin/rails server to run the app
