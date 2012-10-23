require File.expand_path('../../../test_helper.rb', __FILE__)

describe Biblia do
  
  it "must have a defined VERSION constant" do
    Biblia::VERSION.wont_be_nil
  end

  it "must expose a version property" do
    Biblia.version.wont_be_nil
  end

end