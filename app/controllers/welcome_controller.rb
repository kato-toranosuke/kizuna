class WelcomeController < ApplicationController
  def index
    @rests=Nanao.all
  end

  def comment
    if params[:name].present?
      Nicole.create(name: params[:name], comment: params[:comment])
    end
    @comments=Nicole.all.order(id: "DESC")
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
