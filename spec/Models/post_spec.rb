
require 'rails_helper'

describe Post do

  let(:post){ build(:post) }

  #Basic Validity Check
  describe 'attributes' do

    it 'default post is valid' do
      expect(post).to be_valid
    end

    #Validations check
    

    it 'invalid if user is nil' do
      new_post = build(:post, user: nil)
      expect(new_post).not_to be_valid
    end
    #Is this the best way to check for presence?

    it 'invalid if body is nil' do
      new_post = build(:post, body: "")
      expect(new_post).not_to be_valid
    end
    #Or should it be an empty string?
  end

  #Associations Check
  describe 'associations' do
    
    it 'belongs to user' do
      expect(post).to respond_to(:user)
    end

    it 'has many comments' do
      expect(post).to respond_to(:comments)
    end
  end
end