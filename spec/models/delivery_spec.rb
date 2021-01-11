require 'rails_helper'

RSpec.describe Delivery, type: :model do
  describe '#create' do
   before do
    @delivery = FactoryBot.build(:delivery)
end

 