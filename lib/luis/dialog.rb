module Luis
  class Dialog < Base
    attr_accessor :prompt, :parameterName, :parameterType, :contextId, :status

    def finished?
      status == 'Finished'
    end

    def question?
      status == 'Question'
    end

    def reply(query)
      Luis.query(query, contextId)
    end
  end
end
