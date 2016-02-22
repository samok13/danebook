require 'rails_helper'

describe ProfilesController do

  let(:profile) {create(:profile) }

  before do 
    profile
    request.cookies[:auth_token] = profile.user.auth_token
  end

  describe 'PUT#update'

    it 'valid params trigger success flash' do
      patch :update, user_id: profile.user.id, id: profile.id, profile: attributes_for(:profile)

      expect(flash["success"]).to_not be nil
    end

    it 'invalid params trigger error flash' do
      
      let(:profile){create(:profile, :first_name => '')}

      patch :update, user_id: profile.user.id, id: profile.id, profile: attributes_for(:profile, hometown: too_long)
      
      expect(flash["error"]).to_not be nil

    end
  end


