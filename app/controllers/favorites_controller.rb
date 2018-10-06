class FavoritesController < ApplicationController
  before_action :must_logged_in, only: %i[index]

    def index
      @favorite_blogs = current_user.favorites
    end

    def create
      favorite = current_user.favorites.create(blog_id: params[:blog_id])
      redirect_to blogs_url, notice: "#{favorite.blog.user.name}さんのブログをお気に入りに登録しました。"
    end

    def destroy
      favorite = current_user.favorites.find_by(blog_id: params[:blog_id]).destroy
      redirect_to blogs_url, notice: "#{favorite.blog.user.name}さんのブログをお気に入りに登録しました。"
    end

    private
    
    def must_logged_in
      redirect_to new_session_path unless logged_in?
    end
end
