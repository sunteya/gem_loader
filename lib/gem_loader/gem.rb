module GemLoader
  class Gem
    attr_accessor :name, :version, :options, :requires
    
    def initialize(name, version = nil, options = {})
      self.name = name.to_s
      self.version = version
      self.options = options || {}
    end
    
    def load
      if self.version
        Kernel.send :gem, self.name, self.version
      else
        Kernel.send :gem, self.name
      end
    end
    
    def require
      if self.options.include?(:require)
        [ self.options[:require] ].flatten.compact.each do |lib|
          Kernel.send :require, lib.to_s
        end
      else
        Kernel.send :require, self.name
      end
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
    end
  end
end