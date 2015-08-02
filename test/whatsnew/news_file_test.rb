require "test_helper"

class WhatsnewNewsFileTest < Minitest::Test
  include Whatsnew

  def test_content_when_project_uri_found
    news_file =
      NewsFile.new(
        "./CHANGELOG.md",
        "https://github.com/jollygoodcode/whatsnew"
      )

    assert_equal \
      "What's New:\nSee CHANGELOG.md: https://github.com/jollygoodcode/whatsnew/blob/master/CHANGELOG.md.",
      news_file.content
  end
end
