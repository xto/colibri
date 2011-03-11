class ScholarshipsController < ApplicationController
  def index
    @scholarships = Scholarship.all
  end

  def search
    @scholarships  = ScholarshipsHelper.execute params

    render :template => 'scholarships/index'
  end

  def scholarship_info_request
    scholarships = [params[:scholarship_ids]].collect{|id| Scholarship.find_by_seq(id)}
    UserMailer.scholarship_info_request(params[:requester_address],scholarships).deliver
    redirect_to :action => 'index'
  end
end
