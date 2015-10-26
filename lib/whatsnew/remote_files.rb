module Whatsnew
  class RemoteFiles
    def initialize(resources)
      @resources = resources
    end

    def to_news_file
      if contents = find_news
        NewsFile.new(contents)
      elsif release = find_release
        ReleaseFile.new(release)
      else
        NoNewsFile.new
      end
    end

    private

      attr_reader :resources

      def find_news
        resources.find do |resource|
          resource.name =~ %r{(CHANGE|CHANGES|CHANGELOG|NEWS|HISTORY)}i.freeze
        end
      end

      def find_release
        resources.find { |release| release.respond_to?(:body) && !release.body.empty? }
      end
  end
end
