class NotificationsController < ApplicationController
  def index
    @notifications = current_user.passive_notifications.includes(:visitor).page(params[:page]).per(15)
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end
end
