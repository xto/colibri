# -*- coding: utf-8 -*-
class Scholarship < ActiveRecord::Base
  paginates_per 20
  
  AVAILABLE_TYPES =%w{aboriginal
                      ancestry_and_territory
  	                  excellence
      	              woman}
  
  AVAILABLE_CYCLES = [["first_cycle",1],["second_cycle",2],["third_cycle",3]]

  def bbaf_url
    "https://oraweb.ulaval.ca/pls/gpb/gpb100_fiche_bourse.consultation_fiche2?numero_concours=1&sequence_bourse=#{seq}&numero_repartition=1"
  end
end
