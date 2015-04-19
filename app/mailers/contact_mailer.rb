class ContactMailer < ActionMailer::Base
  default from: "brad@bradmilne.ca"
  default to: ["brad@bradmilne.ca", "sandy.gibson@getelevate.com"]

   def notify_sales(name, option, email, phone, comments)
  	@name = name
  	@option = option
  	@email = email
  	@phone = phone
  	@comments = comments
  	mail(subject: "New Contact")
  end

end
