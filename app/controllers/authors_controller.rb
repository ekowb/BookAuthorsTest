class AuthorsController < ApplicationController

    def index
        @authors = Author.all
        render :index
    end

    def new
        @author = Author.new
        render :new
    end

    def create
        @author = Author.new(author_params)
        if @author.valid?
            @author.save
            redirect_to(author_path(@author))
        else
            flash[:error] = @author.errors.full_messages
            render :new
        end
    end

    def show
        @author = Author.find(params[:id])
        render :show
    end

    def edit
        @author = Author.find(params[:id])
        render :edit
    end

    def update
        @author = Author.find(params[:id])
        @author.assign_attributes(author_params)
        if @author.valid?
            @author.save
            redirect_to(author_path(@author))
        else
            flash[:error] = @author.errors.full_messages
            render :edit
        end
    end

    def destroy
        @author = Author.find(params[:id])
        @author.destroy
        redirect_to(authors_path(@author))
    end

    private

    def author_params
        params.require(:author).permit(:name, :birth_year, book_ids:[])
    end 
end