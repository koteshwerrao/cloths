class ImageController < ApplicationController
  
 # def upload
  #   unless (params[:image].nil? or params[:image][:file_data])
   #    image = params[:image]
   #    image_upload(params[:image][:file_data], image)
   #    end
 #  end
   
   def image_upload(file,image)
     destination_path = "#{RAILS_ROOT}/public/"
     status = Image.save_image(params[:image][:file_data],destination_path,"images") if params[:image] and params[:image][:file_data]
      @image = Image.new image
      @image.name = file.original_filename
      if @image.save
         flash[:notice] = "Image has been uploaded successfully"
      else
        flash[:notice] = "Image is not uploaded."
      end
  end
  
  def save_image(param,destination_path,destination_folder)
    if (not param.blank? and param.original_filename.split(".")[0]==destination_folder)
      path = File.join(destination_path, param.original_filename) if not param.blank?
      File.open(path, "w") { |f| f.write(param.read) } if not param.blank? and not path.blank?
      
    end
  end
end
