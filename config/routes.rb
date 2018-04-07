Rails.application.routes.draw do
  get 'test/index'

  get '/test' , to: 'test#index'
  post '/test' => 'test#show'
# postメソッドで指定した箇所のルートはget出なくpostで書く。
#送信を押した時に飛ぶページへのルートを指定する=>コントローラにアクション、ビューの作成

  get '/show' , to: 'test2#postform'
  post '/show' , to: 'test2#show'

end
