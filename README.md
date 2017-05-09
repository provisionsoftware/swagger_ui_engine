# SwaggerUiEngine

Include [swagger-ui](https://github.com/swagger-api/swagger-ui) as Rails engine and document your API with simple YAML files. Supports API documentation versioning.

[![Gem Version](https://badge.fury.io/rb/swagger_ui_engine.svg)](https://badge.fury.io/rb/swagger_ui_engine) [![Build Status](https://travis-ci.org/ZuzannaSt/swagger_ui_engine.svg?branch=master)](https://travis-ci.org/ZuzannaSt/swagger_ui_engine) [![Code Climate](https://codeclimate.com/github/ZuzannaSt/swagger_ui_engine/badges/gpa.svg)](https://codeclimate.com/github/ZuzannaSt/swagger_ui_engine)

## Versions

Swagger UI version | Rails version
------------------ | ----------------
2.2.10             | >= 5.0.0

## Problem

Working on a Rails API, I've wanted to document my endpoints in the clearest and easiest way possible. My goal was to have the documentation separated from the actual code base and to have a web UI version of Swagger for testing and reading it. Using Rails 5 default API, I didn't need to include Grape, so I took a look into some other existing solutions. Most of them were no longer supported (e.g. [swagger_engine](https://github.com/batdevis/swagger_engine) and [swagger-ui_rails](https://github.com/d4be4st/swagger-ui_rails)) or required adding some extra code for the actual documentation (e.g. [swagger-docs](https://github.com/richhollis/swagger-docs)). Also, none of them supported Swagger web UI configuration, so I decided to write and maintain a gem on my own that would allow others to include Swagger web UI as Rails engine and support writing simple documentation in YAML files.

## Installation

Add to Gemfile

```
gem 'swagger_ui_engine'
```

And then run:

```
$ bundle
```

## Usage

### Mount

Add to your `config/routes.rb`

```
mount SwaggerUiEngine::Engine, at: "/api_docs"
```

You can place this route under `admin_constraint` or other restricted path, or configure basic HTTP authentication.

#### Basic HTTP auth

Set admin username and password in an initializer:

```
# config/initializers/swagger_ui_engine.rb

SwaggerUiEngine.configure do |config|
  config.admin_username = ENV['ADMIN_USERNAME']
  config.admin_password = ENV['ADMIN_PASSWORD']
end
```

### Initialize

#### Versioned API documentations

Set the path of your json/yaml versioned documentations in an initializer:

```
# config/initializers/swagger_ui_engine.rb

SwaggerUiEngine.configure do |config|
  config.swagger_url = {
    v1: 'api/v1/swagger.yaml',
    v2: 'api/v2/swagger.yaml',
  }
end
```

and place your main documentation file under `/public/api` path.

#### Single API documentation

You can define your main documentation url in a hash value (same way as in the versioned documentations) or pass single string with the url:

```
# config/initializers/swagger_ui_engine.rb

SwaggerUiEngine.configure do |config|
  config.swagger_url = 'api/v1/swagger.yaml'
end
```

This is a compatibility patch for the `SwaggerUiEngine` gem versions `<= 0.0.5`

### Configure
Config Name | Swagger parameter name | Description
--- | --- | ---
config.swagger_url | url | The url pointing `swagger.yaml` (Swagger 2.0) as per [OpenAPI Spec](https://github.com/OAI/OpenAPI-Specification/). This params requires hash value - pass your API doc version name as a key and it's main documentation url as a value.
config.doc_expansion | docExpansion | Controls how the API listing is displayed. It can be set to 'none' (default), 'list' (shows operations for each resource), or 'full' (fully expanded: shows operations and their details).
config.model_rendering | defaultModelRendering | Controls how models are shown when the API is first rendered. It can be set to 'model' or 'schema', and the default is 'schema'.
config.request_headers | showRequestHeaders | Whether or not to show the headers that were sent when making a request via the 'Try it out!' option. Defaults to `false`.
config.json_editor | jsonEditor | Enables a graphical view for editing complex bodies.  Defaults to `false`.
config.validator_enabled | validatorUrl | Enables documentation validator.  Defaults to `false` (`validatorUrl: 'null'`).

### Edit your json/yaml files

You can use [Swagger editor](https://github.com/swagger-api/swagger-editor) to write and validate your Swagger docs.

## Example app

Here's an example use of [SwaggerUiEngine in Rails application](https://github.com/ZuzannaSt/swagger_ui_engine_example).

## License

This project is available under MIT-LICENSE. :sunny:
