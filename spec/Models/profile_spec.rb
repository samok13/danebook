require 'rails_helper'

describe Profile do

  let(:user){ create(:user) }
  let(:profile){ build(:profile) }
  #Do I need both or doesn't rails generate a user if I create a profile?

  describe 'attributes' do
    it 'has valid attributes' do
      expect(profile).to be_valid
    end


    it 'is not valid with blank first name' do
      new_profile = build(:profile, first_name: "")
      expect(new_profile).not_to be_valid
    end

    it 'is not valid with blank last name' do
      new_profile = build(:profile, last_name: "")
      expect(new_profile).not_to be_valid
    end

    it 'is not valid with blank gender' do
      new_profile = build(:profile, gender: 'male')
      expect(new_profile).not_to be_valid
    end
    #should probably add that gender must be male or femlae

    it 'requires user to exist' do
      new_profile = build(:profile, user: nil)
      expect(new_profile).not_to be_valid
    end

    