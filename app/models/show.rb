class Show
  include Mongoid::Document
  field :bands
  field :date, type: Date
  field :location
  field :ticket_link

  has_many :users_show_alerts
end

