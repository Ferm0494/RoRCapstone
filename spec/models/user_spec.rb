require 'rails_helper'
RSpec.describe User, type: :model do
  context 'Validations for use' do
    let(:user) { User.new(name: 'Testing1') }
    let(:user2) { User.new(name: 'Testing2') }

    it 'Should be valid if username more than 1 char' do
      expect(user).to be_valid
    end

    it 'Not should be valid if user name is blank' do
      user.name = ''
      expect(user).not_to be_valid
    end

    it 'Not should be valid if user name is already taken' do
      user2.save
      user.name = 'Testing2'
      expect(user).not_to be_valid
    end
  end

  context 'Associations for a user' do
    let(:user) { User.new(name: 'Testing1') }
    it { should have_many(:languages) }
    it { should have_many(:frameworks) }
  end

  context 'Avatar for User' do
    let(:user) { User.new(name: 'Testing1') }
    it 'Should have a valid image' do
      user.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'unknown_user.jpeg')), filename: 'unknown_user.jpeg', content_type: 'image/jpeg')
      expect(user.avatar).to be_attached
    end
  end
end
