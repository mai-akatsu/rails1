class User < ApplicationRecord
   validates :title,length: {maximum: 20 }, presence: true
   validates :starttime, presence: true
   validates :endtime, presence: true
   validates :memo,length: {maximum: 500 }

   validate :valid_eligiblity_range?
   validate :pretend_ago

def pretend_ago
    today = Date.today
    
    return unless starttime? && today
    
    if !starttime.after?(today)
    errors.add(:starttime, 'must be after Today')
    end
end

  def valid_eligiblity_range?
    return unless endtime? && starttime?

    if !endtime.after?(starttime)
      errors.add(:starttime, "must be before Expiration Date")
      errors.add(:endtime, "must be after Start Date")
    end
  end
end