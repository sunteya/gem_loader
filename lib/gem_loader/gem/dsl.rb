module GemLoader
  class Gem
    
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