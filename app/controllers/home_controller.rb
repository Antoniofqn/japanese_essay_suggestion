class HomeController < ApplicationController
  skip_forgery_protection

  def index
  end

  def generate
    @theme = Theme.all.sample
    @constructions = GrammaticalConstruction.all.sample(4).map { |construction| [construction.construction, "(#{construction.explanation})"] }


    render json: { topic: @theme.title, construction: @constructions}
  end
end
