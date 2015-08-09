require "test_helper"

class WhatsnewNewsFileTest < Minitest::Test
  include Whatsnew

  def setup
    @news_file =
      NewsFile.new(
        "CHANGELOG.md",
        file_url: "https://github.com/jollygoodcode/whatsnew/blob/master/CHANGELOG.md"
      )
  end

  def test_file_url
    assert_equal \
      "https://github.com/jollygoodcode/whatsnew/blob/master/CHANGELOG.md",
      @news_file.file_url
  end

  def test_read
    assert_equal \
      "What's New:\nSee CHANGELOG.md: https://github.com/jollygoodcode/whatsnew/blob/master/CHANGELOG.md.",
      @news_file.read
  end
end
