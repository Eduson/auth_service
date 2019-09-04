require 'swagger_helper'

describe 'Users API', type: :request, swagger_doc: 'v1/swagger.json' do
  path '/users/sign_up' do
    post 'Creates a user' do

      tags 'Authentication'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
              email: { type: :string },
              password: { type: :string },
              password_confirmation: { type: :string }
          },
          required: %w[email password password_confirmation]
      }

      produces 'application/json'

      response '201', 'user created' do
        let(:user) { { user: { email: 'foo@example.com', password: 'password123', password_confirmation: 'password123' } } }
        include_context 'with integration test'
      end

      response '400', 'invalid request' do
        let(:user) { { email: 'foo' } }
        include_context 'with integration test'
      end
    end
  end
end