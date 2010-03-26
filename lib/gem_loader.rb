require File.expand_path("../gem_loader/base", __FILE__)


module GemLoader
  
  def self.instance
    @instance ||= Base.new
  end
  
  def self.method_missing(sym, *args, &block)
    self.instance.send(sym, *args, &block)
  end
end