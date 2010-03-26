module GemLoader
  class Scope
    attr_accessor :name, :gems, :libs
    
    def initialize(name)
      self.name = name
      self.gems = []
      self.libs = []
    end
    
    def load
      self.gems.each do |gem|
        gem.load
      end
    end
    
    def require
      self.gems.each do |gem|
        gem.require
      end
      
      self.libs.flatten.each do |lib|
        Kernel.send :require, lib.to_s
      end
    end
    
    def gem(name, version, options)
      (self.gems ||= []) << Gem.new(name, version, options)
      self.gems.last
    end
    
    def dsl(&block)
      Dsl.new(self, &block)
    end
    
    class Dsl
      attr_accessor :parent
      
      def initialize(parent, &block)
        self.parent = parent
        instance_eval(&block) if block
      end
      
      def gem(*args, &block)
        options = args.pop if args.last.is_a?(Hash)
        name, version = *args
        
        self.parent.gem(name, version, options).dsl(&block)
      end
      
      def require(*args)
        self.parent.libs << [ args ].flatten
      end
    end
  end
end
