class RegisterMailer < ApplicationMailer
    def send_when_admin_reply(user, contact) #メソッドに対して引数を設定
        @user = user #ユーザー情報
        @answer = contact.reply_text #返信内容
        mail to: user.email, subject: '【サイト名】 お問い合わせありがとうございます'
    end
    def just_send() #メソッドに対して引数を設定
        # @user = user #ユーザー情報
        # @answer = contact.reply_text #返信内容
        # mail to: kizunasampleuser@gmail.com, subject: '【サイト名】 お問い合わせありがとうございます'
    end
end
