require "whatsnew"
require "json"
require "webmock/rspec"

module OctokitHelpers
  def jollygoodcode_whatsnew
    JSON.parse(
      IO.read("spec/fixtures/github_api/jollygoodcode-whatsnew.json"),
      object_class: OpenStruct
    )
  end

  def octokit_octokitrb
    JSON.parse(
      IO.read("spec/fixtures/github_api/octokit-octokitrb.json"),
      object_class: OpenStruct
    )
  end
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.example_status_persistence_file_path = "spec/examples.txt"
  config.disable_monkey_patching!
  config.warnings = true

  if config.files_to_run.one?
    config.default_formatter = "doc"
  end

  # config.profile_examples = 10

  config.order = :random
  Kernel.srand config.seed

  config.include OctokitHelpers
end

ENV["OAUTH_ACCESS_TOKEN"] = "x"*40
