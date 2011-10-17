class OccasionsController < ApplicationController
  def index
    @occasions=Occasion.all   #.paginate(:per_page => 2, :page => params[:page])
  
  end
  
  def new
    @occasion = Occasion.new
  end
  
  def edit
    @occasion = Occasion.find(params[:id])
  end
  
  def show
    @occasion = Occasion.find(params[:id])
  end
  
  def create
    @occasion = Occasion.new(params[:occasion])
    if @occasion.save
      redirect_to :action=>'index'
    else
    render :action=>'new'
    end
  end
  
  def update    
    @occasion = Occasion.find(params[:id])
    if @occasion.update_attributes(params[:occasion])
      redirect_to :action => 'index'
      
    end
  end
  
   def destroy
    @occasion = Occasion.find(params[:id])
    @occasion.destroy
    redirect_to :action=>'index'
    
  end
end
