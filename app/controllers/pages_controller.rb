class PagesController < ApplicationController
  def home
    reset = Recipe.reset_all
    # This is to clear previous search_all result
  end

  def index
    @page_number = 1
    # @recipe = nil
    @recipes ||= Recipe.all(params[:q], @page_number)
    #
    # len = @recipes.length # wrong because len will always return 10 due to from - to default at 10.
    # if len % 10 == 0
    #   total_pages = len / 10
    # else
    #   total_pages = len / 10 + 1
    # end


  end

  def show
    @recipe = Recipe.search_by(params[:id])
  end

  private

  # def recipe_params
  #   params.require(:recipe).permit(:label, :photo, :url, :ingredients, :diet)
  # end
end
