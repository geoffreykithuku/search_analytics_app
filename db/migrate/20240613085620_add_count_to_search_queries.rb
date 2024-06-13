class AddCountToSearchQueries < ActiveRecord::Migration[7.1]
  def change
    add_column :search_queries, :count, :integer
  end
end
