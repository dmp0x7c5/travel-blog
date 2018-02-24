# Gems

Here are some tips and code samples for gems used in the project.

## ActiveAdmin

### Admin comments

By default active admin setup script will generate default config and migration for admin comments. Usually you don't need comments included so remove comments migration and turn off in the initializer. Leave them only if you really want to use them.

In `config/initializers/active_admin.rb`: 
```ruby
config.comments = false
```

In a few legacy projects I've seen active_admin_comments table but always turned off in the intializer, so remember to keep your schema clean if you don't use them.

### Change of default namespace

It's common to use `/admin` but it can be easily customized. I found it really useful to set default path using ENV variables so the real one is not exposed in the code.

In `config/initializers/active_admin.rb`: 
```ruby
config.default_namespace = Rails.application.secrets.active_admin_namespace

```

In `config/secrets.yml`:
```yaml
default: &default
  active_admin_namespace: <%= ENV["ACTIVE_ADMIN_NAMESPACE"] || "admin" %>
```

