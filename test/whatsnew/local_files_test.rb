require "test_helper"

class WhatsnewLocalFilesTest < Minitest::Test
  include Whatsnew

  def test_no_news_file_found
    assert_kind_of NoNewsFile, LocalFiles.new("/tmp").to_news_file
  end

  def test_news_file_found
    news_file = LocalFiles.new(".").to_news_file

    assert_kind_of NewsFile, news_file
    assert_equal "CHANGELOG.md", news_file.file_name
    assert_equal \
      "https://github.com/jollygoodcode/whatsnew/blob/master/CHANGELOG.md", news_file.file_url
  end
end
