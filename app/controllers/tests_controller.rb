class TestsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :find_test, only: %i[start show]

  def index
    @tests = Test.all
  end

  def start
    if @test.questions.count.zero?
      redirect_to tests_path, notice: "Тест \'#{@test.title}\' пуст"
    else
      session[:question_number] = 1
      current_user.tests.push(@test)

      redirect_to @current_user.test_passage(@test)
    end
  end

  def show
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
