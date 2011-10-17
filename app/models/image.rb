class Image < ActiveRecord::Base
   belongs_to :product
   
   has_attached_file :image,
     :styles => {
       :thumb=> "100x100#",
       :small  => "400x400>" }
end
