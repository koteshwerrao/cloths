class CategoriesController < ApplicationController
  
  
  def index
    @categories=Category.all   #.paginate(:per_page => 2, :page => params[:page])
  
  end
  
  def new
    @category = Category.new
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def show
    @category = Category.find(params[:id])
  end
  
  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to :action=>'index'
    else
    render :action=>'new'
    end
  end
  
  def update    
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to :action => 'index'
      
    end
  end
  
   def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to :action=>'index'
    
  end
end
