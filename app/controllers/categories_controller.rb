class CategoriesController < ApplicationController
	load_and_authorize_resource
	def list
    @categories = current_user.category
		
		if (params[:id] == nil)
			if(@categories.first == nil)
				current_user.category << Category.new
			end
			@selected_category = @categories.first
		else
			@selected_category = Category.find(params[:id])
		end
    
		if @selected_category.to_do.find_by_text(nil) == nil
			@selected_category.to_do << ToDo.new
			@selected_category.to_do.last.category_id = @selected_category.id	
		end
	end

  def new
    @category = Category.new
	
    respond_to do |format|
      format.html
    end
  end

  def create
    @category = Category.new(params[:category])
    @category.user_id = current_user.id
    
    respond_to do |format|
      if @category.save
        format.html { redirect_to :controller => "categories", :action => "list", :id => @category }
        
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @category = Category.find(params[:id])
    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to :controller => "categories", :action => "list", :id => @category }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy  
    respond_to do |format|
      format.html { redirect_to :controller => "categories", :action => "list" }
    end
  end
end
