class Admin::MembersController < ApplicationController
<<<<<<< HEAD
=======

  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

>>>>>>> 18066bc08245cc68b20f5e7aa468eaac8eaddad6
end
