class UserDisplayController < ApplicationController

    before_action :authenticate_student!

    def index
        
    end
end
