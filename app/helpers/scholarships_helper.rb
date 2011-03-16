module ScholarshipsHelper
  def self.execute(params)
    @conditions = ""
    @values = []

    add_cycle_filter(params)
    add_type_filter(params)
    Scholarship.where(@conditions,*@values).order(:name)
  end


  def self.add_type_filter(params)
    add_likes_filter(params[:types], "scholarship_type")
  end

  def self.add_cycle_filter(params)
    add_likes_filter(params[:cycles], "cycle")
  end

  private
  def self.add_likes_filter criterias, field_name
    unless criterias.nil? or criterias.empty?
      unless @conditions.empty?
        @conditions << " AND "
      end

      @conditions << "("

      likes = criterias.values.collect do |like|
        @values << "%#{like}%"
        "#{field_name} like ?"
      end
      @conditions << likes.join(" OR ")
      @conditions << ")"
    end
  end
  
end
