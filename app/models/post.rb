class Post < ApplicationRecord
  after_create_commit :notify_slack

  def notify_slack
    notifier = Slack::Notifier.new ENV['WEBHOOK_URL'] do
      defaults channel: "#slacknotifier",
      username: "abdsparsha"
    end

    notifier.ping "Post with title #{title} & body #{body} created successfully."
  end
end
