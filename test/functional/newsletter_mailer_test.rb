require 'test_helper'

class NewsletterMailerTest < ActionMailer::TestCase
  test "news" do
    mail = NewsletterMailer.news
    assert_equal "News", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
