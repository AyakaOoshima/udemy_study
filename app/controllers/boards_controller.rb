class BoardsController < ApplicationController
    before_action :set_target_board, only: %i[show edit update destroy]

    # indexアクション
    def index
        @boards = Board.page(params[:page])
    end

    def new
        # Boardモデルのオブジェクト作成→インスタンス変数に格納
        @board = Board.new
    end

    def create
        board = Board.create(board_params)
        redirect_to board
    end

    def show
    end

    def edit
    end

    def update
        # viewを作成しないので、インスタンス変数ではなくローカル変数に代入でもよい
        @board.update(board_params)

        # 詳細画面にリダイレクト
        redirect_to @board
    end

    # ここに飛ばない、、、なぜ
    def destroy
        @board.delete
        redirect_to board_path
    end

    private
    def board_params
        # reqでモデルのキー、parでモデルのプロパティのキーを許可
        # これをcreateメソッドに渡す
        params.require(:board).permit(:name, :title, :body)
    end

    def set_target_board
        @board = Board.find(params[:id])
    end
end
