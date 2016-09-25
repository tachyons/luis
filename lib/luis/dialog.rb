module Luis
  class Dialog < Base
    attr_accessor :prompt, :parameterName, :parameterType, :contentId, :status

    def finished?
      status == 'Finished'
    end

    def question?
      status == 'Question'
    end
  end
end
