class PostedcompletionMailer < ApplicationMailer

  def postedcompletion_mail(blog)
    @blog = blog
    @user_email = @blog.user.email
    mail to: @user_email, subject: "投稿が完了しました"
  end

end
