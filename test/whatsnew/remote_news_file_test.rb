require "test_helper"
require "dish"
require "json"

class WhatsnewRemoteNewsFileTest < Minitest::Test
  include Whatsnew

  def setup
    @news_file =
      RemoteNewsFile.new(
        Dish(JSON.parse(IO.read("test/fixtures/github_api/contents/seattlerb-minitest.json"))))
  end

  def test_file_name
    assert_equal "History.rdoc", @news_file.file_name
  end

  def test_file_url
    assert_equal \
      "https://github.com/seattlerb/minitest/blob/master/History.rdoc",
      @news_file.file_url
  end

  def test_content_when_project_uri_found
    assert_equal \
      "What's New:\nSee History.rdoc: https://github.com/seattlerb/minitest/blob/master/History.rdoc.",
      @news_file.content
  end
end
