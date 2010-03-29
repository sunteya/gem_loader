module GemLoader
  class Scope
    
    def dsl(&block)
      Dsl.new(self, &block)
    end
    
    class Dsl
      attr_accessor :scope
      
      def initialize(scope, &block)
        self.scope = scope
        instance_eval(&block) if block
      end
      
      def gem(*args, &block)
        options = args.pop if args.last.is_a?(Hash)
        name, version = *args
        
        self.scope.gem(name, version, options).dsl(&block)
      end
      
      def require(*args)
        self.scope.libs << [ args ].flatten
      end
    end
  end
end
