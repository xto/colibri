class ScholarshipsController < ApplicationController
  def index
    @scholarships = []
  end

  def search
    conditions = ""
    
    unless params[:cycles].nil?
      conditions = "cycle in (#{params[:cycles].values.join(',')})"
    end
    @scholarships  = Scholarship.all(:conditions => conditions)
    
    render :template => 'scholarships/index'
  end

end
