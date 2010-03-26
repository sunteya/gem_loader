module GemLoader
  class Scope
    
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
