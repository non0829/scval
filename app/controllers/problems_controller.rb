class ProblemsController < ApplicationController
    def index
        @problems = Problem(params[:test_id])
    end
end
