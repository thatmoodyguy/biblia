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

end