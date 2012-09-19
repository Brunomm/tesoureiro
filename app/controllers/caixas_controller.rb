class CaixasController < ApplicationController
  # GET /caixas
  # GET /caixas.json
  def index
    @caixas = Caixa.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @caixas }
    end
  end

  # GET /caixas/1
  # GET /caixas/1.json
  def show
    @caixa = Caixa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @caixa }
    end
  end

  # GET /caixas/new
  # GET /caixas/new.json
  def new
    @caixa = Caixa.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @caixa }
    end
  end

  # GET /caixas/1/edit
  def edit
    @caixa = Caixa.find(params[:id])
  end

  # POST /caixas
  # POST /caixas.json
  def create
    @caixa = Caixa.new(params[:caixa])

    respond_to do |format|
      if @caixa.save
        format.html { redirect_to @caixa, notice: 'Caixa was successfully created.' }
        format.json { render json: @caixa, status: :created, location: @caixa }
      else
        format.html { render action: "new" }
        format.json { render json: @caixa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /caixas/1
  # PUT /caixas/1.json
  def update
    @caixa = Caixa.find(params[:id])

    respond_to do |format|
      if @caixa.update_attributes(params[:caixa])
        format.html { redirect_to @caixa, notice: 'Caixa was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @caixa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caixas/1
  # DELETE /caixas/1.json
  def destroy
    @caixa = Caixa.find(params[:id])
    @caixa.destroy

    respond_to do |format|
      format.html { redirect_to caixas_url }
      format.json { head :no_content }
    end
  end
end
