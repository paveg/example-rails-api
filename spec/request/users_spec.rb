require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET users/1' do
    # it is easy to write, use Fixtures or FactoryGirl.
    User.create(name: "ryota", mail: "ryota@example.com")

    it 'can get user info' do
      get '/users/1'

      expect(response).to have_http_status(:ok)
      expect(response.body).to be_json_as(
                                 id:       1,
                                 name:     "ryota",
                                 mail:     "ryota@example.com",
                                 password: "xxxxxxxx"
                               )
    end
  end
end
