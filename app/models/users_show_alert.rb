class UsersShowAlert
  include Mongoid::Document
  belongs_to :user
  belongs_to :show

  def self.find_matches
    matches = []
    Show.all.each do |show|
      User.all.each do |user|
        user.bands.each do |band|
          if show.bands.include? band.name
            alert = UsersShowAlert.where(:user_id => user.id, :show_id => show.id)
            if alert.first.nil?
              matches.push alert.create
            end
          end
        end
      end
    end
    matches
  end
end

