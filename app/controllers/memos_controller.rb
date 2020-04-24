class MemosController < ApplicationController
 
  # except: :indexはindexアクション以外という意味。

  def index
    @memos = Memo.all.order(id: :DESC)
  end

  def new
    @memo = Memo.new
  end

  def create
    @memo=Memo.create(
      title: memo_params[:title],
      content: memo_params[:content], 
      category_id:memo_params[:category_id]
      )
    if @memo.save
      flash[:notice] = "新規メモ作成に成功しました。"
    redirect_to "/"
    else
    render "memos/new"
    end
  end

  def edit
    @memo = Memo.find_by( id: params[:id])
  end

  def update
    @memo = Memo.find_by( id: params[:id])
    if @memo.update(memo_params)
      flash[:notice] = "投稿を編集しました。"
      redirect_to "/"
    else
      render "memos/edit"
      # 直接ビューを表示。フォルダ名/ファイル名のように記述する
    end
  end

  def destroy
    memo = Memo.find_by( id: params[:id])
    memo.destroy
    flash[:notice] = 'メモを削除しました。'
    redirect_to "/"
  end

  def move_to_index
     redirect_to action: :index unless user_signed_in?
  end

  private
  def memo_params
    params.require(:memo).permit(:title, :content, :category_id)
  end

end
