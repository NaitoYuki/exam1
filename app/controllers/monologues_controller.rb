class MonologuesController < ApplicationController
  before_action :set_monologue, only: [:edit, :update, :destroy]

  def index
    @monologues = Monologue.order(:created_at).reverse_order
  end

  def new
    if params[:back]
      @monologue = Monologue.new(monologues_params)
    else
      @monologue = Monologue.new
    end
  end

  def create
    @monologue = Monologue.create(monologues_params)
    if @monologue.save
      redirect_to monologues_path, notice: "ひとりごとしました！"
    else
      render 'new'
    end
  end

  def edit
    @monologue = Monologue.find(params[:id])
  end

  def update
    @monologue = Monologue.find(params[:id])
    if @monologue.update(monologues_params)
      redirect_to monologues_path, notice: "更新しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @monologue = Monologue.find(params[:id])
    @monologue.destroy
    redirect_to monologues_path, notice: "削除しました！"
  end

  def confirm
    @monologue = Monologue.new(monologues_params)
    render :new if @monologue.invalid?
  end

  private
    def monologues_params
      params.require(:monologue).permit(:content)
    end

    def set_monologue
      @monologue = Monologue.find(params[:id])
    end
end
