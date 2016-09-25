module Luis
  class Response
    attr_accessor :query, :intents, :entities, :dialog
    def initialize(options = {})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def intent
      intents.first
    end
  end
end
