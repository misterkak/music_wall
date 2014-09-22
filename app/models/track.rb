class Track < ActiveRecord::Base

  validates :author, presence: true, length: { maximum: 25 }
  validates_format_of :link, :with => /(?<http>(http:[\/][\/]|www.)([a-z]|[A-Z]|[0-9]|[\/.]|[~])*)/, :on => :create, allow_blank: true

end
