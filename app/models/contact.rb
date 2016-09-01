class Contact < MailForm::Base
  attribute :name
  attribute :email
  attribute :message
  
  def headers
    {
      subject: "Contact Form",
      to: "perezalfredo14@gmail.com",
      from: %("#{name}" <#{email}>)
    }
  end
end
