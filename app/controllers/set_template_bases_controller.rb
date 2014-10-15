class SetTemplateBasesController < ApplicationController
  before_action :set_set_template_basis, only: [:show, :edit, :update, :destroy]

  # GET /set_template_bases
  # GET /set_template_bases.json
  def index
    @set_template_bases = SetTemplateBase.all
  end

  # GET /set_template_bases/1
  # GET /set_template_bases/1.json
  def show
  end

  # GET /set_template_bases/new
  def new
    @set_template_basis = SetTemplateBase.new
  end

  # GET /set_template_bases/1/edit
  def edit
  end

  # POST /set_template_bases
  # POST /set_template_bases.json
  def create
    @set_template_basis = SetTemplateBase.new(set_template_basis_params)

    respond_to do |format|
      if @set_template_basis.save
        format.html { redirect_to @set_template_basis, notice: 'Set template base was successfully created.' }
        format.json { render :show, status: :created, location: @set_template_basis }
      else
        format.html { render :new }
        format.json { render json: @set_template_basis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /set_template_bases/1
  # PATCH/PUT /set_template_bases/1.json
  def update
    respond_to do |format|
      if @set_template_basis.update(set_template_basis_params)
        format.html { redirect_to @set_template_basis, notice: 'Set template base was successfully updated.' }
        format.json { render :show, status: :ok, location: @set_template_basis }
      else
        format.html { render :edit }
        format.json { render json: @set_template_basis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /set_template_bases/1
  # DELETE /set_template_bases/1.json
  def destroy
    @set_template_basis.destroy
    respond_to do |format|
      format.html { redirect_to set_template_bases_url, notice: 'Set template base was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_set_template_basis
      @set_template_basis = SetTemplateBase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def set_template_basis_params
      params.require(:set_template_basis).permit(:exercise_id, :reps, :weight, :type)
    end
end
