class WelcomeController < ApplicationController
  protect_from_forgery :except => [:comment]
  def index
    @rests=Nanao.all
  end

  def practice
  end
  def practice2
    if params[:name].present?
      i = 0
      while i < params[:name].length do
         Nicole.find_or_initialize_by(ipaddress: request.remote_ip, name: params[:name][i]).update_attributes(name: params[:name][i], comment: params[:comment][i], ipaddress: request.remote_ip)
         
        #  Nicole.create(name: params[:name][i], comment: params[:comment][i], ipaddress: request.remote_ip)
        #  Nicole.create(name: params[:name][i], comment: request.remote_ip)

         i=i+1
      end
    end

    # @comments=Nicole.all.order(id: "DESC")
    
    # ipを格納
    # @ips=Nicole.group('ip').select('ip')
    # @ips=Nicole.group('ipaddress')
    @ips=Nicole.select('ipaddress').distinct
    #
    # @comments=Array.new
    # @ips.each do |ip|
    #   @comments.push(Nicole.where(ipaddress: ip.ipaddress) )
    # end
  
  end
  
  def comment
    if params[:name].present?
      i = 0
      while i < params[:name].length do
         Nicole.find_or_initialize_by(ipaddress: request.remote_ip, name: params[:name][i]).update_attributes(name: params[:name][i], comment: params[:comment][i], ipaddress: request.remote_ip)
         
        #  Nicole.create(name: params[:name][i], comment: params[:comment][i], ipaddress: request.remote_ip)
        #  Nicole.create(name: params[:name][i], comment: request.remote_ip)

         i=i+1
      end
    end

    # @comments=Nicole.all.order(id: "DESC")
    
    # ipを格納
    # @ips=Nicole.group('ip').select('ip')
    # @ips=Nicole.group('ipaddress').sum('id')
    @ips=Nicole.select('ipaddress').distinct

    # @ips=Nicole.select('DISTINCT ON (ipaddress)')
    #

    @comments=Array.new
    @ips.each do |ip|
      @comments.push(Nicole.where(ipaddress: ip.ipaddress) )
    end
  
  end
  
  def search
    if params[:name].present?  
 
      if params[:touchless].present? 
  
          if params[:mask].present?
  
              if params[:takeout].present?  #name,touchless,mask,takeout
               @rests = Nanao.where('name LIKE ?', "%#{params[:name]}%").where(touchless: true).where(mask: true).where(takeout: true)
              else  #name,touchless,mask
               @rests = Nanao.where('name LIKE ?', "%#{params[:name]}%").where(touchless: true).where(mask: true) 
              end
  
          else
              if params[:takeout].present?  #name,touchless,takeout
               @rests = Nanao.where('name LIKE ?', "%#{params[:name]}%").where(touchless: true).where(takeout: true)
              else  #name,touchless
               @rests = Nanao.where('name LIKE ?', "%#{params[:name]}%").where(touchless: true)
              end
          end
  
      else
          if params[:mask].present?
             
              if params[:takeout].present?  #name,mask,takeout
               @rests = Nanao.where('name LIKE ?', "%#{params[:name]}%").where(mask: true).where(takeout: true) 
              else  #name,mask
               @rests = Nanao.where('name LIKE ?', "%#{params[:name]}%").where(mask: true) 
              end
  
          else
              if params[:takeout].present?  #name,takeout
               @rests = Nanao.where('name LIKE ?', "%#{params[:name]}%").where(takeout: true)
              else  #name
               @rests = Nanao.where('name LIKE ?', "%#{params[:name]}%")
              end
          end
      end
      
    else

      if params[:touchless].present?
   
           if params[:mask].present?
   
               if params[:takeout].present?  #touchless,mask,takeout
                @rests = Nanao.where(touchless: true).where(mask: true).where(takeout: true) 
               else  #touchless,mask
                @rests = Nanao.where(touchless: true).where(mask: true) 
               end
   
           else
               if params[:takeout].present?  #touchless,takeout
                 @rests = Nanao.where(touchless: true).where(takeout: true) 
               else  #touchless
                 @rests = Nanao.where(touchless: true) 
               end
           end
   
       else
           if params[:mask].present?
   
               if params[:takeout].present?  #mask,takeout
                 @rests = Nanao.where(mask: true).where(takeout: true)  
               else  #mask
                 @rests = Nanao.where(mask: true)
               end
   
           else
               if params[:takeout].present?  #takeout
                 @rests = Nanao.where(takeout: true) 
               else  #none
                 @rests = Nanao.none 
               end
           end
       end
    end

  end



  def admin
  end

  def result
    # Nanao.create(name: params[:name],
    #         address: params[:address],
    #         alcohol: params[:alcohol],
    #         mask: params[:mask],
    #         time: params[:time],
    #         takeout: params[:takeout],
    #         touchless: params[:touchless],
    #         card: params[:card],
    #         linepay: params[:linepay],
    #         paypay: params[:paypay],
    #         payid: params[:payid],
    #         quicpay: params[:quicpay],
    #         seat: params[:seat],
    #         contact: params[:contact],
    #         toilet: params[:toilet],
    #         airing: params[:airing],
    #         outdoor: params[:outdoor],
    #         temp: params[:temp],
    #         atom: params[:atom],
    #         plate: params[:plate],
    #         rate: params[:rate])
  end

end
