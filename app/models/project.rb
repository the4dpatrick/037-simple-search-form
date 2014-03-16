class Project < ActiveRecord::Base
  validates_presence_of :name

  def self.search(search)
    if search
      if Rails.env.development?
        where("name LIKE ?", "%#{search}%")
      elsif Rails.env.production?
        where("name ILIKE ?", "%#{search}%")
      end
    else
      all
    end
  end
end
