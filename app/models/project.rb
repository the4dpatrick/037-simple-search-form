class Project < ActiveRecord::Base
  validates_presence_of :name

  def self.search(search)
    if search
      where("name LIKE ?", "%#{search}%")
    else
      all
    end
  end
end
