module TestsHelper
  TEST_LEVELS = { 0 => :easy,
                  1 => :intermediate,
                  2 => :advanced,
                  3 => :hardcore }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :godlike
  end
end
