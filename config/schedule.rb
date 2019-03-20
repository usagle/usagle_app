every 1.day do
  runner "User.send_daily_email"
end

every 60.minutes do
  rake "ts:index"
end