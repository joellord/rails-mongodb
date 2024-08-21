# Rails template for MongoDB

This simple template includes everything you need to run Rails with MongoDB. It includes examples for basic document fetches, as well as a form to add new entries.

Find out more in the article in the [MongoDB Dev Center](https://mdb.link/rails).

## Requirements

You will need a MongoDB cluster ready to go with some sample data. The easiest way to get started is with an Atlas free cluster.

* Create your free Atlas cluster ([tutorial](https://www.mongodb.com/docs/atlas/tutorial/deploy-free-tier-cluster/?utm_campaign=devrel&utm_source=cross-post&utm_source=tools&utm_medium=readme&utm_content=rails-template&utm_term=joel.lord))
* Load the sample dataset ([docs](https://www.mongodb.com/docs/atlas/sample-data/?utm_campaign=devrel&utm_source=cross-post&utm_source=tools&utm_medium=readme&utm_content=rails-template&utm_term=joel.lord))

## Getting started


Create a new Rails application using this template. You can change the name of the project by replacing `rails-mongodb` with the name of your project.

```
rails new rails-mongodb -m https://raw.githubusercontent.com/joellord/rails-mongodb/main/template.rb --skip-active-record
```

When prompted, enter the connection string to your MongoDB cluster. You can find this connection string in the Atlas UI.

Start the Rails server:

```
cd rails-mongodb
rails s
```

Open your browser on [http://localhost:3000](http://localhost:3000), and start exploring your new application.
