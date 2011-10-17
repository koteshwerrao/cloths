class Product < ActiveRecord::Base
  has_many :category_products
  has_many :categories, :through => :category_products
  has_many :images
  belongs_to :occasion
  belongs_to :size
  
  attr_accessor :image
  attr_accessor :image_file_name

   has_attached_file :image,
     :styles => {
       :thumb=> "100x100#",
       :small  => "400x400>" }
  
   validates_presence_of :name,:price
   
   
   
   
   
   
   def self.save_image(param,destination_path,destination_folder)
    if not param.blank? 
      path = File.join(destination_path, param) if not param.blank?
      File.open(path, "wb") { |f| f.write(File.open(path).read) } if not param.blank? and not path.blank?
     
    end
  end
end
