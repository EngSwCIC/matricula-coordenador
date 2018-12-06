# frozen_string_literal: true

FactoryBot.define do
  factory :attendance do
    name_student { 'MyString' }
    course_student { 'MyString' }
    comment { 'MyText' }
    priority_student { 'MyString' }
  end
end
