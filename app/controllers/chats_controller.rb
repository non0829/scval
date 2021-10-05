class ChatsController < ApplicationController

    def index
        @chats = Chat.all.order(id: "DESC")
    end

    def new
        @chat = Chat.new
    end

    def create
        chat = Chat.new(chat_params)
        if group_signed_in? && chat.name
            chat.name = current_group.name
        end

        if chat.save
            redirect_to action: :index
        else
            redirect_to action: :new
        end
    end

    def edit
        @chat = Chat.find(params[:id])
    end

    def update
        chat = Chat.find(params[:id])
        if chat.update(chat_params)
            redirect_to action: :index
        else
            redirect_to action: :new
        end
    end
    
    def destroy
        chat = Chat.find(params[:id])
        chat.destroy
        redirect_to action: :index
    end

    private
    def chat_params
        params.require(:chat).permit(:name, :title, :content)
    end
end
