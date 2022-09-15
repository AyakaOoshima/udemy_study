class BoardsController < ApplicationController
    before_action :set_target_board, only: %i[show edit update destroy]

    # indexアクション
    def index
        @boards = Board.page(params[:page])
    end

    def new
        # Boardモデルのオブジェクト作成→インスタンス変数に格納
        @board = Board.new(flash[:board])
    end

    def create
        board = Board.new(board_params)
        if board.save
            flash[:notice] = "「#{board.title}」の掲示版を作成しました"
            redirect_to board
        else
            redirect_to new_board_path, flash:{
                board: board,
                error_messages: board.errors.full_messages
            }
        end

    end

    def show
        @comment = @board.comments.new
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
        redirect_to board_path, flash: { notice: "「#{@board.title}」の掲示板を削除しました" }
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
