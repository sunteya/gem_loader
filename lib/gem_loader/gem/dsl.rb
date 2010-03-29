module GemLoader
  class Gem
    
    def dsl(&block)
      Dsl.new(self, &block)
    end
    
    class Dsl
      attr_accessor :gem

      def initialize(gem, &block)
        self.gem = gem
        instance_eval(&block) if block
      end
    end
  end
end