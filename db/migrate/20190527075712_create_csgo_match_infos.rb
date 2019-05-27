class CreateCsgoMatchInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :csgo_match_infos do |t|
      t.references :infoable, polymorphic: { default: 'Match' }
      # t.references :match
      t.integer    :map     , comment: "地图名"
      t.boolean    :result  , comment: "True CT胜 & False T胜" # 找个讲道理放在 Match 里面会比较合理, 暂时放在这里 之后或许移除
    end
  end
end
