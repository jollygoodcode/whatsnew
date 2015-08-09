require "test_helper"

class WhatsnewNoNewsFileTest < Minitest::Test
  include Whatsnew

  def setup
    @no_news_file = NoNewsFile.new
  end

  def test_no_news_file
    assert_respond_to @no_news_file, :file_url
    assert_respond_to @no_news_file, :read
    assert_respond_to @no_news_file, :file_name
  end
end
