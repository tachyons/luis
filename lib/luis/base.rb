module Luis
  # Baseclass for luis objects
  class Base
    # Constructor to set options specified as instance variables
    #
    # @param [Hash] options hash
    def initialize(options = {})
      options.each do |key, value|
        instance_variable_set("@#{snake_case(key)}", value)
      end
    end

    private

    def snake_case(string)
      return string.downcase if string =~ /\A[A-Z]+\z/
      string.gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
            .gsub(/([a-z])([A-Z])/, '\1_\2')
            .downcase
    end
  end
end
