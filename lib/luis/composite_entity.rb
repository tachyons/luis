module Luis
  # Luis composite entity class
  #
  class CompositeEntity < Base
    attr_accessor :parent_type, :value, :children

    # @return [Array] list of child entities
    def children
      @children.map { |child| CompositeEntityChild.new child }
    end
  end
end
