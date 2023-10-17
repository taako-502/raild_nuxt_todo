# frozen_string_literal: true

module Api
  class TasksController < ApplicationController
    before_action :set_user

    # POST /api/users/:user_id/tasks
    def create
      @task = @user.tasks.new(task_params)
      if @task.save
        render json: @task, status: :created
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end

    private

    def set_user
      @user = User.find(params[:user_id])
    end

    def task_params
      params.require(:task).permit(:content)
    end
  end
end
