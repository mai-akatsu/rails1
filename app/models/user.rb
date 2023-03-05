class User < ApplicationRecord
   validates :title,length: {maximum: 20 }, presence: true
   validates :starttime, presence: true
   validates :endtime, presence: true
   validates :memo,length: {maximum: 500 }
   
   validate :start_end_check
   validate :startday

    def start_end_check
      if self.endtime < self.starttime
       errors.add(:endtime, "は開始日より前の日付は登録できません。") 
      end
    end

    def startday
      return if starttime.blank?
      errors.add(:starttime, "は今日以降のものを選択してください") if starttime < Date.today
    end
end