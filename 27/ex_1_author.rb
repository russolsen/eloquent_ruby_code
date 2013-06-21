#!/usr/bin/env ruby

require "rexml/document"

File.open( 'fellowship.xml' ) do |f|
  doc = REXML::Document.new(f) 
  author = REXML::XPath.first(doc, '/document/author') 
  puts author.text
end
