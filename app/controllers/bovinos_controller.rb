class BovinosController < ApplicationController
  before_action :set_bovino, only: %i[ show edit update destroy ]

  # GET /bovinos or /bovinos.json
  def index
    @bovinos = Bovino.all
  end

  # GET /bovinos/1 or /bovinos/1.json
  def show
  end

  # GET /bovinos/new
  def new
    @bovino = Bovino.new
  end

  # GET /bovinos/1/edit
  def edit
  end

  # POST /bovinos or /bovinos.json
  def create
    @bovino = Bovino.new(bovino_params)

    respond_to do |format|
      if @bovino.save
        format.html { redirect_to bovinos_path, notice: "Bovino Criado com Sucesso." }
        format.json { render :index, status: :created, location: @bovino }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bovino.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bovinos/1 or /bovinos/1.json
  def update
    respond_to do |format|
      if @bovino.update(bovino_params)
        format.html { redirect_to bovinos_path, notice: "Bovino Atualizado com Sucesso." }
        format.json { render :index, status: :ok, location: @bovino }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bovino.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bovinos/1 or /bovinos/1.json
  def destroy
    @bovino.destroy!
    respond_to do |format|
      format.html { redirect_to bovinos_url, notice: "Bovino Deletado com Sucesso." }
      format.json { head :no_content }
    end
  end

  def search
    query = params[:query]
  
    @bovino = Bovino.find_by(brinco: query) || Bovino.find_by(nome: query)
  
    if @bovino
      render "bovinos/show"
    else
      flash[:alert] = "Nenhum bovino encontrado com o brinco ou nome '#{query}'."
      @bovinos = Bovino.all
      render "bovinos/index"
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bovino
      @bovino = Bovino.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bovino_params
      params.require(:bovino).permit(:brinco, :nome, :situacao, :sexo, :brinco_mae, :brinco_pai, :raca, :data_nascimento, :data_prenhes, :data_ultimo_parto)
    end
end
