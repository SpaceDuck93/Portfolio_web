class HomeController < ApplicationController
  def index
    @contact = Contact.new
  end

  def submit
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
    else
      flash.now[:error] = "Cannot send message"
      render :index
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
