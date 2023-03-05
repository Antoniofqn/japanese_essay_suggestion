class HomeController < ApplicationController
  skip_forgery_protection

  def index
  end

  def generate
    @theme = Theme.all.sample
    @constructions = GrammaticalConstruction.sample(4)
  end
end
