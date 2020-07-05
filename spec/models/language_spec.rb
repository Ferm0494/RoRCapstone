require 'rails_helper'
RSpec.describe Language, type: :model do
  context 'Validations for language' do
    let(:user) { User.new(name: 'Testing1') }
    let(:language) { Language.new(name: 'Language1') }

    it 'Should be valid if language not empty and belongs to a user ' do
      language.icon.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'other.png')),
                           filename: 'other.png',
                           content_type: 'image/png')
      user.save
      language.user = user
      expect(language).to be_valid
    end

    it 'should be invalid if it doesnt belongs to a user' do
      language.icon.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'other.png')),
                           filename: 'other.png',
                           content_type: 'image/png')
      expect(language).not_to be_valid
    end

    it 'Should be invalid if it doesnt have an icon' do
      user.save
      language.user = user
      expect(language).not_to be_valid
    end
    it 'Should be invalid if it doesnt have a name' do
      language.icon.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'other.png')),
                           filename: 'other.png',
                           content_type: 'image/png')
      user.save
      language.user = user
      language.name = ''

      expect(language).not_to be_valid
    end
  end
  context 'Assocs for language' do
    it { should have_many(:frameworks) }
    it { should belong_to(:user) }
  end
end
