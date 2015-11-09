require "thor"
require "whatsnew"

module Whatsnew
  class CLI < Thor
    desc "version", "Show Whatsnew version."
    def version
      say Whatsnew::VERSION
    end
    map %w(-v --version) => :version

    desc "about", "Find changelog / releases of a given path or repo on GitHub. If none argument is given, look for current path's changelog."
    option :access_token, type: :string, aliases: "-a"
    def about(path_or_repo = nil)
      news = Whatsnew.about path_or_repo, options[:access_token]

      if news.is_a? Whatsnew::NoNewsFile
        say_in_green "Not found. This project should keep a changelog."
        say_in_green "Please see http://keepachangelog.com."
      else
        say_in_green news.read
      end
    end

    private

      def say_in_green(content)
        say content, :green
      end
  end
end
