# frozen_string_literal: true

class Admin::BaseController < ApplicationController
  include Pagy::Backend
  layout 'admin/base'

  before_action :set_time_zone
  before_action :authenticate_admin!

  def set_time_zone
    Time.zone = cookies[:time_zone]
  end
end
