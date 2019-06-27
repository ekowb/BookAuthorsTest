class BookAuthorsController < ApplicationController
    def destroy
        @book_author= BookAuthor.find(params[:id]).destroy
        redirect_to("/books/#{@book_author.book_id}")
    end
end