class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_me.subject
  #
  def contact_me
    @greeting = "Hi"

    mail to: "perezalfredo14@gmail.com"
  end
end
