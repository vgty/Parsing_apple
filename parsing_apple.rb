require 'Nokogiri'
require 'open-uri'
require 'mail'

mail_options = { address:               "smtp.gmail.com",
                 port:                  587,
                 user_name:             'XXXX@gmail.com',
                 password:              'XXXX',
                 authentication:        'plain',
                 enable_starttls_auto:  true  }

url = 'http://www.apple.com/fr/shop/product/FE865F/A/macbook-pro-avec-%C3%A9cran-retina-133-pouces-reconditionn%C3%A9-avec-processeur-bic%C5%93ur-intel-i5-%C3%A0-24-ghz'

data = Nokogiri::HTML(open(url))
disable = data.css(".as-pdp-disabledbutton").size 
if disable == 1
  exit
else
  #send email
  Mail.defaults do
    delivery_method :smtp, mail_options
  end
  Mail.deliver do
         to 'YYYY@gmail.com'
       from 'XXXX@gmail.com'
    subject "Your mac is available !"
       body "A Refurbished mac book pro with your expectations is now available! go there to buy it: \n 
            http://www.apple.com/fr/shop/product/FE865F/A/macbook-pro-avec-%C3%A9cran-retina-133-pouces-reconditionn%C3%A9-avec-processeur-bic%C5%93ur-intel-i5-%C3%A0-24-ghz"
  end
end





