module GemLoader
  class Context
    
    def setup(&block)
      self.dsl(&block)
    end
    
    def dsl(&block)
      Dsl.new(self, &block)
    end
    
    class Dsl
      attr_accessor :context
      
      def initialize(context, &block)
        self.context = context
        instance_eval(&block) if block
      end
      
      def scope(arg, &block)
        if arg.is_a?(Hash)
          name = arg.keys.first
          depend_scope_names = [ arg[name] ].flatten
        else
          name = arg
          depend_scope_names = []
        end
        
        scope = self.context.scope(name)
        depend_scope_names.each do |name|
          scope.add_depend_scope(self.context.scope(name))
        end
        
        scope.dsl(&block)
      end
    end
  end
end