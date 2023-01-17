class ApplicationController < ActionController::Base
  before_action :authenticate_user! # from DEVISE GEM

end
