class SetTemplatesController < ApplicationController
  before_action :set_set_template, only: [:show, :edit, :update, :destroy]

  # GET /set_templates
  # GET /set_templates.json
  def index
    @set_templates = SetTemplate.all
  end

  # GET /set_templates/1
  # GET /set_templates/1.json
  def show
  end

  # GET /set_templates/new
  def new
    @set_template = SetTemplate.new
  end

  # GET /set_templates/1/edit
  def edit
  end

  # POST /set_templates
  # POST /set_templates.json
  def create
    @set_template = SetTemplate.new(set_template_params)

    respond_to do |format|
      if @set_template.save
        format.html { redirect_to @set_template, notice: 'Set template base was successfully created.' }
        format.json { render :show, status: :created, location: @set_template }
      else
        format.html { render :new }
        format.json { render json: @set_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /set_templates/1
  # PATCH/PUT /set_templates/1.json
  def update
    respond_to do |format|
      if @set_template.update(set_template_params)
        format.html { redirect_to @set_template, notice: 'Set template base was successfully updated.' }
        format.json { render :show, status: :ok, location: @set_template }
      else
        format.html { render :edit }
        format.json { render json: @set_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /set_templates/1
  # DELETE /set_templates/1.json
  def destroy
    @set_template.destroy
    respond_to do |format|
      format.html { redirect_to set_templates_url, notice: 'Set template base was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_set_template
      @set_template = SetTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def set_template_params
      params.require(:set_template).permit(:exercise_id, :reps, :weight, :type)
    end
end
