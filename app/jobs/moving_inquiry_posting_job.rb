class MovingInquiryPostingJob < ApplicationJob
  queue_as :default

  def perform(moving_inquiry_id)
    # Do something later
    moving_inquiry = MovingInquiry.find(moving_inquiry_id)
    MovuConnector.post(moving_inquiry)
    ClientMailer.client(moving_inquiry).deliver_later

    # return if user_signed_in?

    # InquiryPoster.post(moving_iquiry)

  end

  # def perform(user_id)
  #   user = User.find(user_id)
  #
  #   return if user.admin?
  #
  #   unless user.confirmed?
  #     OnboardingJob.set(wait: 1.hour).perform_later(user.id)
  #     return
  #   end
  #
  #   if user.student?
  #     WelcomeMailer.student(user).deliver_later
  #     FollowUpOnboardingJob.set(wait_until: Date.tomorrow.noon).perform_later(user.id)
  #   elsif user.teacher?
  #     WelcomeMailer.teacher(user).deliver_later
  #   end
  # end
end
