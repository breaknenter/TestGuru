class Admin::BadgesController < Admin::BaseController
  before_action :get_badges, only:   :index
  before_action :find_badge, except: %i[index new create]

  def index
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path, notice: t(".success")
    else
      render :new
    end
  end

  def new
    @badge = Badge.new
  end

  def edit
  end

  def show
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path, notice: t(".update")
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy

    redirect_to admin_badges_path, notice: t(".update", name: @badge.rule)
  end

  private

  def badge_params
    params.require(:badge).permit(:rule, :value, :reward)
  end

  def get_badges
    @badges = Badge.all
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end
end
