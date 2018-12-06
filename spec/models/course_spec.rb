# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Course, type: :model do
  it 'ensures name presence' do
    course = Course.new(name: nil)
    form = course.save

    expect(form).to eq(false)
  end
end
