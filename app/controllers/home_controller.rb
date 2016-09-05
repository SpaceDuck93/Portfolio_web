class HomeController < ApplicationController
  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.valid?
      @contact.deliver
      logger.debug "***************************************** lo mando"
      logger.debug "***************************************** lo mando"
      logger.debug "***************************************** lo mando"
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
