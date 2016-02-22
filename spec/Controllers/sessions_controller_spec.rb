require 'rails_helper'

describe SessionsController do

  let(:user){ create(:user) }

  describe 'post#create' do
    
    it 'remember_me sets a permanent cookie' do
      user
      post :create, email: user.email, password: user.password

      expect(cookies.permanent[:auth_token]).to_not be nil
    end
  end

  describe 'delete#detroy' do

    it 'logs out a logged in user' do
      user
      post :create, email: user.email, password: user.password
      delete :destroy

      expect(cookies.permanent[:auth_token]).to be nil
    end

  end
