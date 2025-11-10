class AdminController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    # Admin dashboard logic here
  end
end