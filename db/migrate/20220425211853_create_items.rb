class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      # ユーザーＩＤ
      t.integer :user_id
      # タグＩＤ
      t.integer :tag_id
      # 投稿タイトル
      t.string :title
      # 投稿内容
      t.string :body

      t.timestamps
    end
  end
end
