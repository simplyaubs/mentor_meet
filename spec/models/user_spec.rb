require 'spec_helper'

describe User do
  it 'can create a user from an omniauth hash ' do
    input = {
      'provider' => 'something',
      'uid' => 'something',
      'info' => {
        'email' => 'something',
        'name' => 'something',
        'image' => 'http://example.com/my_avatar'
      }

    }
    expect { User.create_with_omniauth(input) }.to change { User.count }.by(1)

    created_user = User.last
    expect(created_user.avatar).to eq("http://example.com/my_avatar")
  end
end