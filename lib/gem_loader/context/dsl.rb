module GemLoader
  class Context
    
    def setup(&block)
      self.dsl(&block)
    end
    
    def dsl(&block)
      Dsl.new(self, &block)
    end
    
    class Dsl
      attr_accessor :base
      
      def initialize(base, &block)
        self.base = base
        instance_eval(&block) if block
      end
      
      def scope(arg, &block)
        case arg
        when Hash
          name = arg.keys.first
          dep_names = [ arg[name] ].flatten
        else
          name = arg
          dep_names = []
        end
        
        dep_scopes = dep_names.map{ |dep_name| self.base.scope(dep_name) }
        self.base.scope(name, dep_scopes).dsl(&block)
      end
    end
  end
end