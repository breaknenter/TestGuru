class BadgeService
  RULES = { category: "Веб-разработка",
            level:    1 }.freeze

  def initialize(user)
    @user   = user
    @test   = user.test_passages.last.test
    @badges = []
  end

  def award!
    Badge.rewards.each do |name|
      assign_reward(name) if send("#{name}?")
    end

    if @badges.any?
      @user.badges.push(@badges)

      return @badges
    end
  end

  private

  def assign_reward(name)
    @badges << Badge.reward(name)
  end

  def first_time?
    TestPassage.where(user: @user,
                      test: @test).count == 1
  end

  def category?
    category = Category
                 .where("categories.id = ?", @test.category_id)
                 .pluck(:title)
                 .join

    return false if repeat? || category != RULES[:category]

    tests = Test
              .joins(:category)
              .where(categories: { title: RULES[:category] })
              .pluck(:title)

    finished = Test
                 .joins(:category)
                 .where(categories: { title: RULES[:category] })
                 .joins(:test_passages)
                 .where(test_passages: { user: @user, finished: true })
                 .pluck(:title)
                 .uniq

    tests.count == finished.count
  end

  def all_level?
    return false if repeat? || @test.level != RULES[:level]

    tests = Test.where(level: RULES[:level])

    finished = Test
                 .where(level: RULES[:level])
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
