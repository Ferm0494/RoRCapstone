require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.describe Framework, type: :model do
  context 'Validations for Framework' do
    let(:user) { User.new(name: 'Testing1') }
    let(:language) { Language.new(name: 'Language1') }
    let(:framework) { Framework.new(name: 'Framework1') }
    it 'Should be valid if a framework contains a user/name/language' do
      framework.user = user
      framework.language = language
      framework.icon.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'other.png')),
                            filename: 'other.png',
                            content_type: 'image/png')
      expect(framework).to be_valid
    end

    it 'Should be invalid if a framework doesnt contains a name' do
      framework.icon.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'other.png')),
                            filename: 'other.png',
                            content_type: 'image/png')
      framework.user = user
      framework.language = language
      framework.name = ''
      expect(framework).not_to be_valid
    end

    it 'should be invalid if it doesnt have a user' do
      framework.icon.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'other.png')),
                            filename: 'other.png',
                            content_type: 'image/png')
      framework.language = language
      expect(framework).not_to be_valid
    end

    it 'Should be invalid if it doesnt belongs to a language' do
      framework.icon.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'other.png')),
                            filename: 'other.png',
                            content_type: 'image/png')
      framework.user = user
      expect(framework).not_to be_valid
    end

    it 'Should be invalid if it doesnt have an icon' do
      framework.user = user
      framework.language = language
      expect(framework).not_to be_valid
    end
  end

  context 'Assocs for framework' do
    it { should belong_to(:user) }
    it { should belong_to(:language) }
  end

  context 'Should have an icon' do
    let(:framework) { Framework.new(name: 'Testing1') }
    it 'Should have a valid image' do
      framework.icon.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'unknown_user.jpeg')),
                            filename: 'unknown_user.jpeg',
                            content_type: 'image/jpeg')
      expect(framework.icon).to be_attached
    end
  end
end

# rubocop:enable Metrics/BlockLength
