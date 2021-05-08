class BadgeService
  def initialize(user)
    @user   = user
    @test   = user.test_passages.last.test
    @badges = []
  end

  def award!
    Badge.all.each do |badge|
      @badges << badge if send("#{badge.reward}?", badge.value)
    end

    if @badges.any?
      @user.badges.push(@badges)

      return @badges
    end
  end

  private

  def first_time?(_pass)
    TestPassage.where(user: @user,
                      test: @test).count == 1
  end

  def category?(title)
    return false if repeat? || @test.category.title != title

    tests = Test
              .joins(:category)
              .where(categories: { title: title })
              .pluck(:id)

    finished = Test
                 .joins(:category)
                 .where(categories: { title: title })
                 .joins(:test_passages)
                 .where(test_passages: { user: @user, finished: true })
                 .pluck(:id)
                 .uniq

    tests.count == finished.count
  end

  def all_level?(level)
    level = level.to_i

    return false if repeat? || @test.level != level

    tests = Test.where(level: level)

    finished = Test
                 .where(level: level)
                 .joins(:test_passages)
                 .where(test_passages: { user: @user, finished: true })
                 .uniq

    tests.count == finished.count
  end

  def repeat?
    TestPassage.where(user:     @user,
                      test:     @test,
                      finished: true).count > 1
  end
end
