require 'rails_helper'

describe Comment do

  let(:comment){ create(:comment) }
  #should this be build or create?

  #Check Validations
    it 'has valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid if body is empty' do
      new_user = build(:user, body: "")
      expect(new_user).not_to be_valid
    end

  #Check Associations
  it "responds to :user" do
      expect(comment).to respond_to(:user)
    end

  it "responds to :user" do
      expect(comment).to respond_to(:post)
    end

end

