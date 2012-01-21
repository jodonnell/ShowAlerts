class Show
  include Mongoid::Document
  field :bands
  field :date, type: Date
  field :location
  field :tickets_link
end

