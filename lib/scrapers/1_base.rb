module Scrapers

  ROOT_URL = 'http://www.nimal.ru'.freeze
  DOLLAR_RATE = 0.0275.freeze

  class Base

    def self.mechanize
      @mechanize ||= Mechanize.new do |agent|
        agent.user_agent_alias = 'Linux Firefox'
      end
    end

  end

end

