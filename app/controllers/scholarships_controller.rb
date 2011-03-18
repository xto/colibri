class ScholarshipsController < ApplicationController
  def index
    execute_query(params)
  end

  def scholarship_info_request
    if !params[:selected_scholarships].nil? && !params[:requester_address].empty?
      scholarships = params[:selected_scholarships].keys.collect{|id| Scholarship.find_by_seq(id)}
      UserMailer.scholarship_info_request(params[:requester_address],scholarships).deliver
    else
      flash[:email_error] = t(:email_error)
    end
    redirect_to :action => 'index'
  end

  private
  def execute_query(params)
    @scholarships = ScholarshipsHelper.execute(params)
    @selected_cycles = params[:cycles] || {}
    @selected_types = params[:types] || {}
  end

end
