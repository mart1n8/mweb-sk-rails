class HomeController < ApplicationController
  access [:all] => [:index]

  def index
  end

end
