require File.expand_path('../../../test_helper.rb', __FILE__)
TEST_API_KEY = '693a62f6a480c5e6c518eecdd55f2d31'

describe Biblia do
  
  subject { Biblia }

  describe "listing available Bibles" do

    it "must list all Bibles when no options are passed in and the API key has been set" do
      Biblia.configure TEST_API_KEY
      Biblia.list_bibles({}).size.wont_equal 0
    end
    
    it "must return an error when no API key is passed in and one is not pre-set" do
      Biblia.configure ''
      Proc.new { Biblia.list_bibles({}) }.must_raise(RuntimeError)
    end

  end

  describe "looking up a Bible passage" do
    #note: the KJV of John 3:16 uses the word "everlasting" while the ASV uses "eternal", so it's a good testbed
    it "must return KJV if no Bible passage pre-set and none passed in" do
      Biblia.configure TEST_API_KEY
      results = Biblia.lookup('john 3:16')
      results['text'].must_include 'everlasting'
    end

    it "must return the preset Bible version if no version passed in" do
      Biblia.configure TEST_API_KEY
      Biblia.default_bible_version = 'asv'
      results = Biblia.lookup('john 3:16')
      results['text'].must_include 'eternal'
    end

    it "must return the Bible in the passed-in version" do
      Biblia.configure TEST_API_KEY
      Biblia.default_bible_version = 'kjv'
      results = Biblia.lookup('john 3:16', 'asv')
      results['text'].must_include 'eternal'
    end

    it "must error if an invalid reference is passed" do
      Biblia.configure TEST_API_KEY
      Proc.new { Biblia.lookup('john 35:72') }.must_raise(RuntimeError)  #invalid: John only has 21 chapters
    
    end

    it "must error if an invalid Bible version is passed" do
      Biblia.configure TEST_API_KEY
      Proc.new { Biblia.lookup('john 3:16', 'fakebibleversion') }.must_raise(RuntimeError)  
    end


    it "must error if an API key has not been set" do
      Biblia.configure ''
      Proc.new { Biblia.lookup('john 3:16') }.must_raise(RuntimeError)
    end
  end

end