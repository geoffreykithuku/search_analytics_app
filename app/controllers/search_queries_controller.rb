class SearchQueriesController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    @search_query = SearchQuery.new(search_query_params)
    @search_query.ip = request.remote_ip

    if is_complete_query?(@search_query.query)
      existing_query = SearchQuery.find_by(query: @search_query.query)
      if existing_query
        existing_query.increment!(:count)
      else
        # Destroy incomplete queries that are part of the new complete query
        SearchQuery.where('LENGTH(query) < LENGTH(?) AND ? LIKE query || \'%\'', @search_query.query, @search_query.query).destroy_all
        @search_query.save
      end
      render json: @search_query, status: :created
    else
      head :no_content
    end
  end

  def index
    @search_queries = SearchQuery.all.group(:query, :ip).count.map do |(query, ip), count|
      { ip: ip, query: query, count: count }
    end

    respond_to do |format|
      format.html # Render the default HTML template
      format.json { render json: @search_queries } # Render JSON response
    end
  end

  private

  def search_query_params
    params.require(:search_query).permit(:query)
  end

  def is_complete_query?(query)
    !query.strip.end_with?(" ")
  end
end
