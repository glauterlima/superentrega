class ServicosController < ApplicationController
  before_action :set_servico, only: [:edit, :update, :destroy]

  def index
    @servicos = Servico.order(nome: :asc).limit 10
  end

  def new
    @servico = Servico.new
    @grupos = Grupo.all
  end

  def edit
    renderiza :edit
  end

  def update
    if @servico.update servico_params
      flash[:notice] = 'Serviço atualizado com sucesso!'
      redirect_to root_url
    else
      renderiza :edit
    end
  end

  def create
    @servico = Servico.new servico_params
    if @servico.save
      flash[:notice] = 'Serviço salvo com sucesso!'
      redirect_to root_url
    else
      renderiza :new
    end
  end

  def destroy
    @servico.destroy
    redirect_to root_url
  end

  def busca
    @descricao = params[:descricao]
    @servicos = Servico.where 'descricao like ?', "%#{@descricao}%"
  end

  private

  def servico_params
    params.require(:servico).permit(:foto, :nome, :cidade, :descricao, 
      :localentrega, :telefone, :celular, :email, :grupo_id)
  end

  def set_servico
    @servico = Servico.find(params[:id]) 
  end

  def renderiza(view)
    @grupos = Grupo.all
    render view
  end
end