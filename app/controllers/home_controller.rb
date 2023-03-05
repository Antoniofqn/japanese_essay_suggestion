class HomeController < ApplicationController
  skip_forgery_protection

  def index
  end

  def generate
    prompt = ENV["PROMPT"]
    prompt = prompt.delete("\n")

    result = OpenaiService.new.generate_text(prompt)

    puts result
    puts "++++++++++++++++++++++++++++++++++"

    topic = result["choices"][0]["text"].match(/Tópico:\s*(.*?)\n/m)[1]
    constructions = constructions = result["choices"][0]["text"].scan(/^\d+\.\s*(.*?)\s*\((.*?)\)/m).map {|match| "#{match[0]} (#{match[1]})"}

    puts "+++++++++++++++++++++++++++"
    puts topic
    puts constructions

    render json: { topic: topic, constructions: constructions }
  end
end
