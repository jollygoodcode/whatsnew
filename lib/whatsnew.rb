require "whatsnew/version"
require "whatsnew/remote_files"
require "whatsnew/local_files"
require "whatsnew/news_file"
require "whatsnew/no_news_file"
require "whatsnew/project"

module Whatsnew
  # Each resource must respond to message :name and :html.
  def self.about(path_or_resources)
    Whatsnew::Project.new(path_or_resources).news_file
  end
end
