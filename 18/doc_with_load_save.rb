require '../code/doc3'

class Logger
end

class Document

  class << self
    attr_accessor :load_fail, :save_fail
  end

  def self.load( path )
    raise 'document failed' if @load_fail
    new( path, 'russ', '' )
  end

  def save
    raise 'document failed' if self.class.save_fail
  end
end

