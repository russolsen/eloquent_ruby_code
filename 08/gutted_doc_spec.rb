require 'pp'
require "#{File.dirname(__FILE__)}/gutted_doc"

describe Document do
  it "should be a class" do
    Document.class.should == Class
    doc = Document.new
  end
end

describe LazyDocument do
  it "should be a class" do
    LazyDocument.class.should === Class
    doc = LazyDocument.new
  end
end
