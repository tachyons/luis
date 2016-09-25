module Luis
  class Intent < Base
    attr_accessor :intent, :score, :actions

    def actions
      @actions.map { |action| Action.new action }
    end
  end
end
