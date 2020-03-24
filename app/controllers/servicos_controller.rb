class ServicosController < ApplicationController

  def index
    @servicos = Servico.order(nome: :asc).limit 10
  end

  def new
    @servico = Servico.new
  end

  def create
    valores = params.require(:servico).permit(:foto, :nome, :cidade, :descricao, :localentrega, :telefone, :celular, :email)
    @servico = Servico.new valores
    if @servico.save
      flash[:notice] = "Serviço salvo com sucesso!"
      redirect_to root_url
    else
      render :new
    end
   
  end

  def destroy
    id = params[:id]
    Servico.destroy id
    redirect_to root_url
  end

  def busca
    @descricao = params[:descricao]
    @servicos = Servico.where "descricao like ?", "%#{@descricao}%"
  end
end
