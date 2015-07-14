require 'rails_helper'

describe User do
  it { should have_valid(:username).when('username') }
  it { should have_valid(:username).when('anothername123') }
  it { should_not have_valid(:username).when('') }
  it { should_not have_valid(:username).when(nil) }
  it { should_not have_valid(:username).when('with space') }
  it { should_not have_valid(:username).when('upsernamethatgoesonforever') }
  it { should_not have_valid(:username).when('with#$%^characters') }

  it { should have_valid(:email).when('user@aexample.com', 'another@gmail.com') }
  it { should_not have_valid(:email).when(nil, '', 'user', 'users@com', 'users.com', 'usersuser@anothername123') }

  it 'has a matching password confirmation for the password' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'anotherpassword'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end