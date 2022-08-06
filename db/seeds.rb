# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require "json"

puts "Cleaning database"
Movie.destroy_all

puts "Creating Movies"
url = "https://tmdb.lewagon.com/movie/top_rated"
json = URI.open(url).read
objs = JSON.parse(json)
objs["results"].each do |obj|
  @movie = Movie.new(title: obj["title"], overview: obj["overview"], rating: obj["vote_average"],
  poster_url: "https://image.tmdb.org/t/p/w500/#{obj["poster_path"]}")
  @movie.save
  puts "#{@movie.title} is created"
end
