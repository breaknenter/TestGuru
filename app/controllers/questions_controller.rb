class QuestionsController < ApplicationController
  before_action :find_test,     only: :index
  before_action :find_question, only: [:show, :destroy]

  def index
    @questions = @test.questions
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:success] = "Вопрос создан!"
      redirect_to @question
    else
      render :new
    end
  end

  def new
  end

  def edit
  end

  def show
    render plain: @question.text
  end

  def update
  end

  def destroy
    @question.destroy
    render plain: "Вопрос #{@question.id} удалён"
    redirect_to questions_path
  end

  private
    def question_params
      params.require(:question).permit(:text, :test_id)
    end

    def find_test
      @test = Test.find(params[:test_id])
    end

    def find_question
      @question = Question.find(params[:id])
    end
end
