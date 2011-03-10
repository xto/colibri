class UserMailer < ActionMailer::Base
  default :from => "colibri@"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.scholarship_info_request.subject
  #
  def scholarship_info_request
    @greeting = "Hi"

    mail :to => "to@example.org"
  end
end
