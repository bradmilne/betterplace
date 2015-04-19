class ContactsController < ApplicationController

  def new
  	@contact = Contact.new
  end

  def create
  	@contact = Contact.new(contact_params)
  	@option = params[:contact][:option]
    @name = params[:contact][:name]
    @email = params[:contact][:email]
    @phone = params[:contact][:phone]
    @comments = params[:contact][:comments]
    
  	if @contact.save
      ContactMailer.notify_sales(@name, @option, @email, @phone, @comments).deliver
  	  redirect_to pages_thanks_path
  	else
  		render new_contact_path
  		flash[:notice] = "Oops. Please enter the correct information and try again."
  	end
  end

  private

  def contact_params
  	params.require(:contact).permit(:option, :name, :phone, :email, :comments)
  end

end
