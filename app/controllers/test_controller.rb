class TestController < ApplicationController
  def index
    omikuji = ["大吉","中吉","小吉"]
    @omi = omikuji.sample


    # formモデルをオブジェクト化
    form1 = Form.new
    @hello = form1.hello

    @dispd = form1.dispData

  end

  def show
    form = Form.new

  # HTML テキスト入力フォームの処理
    @name = params[:name]
    @age = params[:age]
    # @gender = params[:gender]
    @text = params[:text]


  # Rails記述：チェックボックスの処理
    @checked_food = form.dispFood(params[:food2])
    # paramsで値を受け取れるにはコントローラなので、コントローラでparamsを使用
    # params[:food2]でフォームの入力を受け取る→モデルでdispFood(food2)と指定してfood2の値を扱える
    #       Ruby initializeメソッド定義など参照

  # Rails  性別ラジオボタンの処理
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

  # 言語チェックボックスの処理
  if params[:prog].nil?
    @checked_prog = "選択されていません"
  else
    progs = params[:prog]

    # pointprog:下でprogrammingカラムに登録するために立てた変数。
    pointprog = progs.join("、")

    @checked_prog = ""

    progs.each do |prog|
      @checked_prog += "#{prog}\n"
    end
  end


  # 言語ラジオボタンの処理
  if params[:program].nil?
       @program = "No Data"
   else

       @program = params[:program][0]
  end


# データベースへ登録する部分
  form = Form.new(food: params[:food], sports: params[:sports], foods: params[:foods], dinner: params[:dinner], gender: params[:gender], programming: pointprog)

  form.save


 end
end
