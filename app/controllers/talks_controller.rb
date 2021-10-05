class TalksController < ApplicationController

    def index
        @talks = Talk.all.order(id: "DESC")
    end

    def new
        @talk = Talk.new
    end

    def create
        talk = Talk.new(talk_params)
        if student_signed_in?
            talk.student_id = current_student.id
            talk.name = current_student.name
        else group_signed_in? 
            talk.group_id = current_group.id
            talk.name = current_group.name
        end

        if talk.save
            redirect_to action: :index
        else
            redirect_to action: :new
        end
    end

    def edit
        @talk = Talk.find(params[:id])
    end

    def update
        talk = Talk.find(params[:id])
        if talk.update(talk_params)
            redirect_to action: :index
        else
            redirect_to action: :edit
        end
    end
    
    def destroy
        talk = Talk.find(params[:id])
        talk.destroy
        redirect_to action: :index
    end

    private
    def talk_params
        params.require(:talk).permit(:name, :content)
    end
    
end
