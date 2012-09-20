class ToDosController < ApplicationController

  def new
    @to_do = ToDo.new

    respond_to do |format|
      format.html 
    end
  end

  def create
    @to_do = ToDo.new(params[:to_do])
    respond_to do |format|
      if @to_do.save
        format.html { redirect_to :controller => "categories", :action => "list", :id => @to_do.category_id }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @to_do = ToDo.find(params[:id])
   
    respond_to do |format|
      if @to_do.update_attributes(params[:to_do])
        format.html { redirect_to :controller => "categories", :action => "list", :id => @to_do.category_id }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /to_dos/1
  # DELETE /to_dos/1.json
  def destroy
    @to_do = ToDo.find(params[:id])
    @to_do.destroy
		
    respond_to do |format|
      format.html { redirect_to :controller => "categories", :action => "list", :id => @to_do.category }
    end
  end
end
