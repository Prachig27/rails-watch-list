# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Clear existing data (optional, use with caution in development)
puts "Cleaning database..."
Bookmark.destroy_all
List.destroy_all
Movie.destroy_all

# Create Movies
puts "Creating movies..."
Movie.create([
  { title: "Inception", description: "A mind-bending thriller" },
  { title: "The Dark Knight", description: "Batman fights Joker" },
  { title: "Interstellar", description: "A journey beyond the stars" }
])
movies.each do |movie|
  Movie.create!(movie)
end

# Create Lists
puts "Creating lists..."
watchlist = List.create!(name: "My Watchlist")
favorites = List.create!(name: "Favorites")

# Create Bookmarks (associating movies with lists)
puts "Creating bookmarks..."
Bookmark.create!(comment: "Must-watch!", movie: Movie.first, list: watchlist)
Bookmark.create!(comment: "Classic!", movie: Movie.second, list: favorites)
