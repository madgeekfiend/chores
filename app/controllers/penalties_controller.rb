class PenaltiesController < ApplicationController

  def create
    list = List.find(params[:list_id])
    penalty = list.penalties.create(chore_params)
    notify_email = list.notifications.where(:role=>'choree')
    notify_email.each do |email|
      ChoreMailer.penalty_added(penalty,email.phone).deliver
    end
    render :json => penalty, :status=>:ok
  end

  def destroy
    list = List.find(params[:list_id])
    render :json=>list.penalties.find(params[:id]).destroy, :status=>:ok
  end

  private

  def chore_params
    params.require(:penalty).permit(:name,:amount)
  end

end
