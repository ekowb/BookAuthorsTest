class BooksController < ApplicationController

    def index
        @books = Book.all
        render :index
    end

    def new
        @book = Book.new
        render :new
    end

    def create
        @book = Book.new(book_params)
        if @book.valid?
            @book.save
            redirect_to(books_path(@book))
        else
            flash[:error] = @book.errors.full_messages
            render :new
        end
    end

    def show
        @book = Book.find(params[:id])
        render :show
    end

    def update
        @book = Book.find(params[:id])
        @bookauthor = BookAuthor.create(book_id: params[:id], author_id: params["book"]["author_ids"])
        redirect_to(book_path(@book))
    end

    private

    def book_params
        params.require(:book).permit(:title, :pages, author_ids:[])
    end 
end