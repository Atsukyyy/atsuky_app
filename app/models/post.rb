class Post < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 20 }
  validates :content, presence: true

  def add_error_sample
  # nameが空のときにエラーメッセージを追加する
    if name.empty?
      errors.add(:name, "20文字以内の名前を入力してください。")
      errors[:base] << "モデル全体に関係するエラーを追加"
    end
  end
end
