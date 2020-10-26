class AddAnswersNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:answers, :text, false)
  end
end
