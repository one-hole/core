class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.references :battle
      t.datetime  :start_at
      t.datetime  :end_at
      t.boolean   :reverse, default: false, comment: "left - right 用来映射 CT & T | 紫色方 红色方 | radiant & dire 这样的"
    end
  end
end
