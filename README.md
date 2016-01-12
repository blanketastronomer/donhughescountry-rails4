# README

## Don Hughes Country

This is a re-write from the ground up of country singer [Don Hughes](http://donhughescountry.com)' website in Rails 4.

### Compatibility

Currently, this project is only compatible with:

* Ruby 2.2.2
* Rails 4.2.1+

### System dependencies

#### Local server

To run this project locally, you'll need one of the following installed on your system:

* Heroku Toolbelt
* Foreman

##### Running with Heroku Toolbelt

To run with Heroku Toolbelt, simply run ```heroku local``` in the project root.

### Configuration

This project requires a couple of environment variables in order to work in development, testing, and production environments.

#### Setting local environment variables

Setting the local environment variables needed for the project to run is simple.  For now, just create a file called
```.env``` and add ```SECRET_KEY_BASE=[YOUR_SECRET_KEY_BASE]``` and
```TEST_SECRET_KEY_BASE=[YOUR_TEST_SECRET_KEY_BASE]``` to it.

#### Setting production environment variables

For now, you'll just have to add them manually.  Please refer to the documentation for your production server.

### Database

As of right now, this app has no database.  That may change in the future.

#### Creation

This will only be an issue when this app gets a database.

#### Initialization

This will only be an issue when this app gets a database.

### Testing

Testing is pretty straightforward.  UI testing is done by humans.  Automated testing can be run with ```rake test```.

### Services

There's no other services running at the moment.  If there ever are, their setup and use will be documented here.

### Deploying

For now, this project has yet to be deployed.  When it gets onto a service, I'll put the deploy instructions here.
