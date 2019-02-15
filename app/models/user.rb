class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        # database_authenticatable	DBに保存するパスワードの暗号化(必須)
		# registerable	サインアップ処理
		# recoverable	パスワードリセット
		# rememberable	クッキーにログイン情報を保持
		# trackable	サインイン回数・時刻・IPアドレスを保存
		# validatable	メールアドレスとパスワードのバリデーション

 #以下を追加
  validates :username, presence: true, uniqueness: true, length: {maximum: 20}



	has_many :book, dependent: :destroy
end
