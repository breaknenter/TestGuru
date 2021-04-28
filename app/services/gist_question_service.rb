class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @test     = @question.test
    @client   = client || Octokit::Client.new(access_token: Rails.application.credentials.github[:api_token])
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.last_response.status.to_i.between?(200, 209)
  end

  private

  def gist_params
    {
      description: I18n.t(".gist.title", title: @test.title),
      public: true,
      files: {
        "test-guru-question-#{@question.id}.txt" => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.text]
    content += @question.answers.pluck(:text)
    content.join("\n")
  end
end
