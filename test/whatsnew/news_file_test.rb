require "test_helper"

class WhatsnewNewsFileTest < Minitest::Test
  include Whatsnew

  def setup
    @news_file =
      NewsFile.new(
        "./CHANGELOG.md",
        "https://github.com/jollygoodcode/whatsnew"
      )
  end

  def test_file_name
    assert_equal "CHANGELOG.md", @news_file.file_name
  end

  def test_file_url
    assert_equal \
      "https://github.com/jollygoodcode/whatsnew/blob/master/CHANGELOG.md",
      @news_file.file_url
  end

  def test_content_when_project_uri_found
    assert_equal \
      "What's New:\nSee CHANGELOG.md: https://github.com/jollygoodcode/whatsnew/blob/master/CHANGELOG.md.",
      @news_file.content
  end
end
