class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]

  def show
  end

  def result
    if @test_passage.success? && @test_passage.in_time?
      @test_passage.finished!

      TestsMailer.completed_test(@test_passage).deliver_now

      badges = BadgeService.new(current_user).award!

      flash.now[:notice] = t(".award", count: badges.size) if badges
    end
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    client = GistQuestionService.new(@test_passage.current_question)
    gist   = client.call

    if client.success?
      link = gist[:html_url]

      current_user.gists.create!(question_id: @test_passage.current_question.id,
                                 url: link)

      redirect_to @test_passage, notice: "#{t(".success")} #{view_context.link_to(link, link)}"
    else
      redirect_to @test_passage, alert: t(".fail")
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def set_question_number
    @question_number = @test_passage.test_question_index
  end
end
