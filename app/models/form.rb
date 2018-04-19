class Form < ActiveRecord::Base

  def hello
    "Hello"
  end

  def dispData
    all_data = Form.all

   prodata = ""


    all_data.each do |data|
      prodata += "#{data.programming}\n"
                      # ↑programmingカラムを指定
    end

     prodata
    # メソッド呼び出し時にprodataの処理結果を表示
  end


#処理をモデルで行う    コントローラ側で引数指定したfood2を受け取って使用
  def dispFood(food2)
    if food2.nil?
      "選択されていません"

    else

      # checked_food = ""

      # food2がそのままeachメソッドが使える
      # food2.each do |food|
      #   checked_food += "#{food}\n"
      # end

      food2.join("、")

      # checked_food
    end

  end


end
