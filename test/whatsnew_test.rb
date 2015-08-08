require "test_helper"

class WhatsnewTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil Whatsnew::VERSION
  end

  def test_about_should_return_a_news_file_like_object
    path_with_newsfile = Dir.pwd
    path_without_newsfile = "/tmp"

    assert_kind_of Whatsnew::NewsFile, Whatsnew.about(path_with_newsfile)
    assert_kind_of Whatsnew::NoNewsFile, Whatsnew.about(path_without_newsfile)
  end
end
