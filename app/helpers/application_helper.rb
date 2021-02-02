module ApplicationHelper
  AUTHOR = "breaknenter".freeze
  REPO   = "https://github.com/breaknenter/TestGuru".freeze

  def flash_msg(type)
    content_tag(:p, flash[type], class: "flash alert") if flash[type]
  end

  def current_year
    Date.today.year
  end

  def github_url
    link_to "#{AUTHOR}", "#{REPO}"
  end
end
