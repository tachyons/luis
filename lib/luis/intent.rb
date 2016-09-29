module Luis
  # Luis intent class
  class Intent < Base
    attr_accessor :intent, :score, :actions

    # Action list of the intent
    # @return [Array] list of actions
    def actions
      @actions.map { |action| Action.new action }
    end
  end
end
