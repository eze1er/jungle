RSpec.describe User, type: :model do

  describe 'Validations' do
    # validation examples here
    it "is valid with valid attributes" do
      @user = User.create(
        first_name: "Ezechiel", 
        last_name: "Iti", 
        email: "a@aol.com", 
        password: "1234567", 
        password_confirmation: "1234567"
      )
      expect(@user).to be_valid
      
    end 
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it "should only create user with valid passwords" do
      @user = User.create(first_name: "Ezechiel", last_name: "Iti", email: "a@aol.com", password: "1234567", password_confirmation: "1234567")
      expect(@user).to be_valid
    end
  end
end

