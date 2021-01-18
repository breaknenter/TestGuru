module ApplicationHelper
  AUTHOR = "breaknenter".freeze
  REPO   = "https://github.com/breaknenter/TestGuru".freeze

  def current_year
    Date.today.year
  end

  def github_url
    link_to "#{AUTHOR}", "#{REPO}"
  end
end
