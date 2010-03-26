module GemLoader
  class Base
    attr_accessor :scopes
    
    def initialize
      self.scopes = {}
    end
    
    def scope(name)
      self.scopes ||= {}
      self.scopes[name] ||= Scope.new(name)
    end
    
    def setup(&block)
      Dsl.new(self, &block)
    end
    
    def load(*args)
      scope_names = [ args ].flatten
      scope_names.each do |scope_name|
        self.scope(scope_name).load
      end
    end
    
    def require(*args)
      scope_names = [ args ].flatten
      self.load(scope_names)
      
      scope_names.each do |scope_name|
        self.scope(scope_name).require
      end
    end
    
    class Dsl
      attr_accessor :parent
      
      def initialize(parent, &block)
        self.parent = parent
        instance_eval(&block) if block
      end
      
      def scope(name, &block)
        self.parent.scope(name).dsl(&block)
      end
    end
  end
end