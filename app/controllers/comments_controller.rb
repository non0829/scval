class CommentsController < ApplicationController

    def index
        @talk = Talk.find(params[:talk_id])
        @comments = @talk.comments
        @comment = Comment.new
    end

    def create
        talk = Talk.find(params[:talk_id])
        comment = talk.comments.build(comment_params)
        
        if student_signed_in?
            comment.student_id = current_student.id
            comment.name = current_student.name
        else group_signed_in? 
            comment.student_id = current_group.id
            comment.name = current_group.name
        end
        if comment.save
            redirect_back(fallback_location: root_path)
        else
            redirect_back(fallback_location: root_path)
        end
    end

    private
        def comment_params
        params.require(:comment).permit(:content, :name)
        end
end
