class Admin::MembersController < ApplicationController

  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end



  def edit
    @member = Member.find(params[:id])
  end

<<<<<<< HEAD
=======


>>>>>>> 7ab09a4c272b20ed88a1bfdc1db21c3efefd71e7
end
