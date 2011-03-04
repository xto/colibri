class ScholarshipsController < ApplicationController
  def index
    @scholarships = []
  end

  def search
    conditions = ""
    
    unless params[:cycles].nil?
      params[:cycles].values.each {|cycle|
        conditions += "cycle like '%" + cycle + "%' OR "
      }
      conditions = conditions[0..conditions.length-4]
    end
    @scholarships  = Scholarship.all(:conditions => conditions)
    
    render :template => 'scholarships/index'
  end

end
