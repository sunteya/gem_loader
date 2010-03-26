module GemLoader
  class Base
    
    def dsl(&block)
      Dsl.new(self, &block)
    end
    
    class Dsl
      attr_accessor :parent
      
      def initialize(parent, &block)
        self.parent = parent
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
        
        dep_scopes = dep_names.map{ |dep_name| self.parent.scope(dep_name) }
        self.parent.scope(name, dep_scopes).dsl(&block)
      end
    end
  end
end