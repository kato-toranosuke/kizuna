require 'digest/md5'
class WelcomeController < ApplicationController
  #---digest認証---
  #REALM = "SuperSecret"
  #USERS = {"kadmin" => "secret", #plain text password
  #         "dap" => Digest::MD5.hexdigest(["dap", REALM, "testsecret"].join(":"))}
  REALM = 'SecretZone'.freeze
  USERS = { 'kizuna' => Digest::MD5.hexdigest(['kizuna', REALM, 'enpitpassword'].join(':'))}.freeze

  before_action :authenticate, only: [:register, :update]

  private
  def authenticate
    authenticate_or_request_with_http_digest(REALM) do |username|
      USERS[username]
    end
  end
  #------

  public

  protect_from_forgery :except => [:checkdata]

  def update_ok
    # @update_item=params[:item][0]
    # @update_comment=params[:comment][0]

    @latest_id=UpdateModel.where(rest: params[:restid]).maximum(:record_id)
    @latest=UpdateModel.where(rest: params[:restid], record_id: @latest_id)
    @record_id=@latest[0][:record_id].to_i+1

    # 更新前のデータ
    @mask=@latest[0][:mask]
    @temp=@latest[0][:temp]
    @alcohol=@latest[0][:alcohol]
    @takeout=@latest[0][:takeout]
    @monday=@latest[0][:monday]
    @tuesday=@latest[0][:tuesday]
    @wednesday=@latest[0][:wednesday]
    @thursday=@latest[0][:thursday]
    @friday=@latest[0][:friday]
    @saturday=@latest[0][:saturday]
    @sunday=@latest[0][:sunday]

    i=0
    # 更新
    if params[:ipaddress].present? then
      while i < params[:item].length do
        if params[:item][i]=='マスク' then
          @mask=params[:comment][i]
        elsif params[:item][i]=='検温' then
          @temp=params[:comment][i]
        elsif params[:item][i]=='消毒液' then
          @alcohol=params[:comment][i]
        elsif params[:item][i]=='テイクアウト' then
          @takeout=params[:comment][i]
        elsif params[:item][i]=='月' then
          @monday=params[:comment][i]
        elsif params[:item][i]=='火' then
          @tuesday=params[:comment][i]
        elsif params[:item][i]=='水' then
          @wednesday=params[:comment][i]
        elsif params[:item][i]=='木' then
          @thursday=params[:comment][i]
        elsif params[:item][i]=='金' then
          @friday=params[:comment][i]
        elsif params[:item][i]=='土' then
          @saturday=params[:comment][i]
        elsif params[:item][i]=='日' then
          @sunday=params[:comment][i]
        end
        i=i+1
      end
      UpdateModel.create(rest: params[:restid], record_id: @record_id, mask: @mask, temp: @temp, alcohol: @alcohol, takeout: @takeout, monday: @monday, tuesday: @tuesday, wednesday: @wednesday, thursday: @thursday, friday: @friday, saturday: @saturday, sunday: @sunday)
      RestModel.find(params[:restid]).update_attributes(mask: @mask, temp: @temp, alcohol: @alcohol, takeout: @takeout, monday: @monday, tuesday: @tuesday, wednesday: @wednesday, thursday: @thursday, friday: @friday, saturday: @saturday, sunday: @sunday)
      # statusに1をセット
      @com_data=SampleUserModel.find(params[:comid])
      @com_data.update(status: 1)

    end
    redirect_to "/update/"+(params[:restid]).to_s
  end

  def update_ng
  end

  def update
    @restid=params[:restid]
    gon.record_id="aaa"
    #入力
    if params[:item].present?
      i = 0
      j = 0
      while i < params[:item].length do
        if params[:item][i]=='営業時間' then
          if params[:comment][i]=='全日' then
            if params[:time][j].present? then
              SampleUserModel.find_or_initialize_by(rest: params[:restid].to_i, ipaddress: request.remote_ip, item: '月').update_attributes(rest: params[:restid].to_i,item: '月', comment: params[:time][j], ipaddress: request.remote_ip)
              SampleUserModel.find_or_initialize_by(rest: params[:restid].to_i, ipaddress: request.remote_ip, item: '火').update_attributes(rest: params[:restid].to_i,item: '火', comment: params[:time][j], ipaddress: request.remote_ip)
              SampleUserModel.find_or_initialize_by(rest: params[:restid].to_i, ipaddress: request.remote_ip, item: '水').update_attributes(rest: params[:restid].to_i,item: '水', comment: params[:time][j], ipaddress: request.remote_ip)
              SampleUserModel.find_or_initialize_by(rest: params[:restid].to_i, ipaddress: request.remote_ip, item: '木').update_attributes(rest: params[:restid].to_i,item: '木', comment: params[:time][j], ipaddress: request.remote_ip)
              SampleUserModel.find_or_initialize_by(rest: params[:restid].to_i, ipaddress: request.remote_ip, item: '金').update_attributes(rest: params[:restid].to_i,item: '金', comment: params[:time][j], ipaddress: request.remote_ip)
              SampleUserModel.find_or_initialize_by(rest: params[:restid].to_i, ipaddress: request.remote_ip, item: '土').update_attributes(rest: params[:restid].to_i,item: '土', comment: params[:time][j], ipaddress: request.remote_ip)
              SampleUserModel.find_or_initialize_by(rest: params[:restid].to_i, ipaddress: request.remote_ip, item: '日').update_attributes(rest: params[:restid].to_i,item: '日', comment: params[:time][j], ipaddress: request.remote_ip)
              j=j+1
            end
          elsif params[:comment][i]=='平日' then
            if params[:time][j].present? then
            SampleUserModel.find_or_initialize_by(rest: params[:restid].to_i, ipaddress: request.remote_ip, item: '月').update_attributes(rest: params[:restid].to_i,item: '月', comment: params[:time][j], ipaddress: request.remote_ip)
            SampleUserModel.find_or_initialize_by(rest: params[:restid].to_i, ipaddress: request.remote_ip, item: '火').update_attributes(rest: params[:restid].to_i,item: '火', comment: params[:time][j], ipaddress: request.remote_ip)
            SampleUserModel.find_or_initialize_by(rest: params[:restid].to_i, ipaddress: request.remote_ip, item: '水').update_attributes(rest: params[:restid].to_i,item: '水', comment: params[:time][j], ipaddress: request.remote_ip)
            SampleUserModel.find_or_initialize_by(rest: params[:restid].to_i, ipaddress: request.remote_ip, item: '木').update_attributes(rest: params[:restid].to_i,item: '木', comment: params[:time][j], ipaddress: request.remote_ip)
            SampleUserModel.find_or_initialize_by(rest: params[:restid].to_i, ipaddress: request.remote_ip, item: '金').update_attributes(rest: params[:restid].to_i,item: '金', comment: params[:time][j], ipaddress: request.remote_ip)
            end
          elsif params[:comment][i]=='土日' then
            if params[:time][j].present? then
              SampleUserModel.find_or_initialize_by(rest: params[:restid].to_i, ipaddress: request.remote_ip, item: '土').update_attributes(rest: params[:restid].to_i,item: '土', comment: params[:time][j], ipaddress: request.remote_ip)
              SampleUserModel.find_or_initialize_by(rest: params[:restid].to_i, ipaddress: request.remote_ip, item: '日').update_attributes(rest: params[:restid].to_i,item: '日', comment: params[:time][j], ipaddress: request.remote_ip)
            end
          elsif params[:comment][i]=='月' then
            if params[:time][j].present? then
              SampleUserModel.find_or_initialize_by(rest: params[:restid].to_i, ipaddress: request.remote_ip, item: '月').update_attributes(rest: params[:restid].to_i,item: '月', comment: params[:time][j], ipaddress: request.remote_ip)
            end
          elsif params[:comment][i]=='火' then
            if params[:time][j].present? then
              SampleUserModel.find_or_initialize_by(rest: params[:restid].to_i, ipaddress: request.remote_ip, item: '火').update_attributes(rest: params[:restid].to_i,item: '火', comment: params[:time][j], ipaddress: request.remote_ip)
            end
          elsif params[:comment][i]=='水' then
            if params[:time][j].present? then
              SampleUserModel.find_or_initialize_by(rest: params[:restid].to_i, ipaddress: request.remote_ip, item: '水').update_attributes(rest: params[:restid].to_i,item: '水', comment: params[:time][j], ipaddress: request.remote_ip)
            end
          elsif params[:comment][i]=='木' then
            if params[:time][j].present? then
              SampleUserModel.find_or_initialize_by(rest: params[:restid].to_i, ipaddress: request.remote_ip, item: '木').update_attributes(rest: params[:restid].to_i,item: '木', comment: params[:time][j], ipaddress: request.remote_ip)
            end
          elsif params[:comment][i]=='金' then
            if params[:time][j].present? then
              SampleUserModel.find_or_initialize_by(rest: params[:restid].to_i, ipaddress: request.remote_ip, item: '金').update_attributes(rest: params[:restid].to_i,item: '金', comment: params[:time][j], ipaddress: request.remote_ip)
            end
          elsif params[:comment][i]=='土' then
            if params[:time][j].present? then
              SampleUserModel.find_or_initialize_by(rest: params[:restid].to_i, ipaddress: request.remote_ip, item: '土').update_attributes(rest: params[:restid].to_i,item: '土', comment: params[:time][j], ipaddress: request.remote_ip)
            end
          elsif params[:comment][i]=='日' then
            if params[:time][j].present? then
              SampleUserModel.find_or_initialize_by(rest: params[:restid].to_i, ipaddress: request.remote_ip, item: '日').update_attributes(rest: params[:restid].to_i,item: '日', comment: params[:time][j], ipaddress: request.remote_ip)
            end
          end
        else
          SampleUserModel.find_or_initialize_by(rest: params[:restid].to_i, ipaddress: request.remote_ip, item: params[:item][i]).update_attributes(rest: params[:restid].to_i,item: params[:item][i], comment: params[:comment][i], ipaddress: request.remote_ip)
        end
         #  Nicole.create(name: params[:name][i], comment: params[:comment][i], ipaddress: request.remote_ip)
        #  Nicole.create(name: params[:name][i], comment: request.remote_ip)
         i=i+1
      end
    end

    #出力
    @update_num=UpdateModel.where(rest: params[:restid].to_i).count
    gon.update_num = @update_num
    @user_data=[]
    @update_data=[]
    @all_comments=Array.new

    for i in 1..@update_num do
      if i == @update_num then
        @uptime=UpdateModel.find_by(rest: params[:restid].to_i, record_id: i)
        @user_data[i-1]=SampleUserModel.where(rest: params[:restid].to_i).where("? < created_at", @uptime.created_at)
        @update_data[i-1]=@uptime

      else 
        @uptime=UpdateModel.find_by(rest: params[:restid].to_i, record_id: i)
        @uptime2=UpdateModel.find_by(rest: params[:restid].to_i, record_id: i+1)
        # @user_data=SampleUserModel.where("? < updated_at and updated_at < ?", "2020-02-12 07:47:30","2020-05-20 07:47:30")
        @user_data[i-1]=SampleUserModel.where(rest: params[:restid].to_i).where("? < created_at and created_at < ?", @uptime.created_at,@uptime2.created_at)
        @update_data[i-1]=@uptime
      end
      @ips=@user_data[i-1].select('ipaddress').distinct
      @comments=Array.new
      @ips.each do |ip|
        @comments.push(@user_data[i-1].where(ipaddress: ip.ipaddress).order(id: "ASC") )
      end
      @all_comments.push(@comments)
    end

  end

  def list
    if  params[:q].present?
      @all_hira = params[:q]

      #破壊的メソッドを実行してもお互いに影響を及ぼさないようにコピー
      @all_kata = @all_hira.dup
      #ひらがなをカタカナに、カタカナをひらがなに
      @all_kata['name_cont'] = @all_kata['name_cont'].tr('ぁ-ん ァ-ン','ァ-ン ぁ-ん')
      

      @q = RestModel.ransack(@all_hira)
      @rests = @q.result(distinct: true)
      @q_2 = RestModel.ransack(@all_kata)
      @rests_2 = @q_2.result(distinct: true)

    else
      @all_hira = @all_kata 

      @q = RestModel.ransack(params[:q])
      @rests = @q.result(distinct: true)

    end
  end

  def ok
    @st=StackRestModel.find(params[:stid].to_i)
    RestModel.create(name: @st.name, area: @st.area,mask: @st.mask, temp: @st.temp, alcohol: @st.alcohol, takeout: @st.takeout, monday: @st.monday, tuesday: @st.tuesday, wednesday: @st.wednesday, thursday: @st.thursday, friday: @st.friday, saturday: @st.saturday, sunday: @st.sunday, googlemap: @st.googlemap, tabelog: @st.tabelog, homepage: @st.homepage)
    @restid=RestModel.maximum(:id)
    UpdateModel.create(record_id: 1, rest: @restid, mask:@st.mask,  temp: @st.temp, alcohol: @st.alcohol, takeout: @st.takeout, monday: @st.monday, tuesday: @st.tuesday, wednesday: @st.wednesday, thursday: @st.thursday, friday: @st.friday, saturday: @st.saturday, sunday: @st.sunday,  takeout:@st.takeout)
    StackRestModel.delete(params[:stid].to_i)
  end

  def ng
    @st=StackRestModel.find(params[:stid].to_i)
    StackRestModel.delete(params[:stid].to_i)
  end

  def register
    @name=params[:name]
    @mask=params[:mask]
    @temp=params[:temp]
    @alcohol=params[:alcohol]
    @takeout=params[:takeout]
    @monday=params[:monday]
    @tuesday=params[:tuesday]
    @wednesday=params[:wednesday]
    @thursday=params[:thursday]
    @friday=params[:friday]
    @saturday=params[:saturday]
    @sunday=params[:sunday]
    @googlemap=params[:googlemap]
    @tabelog=params[:tabelog]
    @homepage=params[:homepage]

    if params[:name].present?
      StackRestModel.create(name: params[:name], mask: params[:mask], temp: params[:temp], alcohol: params[:alcohol], takeout: params[:takeout], monday: params[:monday], tuesday: params[:tuesday], wednesday: params[:wednesday], thursday: params[:thursday], friday: params[:friday], saturday: params[:saturday], sunday: params[:sunday] , googlemap: params[:googlemap], tabelog: params[:tabelog], homepage: params[:homepage])
    end

    #@stack=StackRestModel.all
    @q = StackRestModel.ransack(params[:q])
    @stack = @q.result(distinct: true)
  end


  def create
    # paramsでidを取得
    @record_id=params[:record_id]
    @restid=params[:restid]

    LikeModel.find_or_initialize_by(rest: params[:restid].to_i,ipaddress: request.remote_ip, record_id: @record_id).update_attributes(rest: params[:restid].to_i,ipaddress: request.remote_ip, record_id: @record_id, like: 1)
    # LikeModel.create(ipaddress: request.remote_ip, record_id: 10, like: 1)
  end

  def destroy
    @record_id=params[:record_id]
    @restid=params[:restid]

    LikeModel.find_or_initialize_by(rest: params[:restid].to_i,ipaddress: request.remote_ip, record_id: @record_id).update_attributes(rest: params[:restid].to_i,ipaddress: request.remote_ip, record_id: @record_id, like: 0)
    # LikeModel.create(ipaddress: request.remote_ip, record_id: 10, like: 0)
  end
  # SampleUserModel.find_or_initialize_by(ipaddress: request.remote_ip, item: params[:item][i]).update_attributes(item: params[:item][i], comment: params[:comment][i], ipaddress: request.remote_ip)
  
  def checkdata
    @restid=params[:restid]
    gon.record_id="aaa"

    #入力
    @upmax_id=UpdateModel.where(rest: @restid).maximum(:record_id)
    @upmax_created=UpdateModel.where(rest: @restid, record_id: @upmax_id)[0][:created_at]
        
    if params[:item].present?
      i = 0
      j = 0
      week=Array['月', '火', '水', '木', '金', '土', '日']
      strip=request.remote_ip
      front=["森の",
        "湖の",
        "海の",
        "滝の",
        "川の",
        "谷の",
        "島の",
        "山の",
        "林の",
        "空の",
        "丘の",
        "竹林の",
        "雪国の",
        "洞窟の",
        "北極の",
        "砂漠の",
        "北欧の",
        "西洋の",
        "東洋の",
        "南米の",
        "中東の",
        "密林の",
        "沼地の",
        "川底の",
        "海辺の",
        "軒下の",
        "地底の",
        "月面の",
        "裏庭の",
        "秘境の"]
    back=[
        "くま",
        "ねこ",
        "いぬ",
        "とら",
        "きりん",
        "うし",
        "ぞう",
        "しまうま",
        "ひつじ",
        "いのしし",
        "うさぎ",
        "くじら",
        "かめ",
        "いるか",
        "かわうそ",
        "らっこ",
        "ぺんぎん",
        "あるぱか",
        "かぴばら",
        "りす",
        "ふくろう",
        "たぬき",
        "きつね",
        "あざらし",
        "だちょう",
        "ぱんだ",
        "こあら",
        "おおかみ",
        "となかい",
        "しか"]
      f=Digest::SHA3.hexdigest(strip)   
      strip+="kizuna"
      b=Digest::SHA3.hexdigest(strip)   
      @nickname=front[f.hex%30]+back[b.hex%30]+"さん"
      while i < params[:item].length do
        if params[:item][i]=='営業時間' then
          if params[:comment][i]=='全日' then
            if params[:time][j].present? then
              for day in week do
                pre=SampleUserModel.find_by('created_at > ? and rest = ? and ipaddress = ? and item = ?', @upmax_created, params[:restid].to_i, request.remote_ip, day)
                if pre then
                  pre.update_attributes(rest: params[:restid].to_i,item: day, comment: params[:time][j], ipaddress: request.remote_ip, nickname: @nickname)
                else
                  SampleUserModel.create(rest: params[:restid].to_i,item: day, comment: params[:time][j], ipaddress: request.remote_ip, nickname: @nickname)
                end
              end
              j=j+1
            end
          elsif params[:comment][i]=='平日' then
            if params[:time][j].present? then
              for day in ['月', '火', '水', '木', '金'] do
                pre=SampleUserModel.find_by('created_at > ? and rest = ? and ipaddress = ? and item = ?', @upmax_created, params[:restid].to_i, request.remote_ip, day)
                if pre then
                  pre.update_attributes(rest: params[:restid].to_i,item: day, comment: params[:time][j], ipaddress: request.remote_ip, nickname: @nickname)
                else
                  SampleUserModel.create(rest: params[:restid].to_i,item: day, comment: params[:time][j], ipaddress: request.remote_ip, nickname: @nickname)
                end
              end
              j=j+1
            end
          elsif params[:comment][i]=='土日' then
            if params[:time][j].present? then
              for day in ['土', '日'] do
                pre=SampleUserModel.find_by('created_at > ? and rest = ? and ipaddress = ? and item = ?', @upmax_created, params[:restid].to_i, request.remote_ip, day)
                if pre then
                  pre.update_attributes(rest: params[:restid].to_i,item: day, comment: params[:time][j], ipaddress: request.remote_ip, nickname: @nickname)
                else
                  SampleUserModel.create(rest: params[:restid].to_i,item: day, comment: params[:time][j], ipaddress: request.remote_ip, nickname: @nickname)
                end
              end
              j=j+1
            end
          elsif week.include?(params[:comment][i]) then
            if params[:time][j].present? then
              pre=SampleUserModel.find_by('created_at > ? and rest = ? and ipaddress = ? and item = ?', @upmax_created, params[:restid].to_i, request.remote_ip, params[:item][i])
              if pre then
                pre.update_attributes(rest: params[:restid].to_i,item: params[:comment][i], comment: params[:time][j], ipaddress: request.remote_ip, nickname: @nickname)
              else
                SampleUserModel.create(rest: params[:restid].to_i,item: params[:comment][i], comment: params[:time][j], ipaddress: request.remote_ip, nickname: @nickname)
              end
            end
            j=j+1
          end
        else

          # SampleUserModel.find_or_initialize_by(rest: params[:restid].to_i, ipaddress: request.remote_ip, item: params[:item][i]).update_attributes(rest: params[:restid].to_i,item: params[:item][i], comment: params[:comment][i], ipaddress: request.remote_ip)
          # SampleUserModel.find_or_initialize_by('created_at > ? and rest = ? and ipaddress = ? and item = ?', @upmax_created, params[:restid].to_i, request.remote_ip, params[:item][i]).update_attributes(rest: params[:restid].to_i,item: params[:item][i], comment: params[:comment][i], ipaddress: request.remote_ip)
          pre=SampleUserModel.find_by('created_at > ? and rest = ? and ipaddress = ? and item = ?', @upmax_created, params[:restid].to_i, request.remote_ip, params[:item][i])
          if pre then
            pre.update_attributes(rest: params[:restid].to_i,item: params[:item][i], comment: params[:comment][i], ipaddress: request.remote_ip, nickname: @nickname)
          else
            SampleUserModel.create(rest: params[:restid].to_i,item: params[:item][i], comment: params[:comment][i], ipaddress: request.remote_ip, nickname: @nickname)
          end
        end
         #  Nicole.create(name: params[:name][i], comment: params[:comment][i], ipaddress: request.remote_ip)
        #  Nicole.create(name: params[:name][i], comment: request.remote_ip)

         i=i+1
      end

      redirect_to "/checkdata/"+(@restid).to_s
    end

    #出力
    @update_num=UpdateModel.where(rest: params[:restid].to_i).count
    gon.update_num = @update_num
    @user_data=[]
    @update_data=[]
    @all_comments=Array.new

    for i in 1..@update_num do
      if i == @update_num then
        @uptime=UpdateModel.find_by(rest: params[:restid].to_i, record_id: i)
        @user_data[i-1]=SampleUserModel.where(rest: params[:restid].to_i).where("? < created_at", @uptime.created_at)
        @update_data[i-1]=@uptime

      else 
        @uptime=UpdateModel.find_by(rest: params[:restid].to_i, record_id: i)
        @uptime2=UpdateModel.find_by(rest: params[:restid].to_i, record_id: i+1)
        # @user_data=SampleUserModel.where("? < updated_at and updated_at < ?", "2020-02-12 07:47:30","2020-05-20 07:47:30")
        @user_data[i-1]=SampleUserModel.where(rest: params[:restid].to_i).where("? < created_at and created_at < ?", @uptime.created_at,@uptime2.created_at)
        @update_data[i-1]=@uptime
      end
      @ips=@user_data[i-1].select('ipaddress').distinct
      @comments=Array.new
      @ips.each do |ip|
        @comments.push(@user_data[i-1].where(ipaddress: ip.ipaddress).order(id: "ASC") )
      end
      @all_comments.push(@comments)
    end

  end

  def about
  end

end
