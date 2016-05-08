class StoreController < ApplicationController
  skip_before_filter :authorize

  def index
    if params[:set_locale]
      redirect_to store_path(locale: params[:set_locale])
    else
      @products = Product.order(:title)
      @cart = current_cart
    end
    if session[:counter].nil?
      session[:counter] = 0
    end

    session[:counter] += 1
    @counter = session[:counter]
  end
end
