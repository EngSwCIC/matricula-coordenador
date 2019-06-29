class AttendanceRequest < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  validates :description, presence: true
  attr_accessor :position
  enum status: {aguardando: 'aguardando' , atendido: 'atendido'}
  enum priority_student: {normal: 'normal', 'em condicao': 'em condicao', outros: 'outros'}

  private
    after_initialize do
      unless self.created_at.nil?
        @position = AttendanceRequest.where("status = 'aguardando' AND created_at < '#{self.created_at}' ").count
        @position += 1;
      end
    end
end
