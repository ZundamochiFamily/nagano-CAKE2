class Public::DeliveryDestinationsController < ApplicationController
<<<<<<< HEAD
    def index
        @deliverys = DeliveryDestination.all
        @delivery = DeliveryDestination.new
    end

    def create
        @delivery = DeliveryDestination.new(delivery_params)
        @delivery.member_id = current_member.id
        if  @delivery.save
        redirect_to edit_delivery_destination_path(@delivery)
        else
        @deliverys = DeliveryDestination.all
        render 'index'
        end
    end

    def edit
        @delivery = DeliveryDestination.find(params[:id])
    end

    def update
        @delivery =DeliveryDestination.find(params[:id])
        @delivery.update(delivery_params)
        redirect_to  delivery_destinations_path
    end

    def destroy
        delivery_destination = DeliveryDestination.find(params[:id])
        delivery_destination.destroy #destroyメソッドを使用し対象のツイートを削除する。
        redirect_to delivery_destinations_path
    end

    private
    def delivery_params
        params.require(:delivery_destination).permit(:postal_code, :address, :reciever_name)
    end
=======
>>>>>>> c5c6de1406e6b632c65477b1f9ca9655df8b8fa5
end


