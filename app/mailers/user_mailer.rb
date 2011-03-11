class UserMailer < ActionMailer::Base
  default :from => "colibri@bbaf.ulaval.ca"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.scholarship_info_request.subject
  #
  def scholarship_info_request(requester_address, list_of_scholarships)
    @requester = requester_address
    @scholarships = list_of_scholarships
    mail :to => "xto@pyxis-tech.com"
  end
end
