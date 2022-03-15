class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 3 }, presence: true
  validates :password_confirmation, length: { minimum: 3 }, presence: true
  validates :email, uniqueness: { case_sensitive: false }, presence: true

  # def validate(input)
  #   validates :user, presence: true,
  #   if validate[:users].any? { |user| input.send(user) == "Evil" }
  #   input.errors.add :user, "Credential false"
  #   end
  # end

  def authenticate_with_credentials()
    user = User.find_by(username: params['username'])
    if user && user.authenticate(params['password'])
      toketoken = JWT.encode({user_id: user.id}, 'mykey', 'HS256')
      render json: { user: user, token: token }
    else 
      render json: { error: 'invalid credentials' }, status: 401
    end 
  end 
end

