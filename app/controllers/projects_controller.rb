class ProjectsController < ApplicationController

	def index
  @projects = Project.all
  end

	def new
		@project = Project.new
	end

def create
  @project = Project.new(params[:project])
  if @project.save
    flash[:notice] = "Project has been created."
    redirect_to @project
  else
    flash[:alert] = "Project has not been created."
    render :action => "new"
  end
end


def show 
	@project = Project.find(params[:id])
end

def edit
@project = Project.find(params[:id])
end

def update
  @project = Project.find(params[:id])
  @project.update_attributes(params[:project])  
  flash[:notice] = "Project has been updated."
  redirect_to @project
end

def destroy
@project = Project.find(params[:id])
@project.destroy
flash[:notice] = "Project has been deleted."
redirect_to projects_path
end

end

#begin
#{
 # "commit"     => "Create Project",
 # "action"     => "create",
 # "project"    => {
 #   "name" => "TextMate 2",
 #   "description" => "A text-editor for OS X"
 # },
 # "controller" => "projects"
#}
 #emd