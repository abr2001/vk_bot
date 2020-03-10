class AddProxyToAccount < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :proxy, :text
  end
end
