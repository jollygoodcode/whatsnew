require "test_helper"

class WhatsnewProjectTest < Minitest::Test
  include Whatsnew

  def setup
    @project = Project.new(".")
  end

  def test_news_file
    assert_kind_of NewsFile, @project.news_file
  end

  def test_project_uri_when_matched
    assert_equal \
      "https://github.com/jollygoodcode/whatsnew",
      @project.project_uri
  end

  def test_project_uri_when_not_a_git_repository
    not_git_repository = Project.new("/tmp")

    assert_equal "NOT FOUND", not_git_repository.project_uri
  end
end
