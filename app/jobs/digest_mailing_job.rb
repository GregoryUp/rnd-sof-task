class DigestMailingJob < ApplicationJob
  queue_as :default

  attr_accessor :subscr_type, :from_date, :till_date

  def perform
    @recipients = User.where(subscription_type: @subscr_type)

    @posts = News.where(publish_date: @from_date..@till_date).order(publish_date: :desc)

    @recipients.each do |r|
      do_mailing(r, @posts) unless @posts.empty? # abstract do_mailing
    end

  end

end
