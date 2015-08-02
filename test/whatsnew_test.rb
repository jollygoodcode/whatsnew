require "test_helper"

class WhatsnewTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil Whatsnew::VERSION
  end
end
