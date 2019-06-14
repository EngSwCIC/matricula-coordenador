class AttendanceRequest < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  validates :description, presence: true
  attr_accessor :position

  private
    after_initialize do
      unless self.created_at.nil?
        @position = AttendanceRequest.where("status = 'aguardando' AND created_at < '#{self.created_at}' ").count
        @position += 1;
      end
    end
end
