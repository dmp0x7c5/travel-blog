# frozen_string_literal: true

require "simplecov"

SimpleCov.profiles.define "travel-blog" do
  load_profile "rails"
  add_filter "app/admin"

  add_filter "app/controllers/application_controller.rb"
  add_filter "app/jobs/application_job.rb"
  add_filter "app/mailers/application_mailer.rb"
  add_filter "app/policies/application_policy.rb"
end
SimpleCov.start "travel-blog"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
