require_relative 'recipe_api_wrapper'

class Recipe

  attr_reader :label, :photo, :url, :ingredients, :diet

  def initialize(label, photo, url, ingredients, diet)
    raise ArgumentError if label == nil || photo == nil || url == nil || ingredients == nil || diet == nil

    @label = label
    @photo = photo
    @url = url
    @ingredients = ingredients
    @diet = diet
  end

  def self.all(search_term, page_number)
    @recipes ||= EdamamApiWrapper.list_recipes(search_term, page_number)
  end

  class << self
    attr_reader :recipes
  end

end
