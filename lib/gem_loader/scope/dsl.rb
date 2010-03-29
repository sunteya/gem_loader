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
      
      def gem(name, *args, &block)
        self.scope.gem(name).parse_args(*args).dsl(&block)
      end
      
      def require(*args)
        self.scope.libs << [ args ].flatten
      end
    end
  end
end
