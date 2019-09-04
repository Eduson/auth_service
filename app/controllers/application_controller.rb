# frozen_string_literal: true
class ApplicationController < ActionController::API
  before_action :authenticate_user!, only: [:auth_ping]

  def ping
    render plain: 'pong'
  end

  def auth_ping
    render plain: 'auth-pong'
  end

  def render_resource(resource)
    response.set_header('Access-Control-Expose-Headers', 'Authorization')
    if resource.errors.empty?
      render json: resource, status: 201
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
        {
          status: '400',
          title: 'Bad Request',
          detail: resource.errors,
          code: '100'
        }
      ]
    }, status: :bad_request
  end
end
