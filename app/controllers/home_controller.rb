class HomeController < ApplicationController
  require 'door'

  def index
    @enter = Door.new('http://vinforum.ru/', 'pkhilenko@gmail.com', 'tatinu1965' )
    @enter.sign_in
    @count = @enter.messages_count
    render 'index.json.jbuilder'
  end
end
