class Band
  include Mongoid::Document
  field :name

  belongs_to :user
end
