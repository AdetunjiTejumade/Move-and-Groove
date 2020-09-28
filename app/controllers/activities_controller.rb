class ActivitiesController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @activities = Activity.where(:user_id => current_user.id)
    end
    
    def show
        obj =  Activity.find(params[:id])
        if current_user.id == obj.user_id
            @activity = Activity.find(params[:id])
        else
            #redirect_to activity_path
            #render plain: "Page not found"
            render file: "#{Rails.root}/public/404.html" , status: 404
        end
    end
    
    def new
        @activity = Activity.new
    end

    def edit
        @activity = Activity.find(params[:id])
    end

    def destroy
        @activity = Activity.find(params[:id])
        if @activity.destroy
            #flash[:success] = 'Activity was successfully deleted.'
            redirect_to activities_path
        else
            #flash[:error] = 'Something went wrong'
            redirect_to activities_path
        end
    end
    


    def create
        @activity = Activity.new(activity_params)
        @activity.user = current_user

        if @activity.save
           redirect_to @activity
        else
           render 'new'
        end
    end
    def update
        @activity = Activity.find(params[:id])

        if @activity.update(activity_params)
          flash[:success] = "Object was successfully updated"
          redirect_to @activity
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end
    
    private 
        def activity_params
            params.require(:activity).permit(:activity_name, :date, :duration)
        end
end
