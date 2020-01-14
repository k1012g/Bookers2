class DailyMailer < ApplicationMailer
	def send_daily_to_user
		mail(bcc: User.pluck(:email), subject:"1日1回確認メールを送信")
	end
end
