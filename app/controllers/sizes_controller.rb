class SizesController < ApplicationController
  def index
   # @category = Category.find(params[:category_id])
    @product =Product.find(params[:product_id]) 
    @sizes=Size.all.paginate(:per_page => 2, :page => params[:page])
  
end

def new
  @product =Product.find(params[:product_id]) 
    @size = Size.new
  end
  
  def edit
    @product =Product.find(params[:product_id])
    @size = Size.find(params[:id])
  end
  
  def show
    @product =Product.find(params[:product_id])
    @size = Size.find(params[:id])
  end
  
  def create
    @product =Product.find(params[:product_id])
    @size = Size.new(params[:size])
    if @size.save
      redirect_to :action=>'index'
    else
    render :action=>'new'
    end
  end
  
  def update 
    @product =Product.find(params[:product_id])
    @size = Size.find(params[:id])
    if @size.update_attributes(params[:size])
      redirect_to :action => 'index'
      
    end
  end
  
   def destroy
    @product =Product.find(params[:product_id])
    @size = Size.find(params[:id])
    @size.destroy
    redirect_to :action=>'index'
    
  end
end
