class ScholarshipsController < ApplicationController
  def index
    redirect_to :action => 'search'
  end

  def search
    scholarships_query  = ScholarshipsHelper.execute(params)
    @scholarships_count = scholarships_query.size
    @scholarships = scholarships_query.page(params[:page])
    @selected_cycles = params[:cycles] || {}
    @selected_types = params[:types] || {}

    render :template => 'scholarships/index'
  end

  def scholarship_info_request
    scholarships = params[:selected_scholarships].keys.collect{|id| Scholarship.find_by_seq(id)}
    UserMailer.scholarship_info_request(params[:requester_address],scholarships).deliver
    redirect_to :action => 'index'
  end
end
