require "whatsnew/version"
require "whatsnew/remote_news_file"
require "whatsnew/news_file"
require "whatsnew/no_news_file"
require "whatsnew/project"

module Whatsnew
  def self.about(path)
    Whatsnew::Project.new(path).news_file
  end
end
