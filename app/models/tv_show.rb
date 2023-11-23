class TvShow < ApplicationRecord
  include PgSearch::Model # import/require the search module
  multisearchable against: [:title, :synopsis]

end
