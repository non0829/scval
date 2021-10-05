class TestsController < ApplicationController

    def index
        # @tests = Test.all
        @tests = params[:tag_id].present? ? Tag.find(params[:tag_id]).tests : Test.all
    end

    def new
        @test = Test.new
    end

    def create
        test = Test.new(test_params)
        test.group_code = current_group.code
        test.group_id = current_group.id
        if test.save
            redirect_to action: :index
        else
            render action: :new
        end
    end
    
    def show
        @test = Test.find(params[:id])
        @problems = Problem.where(test_id: params[:id])
        @choices = Choice.all
    end

    def destroy
        test = Test.find(params[:id])
        test.destroy
        redirect_to action: :index
    end

    def answer 
        @test = Test.find(params[:id])
        @problems = Problem.where(test_id: params[:id])
        @choices = Choice.all
        @student = current_student
        @right_count = 0
        @total_count = 0
        @problems.each do |p|
            @total_count += 1
            if params["quiz#{p.id}"] == "true"
                @right_count += 1
                @student.point += 1
            end
        end

        @student.update(point: @student.point, id: @student.id)
    end

    private
    def test_params
        params.require(:test).permit(:title, :content, :image, :advice, tag_ids: [],
            problems_attributes: [:content, :image,
            choices_attributes: [:content, :is_answer]])
    end
end
