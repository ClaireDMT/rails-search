class Movie < ApplicationRecord
  belongs_to :director
  include PgSearch::Model # import/require the search module
  multisearchable against: [:title, :synopsis]


  #  Define a new search method and to use it, Movie.search_by_title_and_synopsis
  pg_search_scope :search_by_title_and_synopsis,
    against: [ :title, :synopsis, :year, :free ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  pg_search_scope :global_search,
  against: [ :title, :synopsis, :year ],
  associated_against: {
    director: [ :first_name, :last_name ]
  },
  using: {
    tsearch: { prefix: true }
  }
end
