module Luis
  # Luis dialog class
  class Dialog < Base
    attr_accessor :prompt, :parameter_name, :parameter_type, :context_id, :status

    # @return whether the dialog is finished
    def finished?
      status == 'Finished'
    end

    # @return whether the dialog is question
    def question?
      status == 'Question'
    end

    # Reply to dialog
    # @param reply message
    def reply(query)
      Luis.query(query, contextId)
    end
  end
end
