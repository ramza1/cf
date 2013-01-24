class NewsletterMailer < ActionMailer::Base
  default from: "newsletter@cfmagonline.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newsletter_mailer.news.subject
  #
  def news(email, newsletter)
    @email = email
    @newsletter = newsletter

    mail to: email, :subject => newsletter.title
  end
end
