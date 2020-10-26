class Admin::MembersController < ApplicationController

  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
    redirect_to admin_members_path
    else
    render "edit"
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  private
  def member_params
  params.require(:member).permit(:email, :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :phone_number, :is_deleted)
  end

end
