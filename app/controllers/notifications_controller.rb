class NotificationsController < ApplicationController

  def create
    list = List.find(params[:list_id])
    render json: list.notifications.create(notifications_params), status: :ok
  end

  private

  def notifications_params
    params.require(:notification).permit(:role,:phone)
  end

end
