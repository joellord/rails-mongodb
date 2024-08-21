class Movie
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :plot, type: String
  field :year, type: Integer
end
