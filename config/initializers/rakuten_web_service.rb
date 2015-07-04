RakutenWebService.configuration do |c|
  c.application_id = Rails.application.secrets.rakuten_app_id
  c.affiliate_id = Rails.application.secrets.rakuten_affiliate_id
end
