class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  # user infomation
  def show
    @book = Book.find(isbn: params[:isbn])
  end

  def search
    # if db_only?
    #
    # else
      @books = RakutenWebService::Books::Book.search(:title => params['keyword'])
      # isbns = items.collect do | item |
      #   item.isbn
      # end

    # end
  end

  def new
  end

  def edit
  end

  def book_params
    params.require(:book).permit(:isbn, :title, :subTitle, :author, :publisher, :description, :salesDate, :itemPrice, :itemUrl)
  end
end
