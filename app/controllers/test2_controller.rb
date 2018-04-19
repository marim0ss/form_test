class Test2Controller < ApplicationController
  def postform

  end

  def show
    @hobby = params[:hobby]
    @country = params[:country]
    @programing = params[:programming]

    # チェックボックスの送信処理
    if params[:goodbad].nil?
      @goodbad = "選択されてない・・・"
    else
     gbs = params[:goodbad]

     @goodbad = ""

     gbs.each do |gb|
       @goodbad += "#{gb}\n"
     end
    end



    # ラジオボタンの送信処理
    @gender = params[:gender][0]


  end
end
