class PaydaysController < ApplicationController
  before_action :set_payday, only: [:show, :edit, :update, :destroy]

  # GET /paydays
  # GET /paydays.json
  def index
    @paydays = Payday.order(payday: :asc).page(params[:page]).per(10)
  end

  # GET /paydays/1
  # GET /paydays/1.json
  def show
  end

  # GET /paydays/new
  def new
    @payday = Payday.new
  end

  # GET /paydays/1/edit
  def edit
  end

  # POST /paydays
  # POST /paydays.json
  def create
    @payday = Payday.new(payday_params)

    respond_to do |format|
      if @payday.save
        format.html { redirect_to @payday, notice: 'Payday was successfully created.' }
        format.json { render action: 'show', status: :created, location: @payday }
      else
        format.html { render action: 'new' }
        format.json { render json: @payday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paydays/1
  # PATCH/PUT /paydays/1.json
  def update
    respond_to do |format|
      if @payday.update(payday_params)
        format.html { redirect_to @payday, notice: 'Payday was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @payday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paydays/1
  # DELETE /paydays/1.json
  def destroy
    @payday.destroy
    respond_to do |format|
      format.html { redirect_to paydays_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payday
      @payday = Payday.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payday_params
      params.require(:payday).permit(:title, :twitter_acount_name, :payday)
    end
end
