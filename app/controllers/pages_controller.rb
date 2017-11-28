class PagesController < ApplicationController
  def home
    @spaceships = Spaceship.all
  end
end
