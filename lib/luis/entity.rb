module Luis
  # Luis entity class
  class Entity < Base
    attr_accessor :entity, :type, :start_index, :end_index, :score
  end
end
