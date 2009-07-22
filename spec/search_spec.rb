require File.dirname(__FILE__) + '/spec_helper'

describe "Searching" do
  it "should not blow up" do
    results = @satisfaction.search.for_likely_matches_to('Cyberdyne')
  end
  
  it "should be a well-formed hash with default keys" do
    results = @satisfaction.search.for_likely_matches_to('Cyberdyne')
    results.should_not be_empty
    results.class.should == Hash
    results.keys.should include('products')
    results.keys.should include('companies')
    #raise results.inspect
  end
  
  it "should put the results into a set of arrays keyed by category" do
    results = @satisfaction.search.for_likely_matches_to('Cyberdyne')
    c = results['companies']
    c.class.should == Array
  end
  
end