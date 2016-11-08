class LandingController < ApplicationController
  def index
    @quotes = Quote.limit(5).order('RANDOM()')
  end
end
