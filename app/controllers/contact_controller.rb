class ContactController < ApplicationController

  def new
    $name = params[:name]
    @sub = params[:subject]
    @email = params[:email]
    @msg = params[:message]
  end
end
