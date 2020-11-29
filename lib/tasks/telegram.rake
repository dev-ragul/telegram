task :candler_member_upload => :environment do

require 'telegram/bot'
require 'rubygems'
require 'open-uri'
require 'httpclient'
require 'uri'
require "shorturl"


token = '1345971771:AAECG5v9f2_VTmpjEbDCDHTg6B5MLiWbciQ'

Telegram::Bot::Client.run(token) do |bot|
  
  bot.listen do |message|
     
      puts "---------------"+message.text.to_s

      content = message.text
      if content 
        urls = content.split(/\s+/).find_all { |u| u =~ /^https?:/ }
      else
        urls = []

      end

      puts "-----------"+urls.to_s

      if urls.any?
          puts "inside url present"+content.to_s
          desc = message.text.gsub(urls[0],"")
          puts "------------dddd-----------"+urls[0].to_s
          original_url = urls[0].to_s
        
          if original_url.include? "amazon" or  original_url.include? "flipkart"
            first_url = original_url

          else
          
            first_url =  HTTPClient.new.head(urls[0]).header['Location'][0]
          end
        puts "------First Url----------------"+first_url.to_s

        if first_url.include? "fkrt.it"
          puts "flipkart deny"
        
        elsif first_url.include? "amazon"

          

          #puts "------First Url----------------"+first_url.to_s
          
          #final_url = HTTPClient.new.head(first_url).header['Location'][0]


          if first_url.nil? || first_url.empty?
              puts "do nothing in amazon"
            
            else

              if first_url.include? "techglare-21"


              new_url = first_url.gsub('techglare-21','ragulstore06-21')
              elsif first_url.include? "shiv12200-21"
              new_url = first_url.gsub('shiv12200-21','ragulstore06-21')
              elsif first_url.include? "a10i2-21"
              new_url = first_url.gsub('a10i2-21','ragulstore06-21')

            elsif first_url.include? "dsweb-21"
              new_url = first_url.gsub('dsweb-21','ragulstore06-21')
              end

            puts "---------amazon-------"+new_url.to_s
            new_url = ShortURL.shorten(new_url)
            

      
        

           str = "https://api.telegram.org/bot1345971771:AAECG5v9f2_VTmpjEbDCDHTg6B5MLiWbciQ/sendMessage?chat_id=@thefastlooterss&text=Testing%20if%20this%20works"


            uri = URI.parse(str)
            query = URI.decode_www_form(uri.query).to_h
            query['text'] = desc + " "+ new_url
            uri.query = URI.encode_www_form(query)

            puts "--------------"+uri.to_s

            @data = URI.parse(uri.to_s).read

          end  
        
        elsif first_url.include? "flipkart"
          puts "------Coming inside flipkart------"
          puts "-------------"+first_url.to_s

          if first_url.include? "ss6964892"
            first_url = (first_url).gsub("affid=ss6964892","")
          elsif first_url.include? "chintuhar"
            first_url = (first_url).gsub("affid=ss6964892","")
          end


          new_url = "https://inr.deals/track?id=rag620954502&src=backend&url="+first_url.to_s
          new_url = ShortURL.shorten(new_url)
           str = "https://api.telegram.org/bot1345971771:AAECG5v9f2_VTmpjEbDCDHTg6B5MLiWbciQ/sendMessage?chat_id=@thefastlooterss&text=Testing%20if%20this%20works"


          uri = URI.parse(str)
          query = URI.decode_www_form(uri.query).to_h
          query['text'] = desc + ""+ new_url
          uri.query = URI.encode_www_form(query)

          puts "--------------"+uri.to_s

          @data = URI.parse(uri.to_s).read
        

        end

        end

    
  end
end
end