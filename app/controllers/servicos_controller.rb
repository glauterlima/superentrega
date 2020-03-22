class ServicosController < ApplicationController

  def index
    @servicos = Servico.order(nome: :asc).limit 2
  end

  def create
    servico = params.require(:servico).permit(:foto, :nome, :cidade, :descricao, :localentrega, :telefone, :celular, :email)
    Servico.create servico
    redirect_to root_url
  end

  def destroy
    id = params[:id]
    Servico.destroy id
    redirect_to root_url
  end

  def busca
    descricao = params[:descricao]
    @servicos = Servico.where "descricao like ?", "%#{@descricao}%"
  end
end
