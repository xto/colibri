class UserMailer < ActionMailer::Base
  default :from => "colibri-ul@gmail.com"

  def scholarship_info_request(email_address, scholarship_id)
    mail(:to => email_address,
        :subject => t(:scholarship_info_request_subject))
  end
end
