class Public::MembersController < ApplicationController


  def show
    @member = current_member
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    if @member.update(member_params)
      redirect_to member_path, notice: "編集内容を保存しました。"
    else
      render :edit
    end
  end

  def leave
    @member = current_member
  end
  
  def actived
    @member = current_member
    @member.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用をお待ちしております。"
    redirect_to root_path
  end


  private
  def member_params
    params.require(:member).permit(:email, :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :phone_number)
  end


end


