require "test_helper"
require "dish"
require "json"

class WhatsnewRemoteFilesTest < Minitest::Test
  include Whatsnew

  def test_no_news_file_found
    assert_kind_of NoNewsFile, LocalFiles.new("/tmp").to_news_file
  end

  def test_news_file_found_from_octokit
    news_file = RemoteFiles.new(sawyer_resources).to_news_file

    assert_kind_of NewsFile, news_file
    assert_equal "History.rdoc", news_file.file_name
    assert_equal \
      "https://github.com/seattlerb/minitest/blob/master/History.rdoc", news_file.file_url
  end

  def test_news_file_found_from_any_resource_like_objects
    news_file = RemoteFiles.new(resources).to_news_file

    assert_kind_of NewsFile, news_file
    assert_equal "NEWS", news_file.file_name
    assert_equal \
      "https://github.com/ruby/ruby/blob/trunk/NEWS", news_file.file_url
  end

  def sawyer_resources
    Dish(
      JSON.parse(IO.read("test/fixtures/github_api/contents/seattlerb-minitest.json"))
    )
  end

  Resource = Struct.new(:name, :html_url)
  def resources
    [Resource.new("NEWS", "https://github.com/ruby/ruby/blob/trunk/NEWS")]
  end
end
