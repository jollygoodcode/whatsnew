require "test_helper"
require "open3"

class WhatsnewBinTest < Minitest::Test
  def test_work_via_commandline
    root = File.expand_path "..", File.dirname(__FILE__)
    stdout, stderr, status = Open3.capture3("#{root}/bin/whatsnew")

    assert \
      stdout.include?("What's New:"),
      "expected #{stdout} to include `What's New:'"
    assert \
      stdout.include?(
        "See CHANGELOG.md: https://github.com/jollygoodcode/whatsnew/blob/master/CHANGELOG.md."
      ),
      "expected #{stdout} to include `CHANGELOG.md:'"
    assert_empty stderr
    assert_equal 0, status
  end
end
