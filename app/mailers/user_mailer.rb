class UserMailer < ApplicationMailer
    default from: 'info@blog-digest.test'
    layout 'user_mailer'

    def welcome_email
        @user = params[:user]
        make_bootstrap_mail(
        to: @user.email,
        # from: 'from@example.com',
        subject: 'Добро пожаловать Blog-Digest.test!',
        )
    end


    def daily_digest_email
        @user = params[:user]
        @blog_posts = params[:blog_posts]

        make_bootstrap_mail(
        to: @user.email,
        # from: 'from@example.com',
        subject: 'Ежедневная рассылка Blog-Digest.test',
        )
    end


    def weekly_digest_email
        @user = params[:user]
        @blog_posts = params[:blog_posts]

        make_bootstrap_mail(
        to: @user.email,
        # from: 'from@example.com',
        subject: 'Еженедельная рассылка Blog-Digest.test',
        )
    end
end
