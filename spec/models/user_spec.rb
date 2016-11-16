require 'rails_helper'

RSpec.describe User, type: :model do

# It must be created with a password and password_confirmation fields

  describe 'Validations' do
    it "user must be created with a password and password_confirmation" do
      # SETUP
      @user=User.new(first_name: "test", last_name: "test", email: "something@gmail.com", password: "asdfasdf", password_confirmation: "asdfasdf")
      
      # EXERCISE (none)
      
      # VERIFY
      # expect(@user.save).to be(true)
      expect(@user.valid?).to be(true)
    end

    it "user will not be created if password and password_confirmation do not match" do
      @user=User.new(first_name: "test", last_name: "test", email: "something@gmail.com", password: "qwerqwer", password_confirmation: "asdfasdf")
      expect(@user.save).to be(false)
    end

    it "will not be created if email is already in the DB" do
      @user1=User.new(first_name: "test", last_name: "test", email: "something@gmail.com", password: "qwerqwer", password_confirmation: "asdfasdf")
      @user1.save
      @user2=User.new(first_name: "test", last_name: "test", email: "something@gmail.com", password: "qwerqwer", password_confirmation: "asdfasdf")
      expect(@user2.save).to be(false)
    end

    it "will not be created if email is already in the DB but different character case" do
      @user1=User.new(first_name: "test", last_name: "test", email: "SOMETHING@gmail.com", password: "qwerqwer", password_confirmation: "asdfasdf")
      @user1.save
      @user2=User.new(first_name: "test", last_name: "test", email: "something@gmail.com", password: "qwerqwer", password_confirmation: "asdfasdf")
      expect(@user2.save).to be(false)
    end

    it "user will not be created if first_name is missing" do
      @user=User.new(last_name: "test", email: "something@gmail.com", password: "asdfasdf", password_confirmation: "asdfasdf")
      expect(@user.save).to be(false)
    end

    it "user will not be created if last_name is missing" do
      @user=User.new(first_name: "test", email: "something@gmail.com", password: "asdfasdf", password_confirmation: "asdfasdf")
      expect(@user.save).to be(false)
    end

    it "user will not be created if email is missing" do
      @user=User.new(first_name: "test", last_name: "test", password: "asdfasdf", password_confirmation: "asdfasdf")
      expect(@user.save).to be(false)
    end

    it "password must be longer than 8 characters" do
      @user=User.new(first_name: "test", last_name: "test", email: "test@gmail.com", password: "", password_confirmation: "")
      expect(@user.save).to be(false)
    end

    it "password is at least 8 characters" do
      @user=User.new(first_name: "test", last_name: "test", email: "test@gmail.com", password: "12345678", password_confirmation: "12345678")
      expect(@user.save).to be(true)
    end

  end

  describe '.authenticate_with_credentials' do

    before(:each) do
      @user1=User.new(first_name: "test", last_name: "test", email: "test@gmail.com", password: "12345678", password_confirmation: "12345678")
      @user1.save
    end

    it "should login if email and password match user in DB" do
      
      @user2 = User.authenticate_with_credentials("test@gmail.com", "12345678")
      expect(@user2).to eq(@user1)

      # expect(actual).to eq(expected) # passes if actual == expected

      # NOTE - this method tests if authenticated, but doesn't actually test if session was created
      # Would need to use something like CapyBara to do this - would check if the cookie was set

    end

    it "should login with leading spaces in email" do

      @user2 = User.authenticate_with_credentials("  test@gmail.com", "12345678")
      expect(@user2).to eq(@user1)

    end

    it "should login if character case in email is different than DB" do

      @user2 = User.authenticate_with_credentials("TEST@gmail.com", "12345678")
      expect(@user2).to eq(@user1)
    end

  end

end

# Here are the things to test for in this model's validations:


# These need to match so you should have an example for where they are not the same
# These are required when creating the model so you should also have an example for this
# Emails must be unique and case sensitivity should not be taken into account (TEST@TEST.com should not be allowed if test@test.COM is in the database)
# Email, first name, and last name should also be required