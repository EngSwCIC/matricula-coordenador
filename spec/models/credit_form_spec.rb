require 'rails_helper'

RSpec.describe CreditForm, type: :model do
  context 'validation tests' do
    it 'ensures description presence' do
      item = CreditItem.new(group: 1, workload: 30, requested_credits_amount: 2)
      item.document.attach(io: File.open(Rails.root.join('public', '224298.png')), filename: '224298.png')

      form = CreditForm.new(credit_items: [item]).save
      expect(form).to eq(false)
    end

    it 'ensures group presence' do
      item = CreditItem.new(description: 'descricao', workload: 30, requested_credits_amount: 2)
      item.document.attach(io: File.open(Rails.root.join('public', '224298.png')), filename: '224298.png')

      form = CreditForm.new(credit_items: [item]).save
      expect(form).to eq(false)
    end

    it 'ensures workload presence' do
      item = CreditItem.new(description: 'descricao', group: 1, requested_credits_amount: 2)     
      item.document.attach(io: File.open(Rails.root.join('public', '224298.png')), filename: '224298.png')

      form = CreditForm.new(credit_items: [item]).save
      expect(form).to eq(false)
    end

    it 'ensures requested_credits_amount presence' do
      item = CreditItem.new(description: 'descricao', group: 1, workload: 30)
      item.document.attach(io: File.open(Rails.root.join('public', '224298.png')), filename: '224298.png')

      form = CreditForm.new(credit_items: [item]).save
      expect(form).to eq(false)
    end

    it 'should save successfully' do
      item = CreditItem.new(description: 'descricao', group: 1, workload: 30, requested_credits_amount: 2)
      item.document.attach(io: File.open(Rails.root.join('public', '224298.png')), filename: '224298.png')

      form = CreditForm.new(credit_items: [item]).save
      expect(form).to eq(true)
    end
  end
end