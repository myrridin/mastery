Rails.application.config.middleware.use OmniAuth::Builder do

  CLIENT_ID = "482752331853-s0hlcvgactlrmpqmd5h3j6av3s6vu7tt.apps.googleusercontent.com"
  CLIENT_SECRET = "JpLBs8SB4rFtW6oQj7bw8y1A"
  provider :google_oauth2, CLIENT_ID, CLIENT_SECRET
end