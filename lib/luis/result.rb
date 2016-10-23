module Luis
  # Luis result class
  class Result < Base
    attr_accessor :query, :intents, :entities, :dialog, :top_scoring_intent

    # Intent with maximum score
    # @return intent with maximum score
    def top_scoring_intent
      Intent.new(@top_scoring_intent) || @intents.first
    end

    # List of intents
    def intents
      (@intents ||= [@topScoringIntent]).map do |intent|
        Intent.new intent
      end
    end

    # Dialog object
    def dialog
      return false unless @dialog
      Dialog.new @dialog
    end

    # List of entities
    def entities
      @entities.map { |entity| Entity.new entity }
    end

    # Entitities with specific type
    def entities_of_type(type)
      @entities.select {|entity| entity['type'] == type }.map {|entity| Entity.new entity}
    end

    # Weather dialog is waiting for a response
    def awaiting_dialog_response?
      dialog && dialog.question?
    end

    # Reply to dialog is dialog is waiting for a response
    def reply(query)
      return false unless awaiting_dialog_response?
      dialog.reply(query)
    end
  end
end
