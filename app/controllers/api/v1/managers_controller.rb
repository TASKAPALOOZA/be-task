class Api::V1::ManagersController < ApplicationController

  def new 

  end 

  def create 
    manager = Manager.new(manager_params)   
    if params[:name].blank? || params[:password].blank? || params[:password_confirmation].blank?
      render json: SadpathSerializer.incomplete_fields, status: :bad_request
    elsif Manager.find_by(email: manager.email)
      render json: SadpathSerializer.email_in_use, status: :bad_request
    elsif
      params[:password] != params[:password_confirmation]
      render json: SadpathSerializer.password_mismatch, status: :bad_request
    elsif manager.save
      render json: ManagerSerializer.new_manager_data(manager), status: 201
    end
  end 


  private 
    def manager_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
end 