require "biblia/version"
require "httparty"
require 'uri'

module Biblia

  DEFAULT_BIBLIA_API_ROOT = 'http://api.biblia.com/v1/bible'
  DEFAULT_BIBLE_VERSION = 'kjv'

  class << self

    def list_bibles(options = {})
      raise "not configured" unless configured?
      results = HTTParty.get("#{api_root_url}/find?key=#{api_key}")
      return [] unless results["bibles"]
      results["bibles"]
    end

    def lookup(reference, bible_version = self.default_bible_version, options = {})
      raise "not configured" unless configured?
      url = "#{api_root_url}/content/#{bible_version}.txt.json?passage=#{URI.escape(reference)}&key=#{api_key}"
      response = HTTParty.get url
      raise "invalid Bible reference or version" if response.code == 404
      response 
    end

    def version
      VERSION
    end

    def configure(api_key, api_root_url = DEFAULT_BIBLIA_API_ROOT, default_bible_version = DEFAULT_BIBLE_VERSION)
      self.api_key = api_key
      self.api_root_url = api_root_url
      self.default_bible_version = default_bible_version
    end

    def configured?
      !api_key.empty? && !api_root_url.empty?
    end

    # NOTE: Doing the accessors manually rather than using mattr_accessor to avoid an dependency on Rails
    def api_key
      @@api_key
    end

    def api_key=(api_key)
      @@api_key = api_key
    end

    def api_root_url
      @@api_root_url || DEFAULT_BIBLIA_API_ROOT
    end
    
    def api_root_url=(api_root_url)
      @@api_root_url = api_root_url
    end

    def default_bible_version
      @@default_bible_version || DEFAULT_BIBLE_VERSION
    end
    
    def default_bible_version=(bible_version)
      @@default_bible_version = bible_version
    end

  end

end
