class TrainerController < ApplicationController

  before_filter :authenticate_user!
  before_filter :required_trainer
  
  def dashboard
  end
end
