class TestsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :find_test, except: %i[index new create]

  def index
    @tests = Test.all if logged_in?
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def show
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def start
    @current_user.tests.push(@test)
    redirect_to @current_user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params
      .require(:test)
      .permit(:title, :level, :category_id)
      .with_defaults(author_id: current_user.id)
  end
end
