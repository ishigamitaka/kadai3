class UsersController < ApplicationController
  def edit
    @user = current_user
    
  end
  
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    #@books = @user.books    
    @books = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path
  end
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    if @user.save
      flash[:notice] = "Welcome! You have signed up successfully."
    redirect_to user_path(current_user)
    else
      @user = User.find(params[:id])
      @book = Book.new
      render :show
    end
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
