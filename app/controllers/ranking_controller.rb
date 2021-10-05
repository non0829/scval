class RankingController < ApplicationController

    def index 
        @students = Student.where(group_code: current_student.group_code)
        @score = [{
            team: 1,
            point: 0,
        },{
            team: 2,
            point: 0,
        },{
            team: 3,
            point: 0,
        },{
            team: 4,
            point: 0,
        },{
            team: 5,
            point: 0,
        }]

        @students.each do |s| 
            @score[s.team - 1][:point] += s.point
        end

        @score = @score.sort_by { |a| -a[:point] }
    end

end
