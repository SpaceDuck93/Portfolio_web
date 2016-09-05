class HomeController < ApplicationController
  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.valid?
      @contact.deliver
      flash.now[:error] = nil
    else
      flash.now[:error] = "Cannot send message"
      render :index
    end
    render :index
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
