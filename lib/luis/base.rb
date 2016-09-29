module Luis
  # Baseclass for luis objects
  class Base
    # Constructor to set options specified as instance variables
    #
    # @param [Hash] options hash
    def initialize(options = {})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end
  end
end
