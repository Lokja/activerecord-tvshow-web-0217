require "pry"

class Show < ActiveRecord::Base

  def self.highest_rating
    self.maximum('rating')
  end

  def self.most_popular_show
    r = self.highest_rating
    self.find_by(rating: r)
  end

  def self.lowest_rating
    self.minimum('rating')
  end

  def self.least_popular_show
    r = self.lowest_rating
    self.find_by(rating: r)
  end

  def self.ratings_sum
    self.sum(:rating)
  end

  def self.popular_shows
    self.where("rating > 5", :rating)
  end

  def self.shows_by_alphabetical_order
    self.all.order(:name)
  end
  
end
