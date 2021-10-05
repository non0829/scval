class LikesController < ApplicationController

    def create
        like = current_student.likes.create(talk_id: params[:talk_id]) 
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        like = Like.find_by(talk_id: params[:talk_id], student_id: current_student.id)
        like.destroy
        redirect_back(fallback_location: root_path)
    end

end
