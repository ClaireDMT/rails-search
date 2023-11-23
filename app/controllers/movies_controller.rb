class MoviesController < ApplicationController
  def index
    raise
    @movies = Movie.all # returns an active record collection not a array

    if params[:query].present?
      @movies = @movies.search_by_title_and_synopsis(params[:query]) # returns an active record relation so you can use .were

      # sql_query = <<~QUERY
      #   movies.title @@ :keyword
      #   OR movies.synopsis @@ :keyword
      #   OR directors.first_name @@ :keyword
      #   OR directors.last_name @@ :keyword
      # QUERY
      # @movies = @movies.joins(:director).where(sql_query, keyword: "%#{params[:query]}%")
      # @movies = @movies.where('title ILIKE :keyword OR synopsis ILIKE :keyword', keyword: "%#{params[:query]}%")
      # @movies = @movies.where(title: params[:query]) # chaining active record methods
      # @movies = @movies.global_search(params[:query])
    end

    if params[:free].present?
      @movies = @movies.where(free: params[:query] == "Free") # returns an active r
    end

    if params[:year].present?
      @movies = @movies.where(year: params[:year])
    end
  end
end
