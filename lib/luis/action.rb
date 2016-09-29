module Luis
  # Luis action class
  class Action < Base
    attr_accessor :triggered, :name, :parameters

    # @return [Array]  parameters in the action
    def parameters
      @parameters.map { |parameter| Parameter.new parameter }
    end
  end
end
