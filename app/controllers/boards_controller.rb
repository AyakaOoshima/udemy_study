class BoardsController < ApplicationController
    # indexアクション
    def index
    end

    def new
        # Boardモデルのオブジェクト作成→インスタンス変数に格納
        @board = Board.new
    end
end
