# travel-blog

Blog backend using Grape API + Rails ActiveAdmin to manage content. App is a showcase but live and operating.

## Technology stack

- Ruby 2.5.0
- Rails 5.1.5
- Postgresql 9.*

## Docs

Additional information can be found docs/ directory:
- gems including tips and reasoning: [docs/Gems.md](docs/Gems.md)
- patterns in the project: [docs/Patterns.md](docs/Patterns.md)

## Setup (local/dev)

### 1. Automated

Run:

```bash
bin/setup
```

## Running / Development

```bash
bin/guard
```
This command will run *guard* which will run Rails and listen for changes in the code
* Config changes will restart Rails server
* Gemfile changes will run bundle install
* Changes in tests will run tests
* Changes in code will run corresponding tests if present
* Changes in code will run rubocop that will autofix codestyle issues
* Guardfile changes will restart guard

Guard configuration can be found in Guardfile


## Documentation

API documentation is generated with [grape-swagger](https://github.com/tim-vandecasteele/grape-swagger) gem and is available under ```/swagger```


## Admin Panel

Visit ```/admin/login``` path (replace admin with ACTIVE_ADMIN_NAMESPACE env if set).

Protop: Do not use obvious names for admin path

## Servers / Deployments

Deployment is done by pushing code to appropriate git branch (master for staging / production for production).

