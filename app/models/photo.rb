class Photo < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image, :styles => { :medium => "300x300", :large => "500x500", :thumb => "100x100" }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  attr_accessor :delete_image

  # def photo_data=(photo_data)
  #   self.data      = photo_data.read
  #   self.filename  = photo_data.original_filename
  #   self.mime_type = photo_data.content_type
  # end

  def photo_from_url(url)
  end
##check stack overflow post from

end
