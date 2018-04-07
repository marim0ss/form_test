class TestController < ApplicationController
  def index
    omikuji = ["大吉","中吉","小吉"]
    @omi = omikuji.sample
  end

  def show
    @name = params[:name]
    @age = params[:age]
    # @gender = params[:gender]
    @text = params[:text]


    if params[:food2].nil?
      @checked_food = "選択されていません"
    else
      foods = params[:food2]

      @checked_food = ""

      foods.each do |food|
        @checked_food += "#{food}\n"
      end
    end

    if params[:gender].nil?
        @gender = "No Data"
    else
        @gender = params[:gender][0]
    end


    # 復習チェックボックスの処理部分
      if params[:check].nil?
        @check = "NO DATA"
      else
        checkers = params[:check]

        # ↓の部分、配列を足し合わせるだけなら、@check=""とeachを使わずにinjectを使っても書ける。
        # injectで書くと、@check = checkers.inject(:+)だけで良い
        # ただinjectだと↓のように\nは入れられるのか？
        @check = ""

        checkers.each do |checker|
          @check += "#{checker}\n"
        end
       end

  if params[:prog].nil?
    @checked_prog = "選択されていません"
  else
    progs = params[:prog]

    @checked_prog = ""

    progs.each do |prog|
      @checked_prog += "#{prog}\n"
    end
  end

  if params[:program].nil?
       @program = "No Data"
   else

       @program = params[:program][0]
  end



  form = Form.new(food: params[:food], sports: params[:sports], foods: params[:foods], dinner: params[:dinner], gender: params[:gender], programming: params[:prog])

  form.save


 end
end
