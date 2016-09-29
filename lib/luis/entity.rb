module Luis
  # Luis entity class
  class Entity < Base
    attr_accessor :entity, :type, :startIndex, :endIndex, :score
  end
end
