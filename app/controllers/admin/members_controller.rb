class Admin::MembersController < ApplicationController
  
<<<<<<< HEAD
  def index
    @members = Member.all
  end
  
  def show
    @member = Member.find(params[:id])
  end
  
  def edit
    @member = Member.find(params[:id])
  end
=======
>>>>>>> 47c114a254ec6824368ce7720bd691b8bae5d795
end
