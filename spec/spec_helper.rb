require "whatsnew"
require "dish"
require "json"

module OctokitHelpers
  def sawyer_contents
    Dish(
      JSON.parse(IO.read("spec/fixtures/github_api/contents/seattlerb-minitest.json"))
    )
  end

  def sawyer_releases
    Dish(
      JSON.parse(IO.read("spec/fixtures/github_api/releases/benbalter-licensee.json"))
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
    config.default_formatter = 'doc'
  end

  # config.profile_examples = 10

  config.order = :random
  Kernel.srand config.seed

  config.include OctokitHelpers
end
