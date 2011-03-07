class ScholarshipsController < ApplicationController
  def index
    @scholarships = []
  end

  def search
    @scholarships  = ScholarshipsHelper.execute params

    render :template => 'scholarships/index'
  end

end
