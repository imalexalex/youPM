class Activity < ActiveRecord::Base
  belongs_to :manager
  after_initialize :init

  def init
    self.date = Time.now()
    #self.manager_id = session[:manager_id]
  end
  
end
