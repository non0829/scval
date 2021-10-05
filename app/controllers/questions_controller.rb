class QuestionsController < ApplicationController

    def index
        @questions = Question.all.order(id: "DESC")
    end

    def new
        @question = Question.new
    end

    def create
        question = Question.new(question_params)
        question.name = current_student.name
        question.student_id = current_student.id
        if question.save
            redirect_to action: :index
        else
            redirect_to action: :new
        end
    end

    def edit
        @question = Question.find(params[:id])
    end

    def update
        question = Question.find(params[:id])
        if question.update(question_params)
            redirect_to :action => "index"
        else
            redirect_to :action => "edit"
        end
    end

    private
    def question_params
        params.require(:question).permit(:name, :title, :content, :answer)
    end
end
