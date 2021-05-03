class BadgesController < ApplicationController
  before_action :get_badges

  def show
  end

  private

  def get_badges
    @badges = current_user.badges
    @all_badges = Badge.all - @badges
  end
end
