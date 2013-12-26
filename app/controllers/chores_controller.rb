class ChoresController < ApplicationController

  def completed
    list_id = params[:list_id]
    chore_id = params[:chore_id]

    head :bad_request if list_id.blank? or chore_id.blank?

    list = List.find(list_id)
    chore = list.chores.find_by_id(chore_id)
    chore.isDone = true
    chore.save!

    notify_email = list.notifications.where(:role=>'admin')
    notify_email.each do |notify|
      ChoreMailer.chore_completed(chore,notify.phone).deliver
    end

    render :json => chore, :status=>:ok
  end

  def create
    list = List.find(params[:list_id])
    chore = list.chores.create(chore_params)
    notify_email = list.notifications.where(:role=>'choree')
    notify_email.each do |email|
      ChoreMailer.chore_added(chore,email.phone).deliver
    end
    render :json => chore, :status=>:ok
  end

  def destroy
    list = List.find(params[:list_id])
    render :json=>list.chores.find(params[:id]).destroy, :status=>:ok
  end

  private

  def chore_params
    params.require(:chore).permit(:name)
  end

end
