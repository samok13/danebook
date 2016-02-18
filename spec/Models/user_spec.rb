require 'rails_helper'

describe User do

  let(:user){ create(:user) }

  #Basic Validity Check
  describe 'attributes' do

    it 'has valid attributes' do
      expect(user).to be_valid
    end

    #Name Check
    it 'is not valid if first_name is blank' do
      new_user = build(:user, first_name: "")
      expect(new_user).not_to be_valid
    end

     it 'is not valid if last_name is blank' do
      new_user = build(:user, last_name: "")
      expect(new_user).not_to be_valid
    end

    #Email Check
    it 'is not valid if email is blank' do
      new_user = build(:user, email: "")
      expect(new_user).not_to be_valid
    end

    it 'is invalid with an email which is already taken' do
        new_user = build(:user, email: "foo@bar.com")
        expect(new_user).not_to be_valid
      end
    end

    #Password Check
    it 'is not valid if password is blank' do
      new_user = build(:user, password: "")
      expect(new_user).not_to be_valid
    end

    it "is not valid with a 7 letter password" do
      new_user = build(:user, password: "foooooo")
      expect(new_user).not_to be_valid
    end

    it "is not valid with a 25 letter password" do
      new_user = build(:user, password: "foobarfoobarfoobarfoobar")
      expect(user).not_to be_valid
    end

    #Associations Check

    it "responds to :profile" do
      expect(user).to respond_to(:profile)
    end

    it "responds to :posts" do
      expect(user).to respond_to(:posts)
    end

    it "responds to :comments" do
      expect(user).to respond_to(:comments)
    end

  #Methods Check

    it 'generates auth_token' do
      expect(user.auth_token).not_to be_nil
    end

    it 'regenerates different auth_token' do
      token = user.auth_token
      user.regenerate_auth_token
      expect(user.auth_token).not_to eq(token)
    end

end