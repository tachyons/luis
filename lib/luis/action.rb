module Luis
  class Action < Base
    attr_accessor :triggered, :name, :parameters

    def parameters
      @parameters.map { |parameter| Parameter.new parameter }
    end
  end
end
