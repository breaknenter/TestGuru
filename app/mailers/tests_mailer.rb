class TestsMailer < ApplicationMailer
  def completed_test(test_passage)
    @user = test_passage.user
    @test = test_passage.test

    # subject: "Вы успешно завершили тест!" => lang.yml/tests_mailer.completed_test
    mail to: @user.email
  end
end
