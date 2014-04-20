class ContactsController < ApplicationController
  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new
    @contact.name = params[:contact][:name]
    @contact.email = params[:contact][:email]
    @contact.subject = params[:contact][:subject]
    @contact.message = params[:contact][:message]

    if @contact.save
      flash[:notice] = 'Your message has been sent'
    else
      flash[:alert] = 'Validation error'
    end
    redirect_to '/contact'
  end

end
