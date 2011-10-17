class ProductsController < ApplicationController
  
  def index
    if params[:category_id]
    @category = Category.find(params[:category_id])
    @products=@category.products.paginate(:per_page => 3, :page => params[:page])
  else
    @all_products=Product.all.paginate(:per_page => 5, :page => params[:page])
    end
  end

def new
  @category = Category.find(params[:category_id])
    @product = Product.new
  end
  
  def edit
    @category = Category.find(params[:category_id])
    @product = Product.find(params[:id])
  end
  
  def show
   # @category = Category.find(params[:category_id])
    @product = Product.find(params[:id])
  end
  
  def create
    @category = Category.find(params[:category_id])
    @product = Product.new(params[:product])
    @product.size_id=params[:size_id]
    if @product.save
      CategoryProduct.create(:product_id=>@product.id,:category_id=>@category.id)
      if params[:product][:image] != ""
      file=params[:product][:image]
      destination_path = "#{RAILS_ROOT}/public/images/"
      status = Product.save_image(params[:product][:image],destination_path,"images") 
      @image = Image.new
      @image.name = file.split('.')[0]
      @image.image_path="/images/#{file}"
       @image.product_id=@product.id
      if @image.save
         flash[:notice] = "Image has been uploaded successfully"
      else
        flash[:notice] = "Image is not uploaded."
      end
      end
      redirect_to :action=>'index'
    else
    render :action=>'new'
    end
  end
  
  def update 
    @category = Category.find(params[:category_id])
    @product = Product.find(params[:id])
    @product.size_id=params[:size_id]
    if params[:product][:image] != ""
      file=params[:product][:image]
      destination_path = "#{RAILS_ROOT}/public/images/"
      status = Product.save_image(params[:product][:image],destination_path,"images") 
      @image = Image.new
      @image.name = file.split('.')[0]
      @image.image_path="/images/#{file}"
       @image.product_id=@product.id
      if @image.save
         flash[:notice] = "Image has been uploaded successfully"
      else
        flash[:notice] = "Image is not uploaded."
      end
      
    end
    if @product.update_attributes(params[:product])
      redirect_to :action => 'index'
      
    end
  end
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to :action=>'index'
    
  end
  
end
