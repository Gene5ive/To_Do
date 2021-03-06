class TasksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    if @task.save
      flash[:notice] = "Task successfully added!"
      redirect_to lists_path(@task.list)
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    @task.destroy
    redirect_to lists_path(@task.list)
  end

  def update
    @list= List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to lists_path(@task.list)
    else
      render :edit
    end
  end

  def edit
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    render :edit
  end

  def done
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    @task.update(done: true)
    redirect_to lists_path(@task.list)
  end

private
  def task_params
    params.require(:task).permit(:description)
  end
end
