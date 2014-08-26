require 'aliwal/handler/base'
require 'uri'
require 'cgi'

module Echo
  class AboutHandler < Aliwal::Handler::Base
    def about
      url = 'https://photos-5.dropbox.com/t/0/AADaa6G6alunZ6lLkqIYP1bQKxdrbBuy9UNIOhOilVCVzA/12/44172075/jpeg/1024x768/3/1409018400/0/2/2014-04-16%2015.05.40.jpg/PYyUztczRulnPhHMq973TPf6cV7JWeCC0vZMkjMoIao'
      send_image(url: url)
    end

    def jon
      send_image(url: 'https://fbcdn-sphotos-b-a.akamaihd.net/hphotos-ak-xfa1/v/t1.0-9/319312_2444382787550_31581409_n.jpg?oh=52d6df54d6a1bac5cbb87d4ef7e55642&oe=5468E996&__gda__=1417759213_a68debd122e78219e016fff2b6663f13')
    end
  end
end
