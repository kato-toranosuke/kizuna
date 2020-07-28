class WelcomeController < ApplicationController
  def index
    @rests=Nanao.all
  end
  def search
    # @rests=Nanao.none
    if params[:name].present?
      @rests = Nanao.where('name LIKE ?', "%#{params[:name]}%")
    else
      @rests = Nanao.none
    end


  end



  def admin
  end

  def result
    Nanao.create(name: params[:name],
            address: params[:address],
            alcohol: params[:alcohol],
            mask: params[:mask],
            time: params[:time],
            takeout: params[:takeout],
            touchless: params[:touchless],
            card: params[:card],
            linepay: params[:linepay],
            paypay: params[:paypay],
            payid: params[:payid],
            quicpay: params[:quicpay],
            seat: params[:seat],
            contact: params[:contact],
            toilet: params[:toilet],
            airing: params[:airing],
            outdoor: params[:outdoor],
            temp: params[:temp],
            atom: params[:atom],
            plate: params[:plate],
            rate: params[:rate])
  end

end
