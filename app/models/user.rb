class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: { on: create }, length: { minimum: 8 }

  has_many :reviews
  

  def self.authenticate_with_credentials(email, password)
    # It will take as arguments: the email address and password the user typed into the login form,
    # And return: an instance of the user (if successfully authenticated), or nil (otherwise).

    # remove leading and trailing spaces and converts to lowercase
    email.strip!
    email.downcase! 

    @user = User.find_by_email(email)

    # If the user exists AND the password entered is correct.
    if @user && @user.authenticate(password)

      @user

    else
      nil
    end

  end

end
