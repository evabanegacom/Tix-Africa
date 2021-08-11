require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'does not require image presence' do
      user = User.new(email: 'temple@yahoo.com', password: 'precious5').save
      expect(user).to eql(true)
    end

    it 'ensures password is at least 6 characters' do
      user = User.new(email: 'temple@yahoo.com', password: 'preci').save
      expect(user).to eql(false)
    end

    it 'ensures email must be unique' do
      User.new(email: 'temple@yahoo.com', password: 'precious5').save
      user = User.new(email: 'temple@yahoo.com', password: 'precious5').save
      expect(user).to eql(false)
    end

    it 'ensures password must be present' do
      user = User.new(email: 'temple@yahoo.com').save
      expect(user).to eql(false)
    end

    it 'ensures email must be present' do
      user = User.new(password: 'precious5').save
      expect(user).to eql(false)
    end

    it 'does not ensure name  presence' do
      user = User.new(email: 'temple@yahoo.com', password: 'precious5').save
      expect(user).to eql(true)
    end
  end
end
