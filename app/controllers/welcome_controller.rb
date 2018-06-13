class WelcomeController < ApplicationController
  def index
    @items = Item.all.limit(6).order('created_at desc')
  end
end
