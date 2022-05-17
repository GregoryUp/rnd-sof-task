class WeeklyDigestMailingJob < ApplicationJob

  def initialize
    @subscr_type = 'weekly'
    @till_date = Time.parse("07:00") - 1
    @from_date = @till_date - 1.week + 1
  end

  def do_mailing(p_user, p_posts)
    UserMailer.with(user: p_user, blog_posts: p_posts).weekly_digest_email.deliver_now
  end

end
