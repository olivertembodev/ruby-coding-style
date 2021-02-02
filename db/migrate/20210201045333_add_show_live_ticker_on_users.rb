class AddShowLiveTickerOnUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :show_live_ticker, :boolean, default: true
  end
end
