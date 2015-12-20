class ThreadContentsController < ApplicationController
  before_action :set_thread_content, only: [:show, :edit, :update, :destroy]

  # GET /thread_contents
  # GET /thread_contents.json
  def index
    @thread_contents = ThreadContent.all
  end

  # GET /thread_contents/1
  # GET /thread_contents/1.json
  def show
  end

  # GET /thread_contents/new
  def new
    @thread_content = ThreadContent.new
  end

  # GET /thread_contents/1/edit
  def edit
  end

  # POST /thread_contents
  # POST /thread_contents.json
  def create
    @thread_content = ThreadContent.new(thread_content_params)

    respond_to do |format|
      if @thread_content.save
        format.html { redirect_to @thread_content, notice: 'Thread content was successfully created.' }
        format.json { render :show, status: :created, location: @thread_content }
      else
        format.html { render :new }
        format.json { render json: @thread_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /thread_contents/1
  # PATCH/PUT /thread_contents/1.json
  def update
    respond_to do |format|
      if @thread_content.update(thread_content_params)
        format.html { redirect_to @thread_content, notice: 'Thread content was successfully updated.' }
        format.json { render :show, status: :ok, location: @thread_content }
      else
        format.html { render :edit }
        format.json { render json: @thread_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thread_contents/1
  # DELETE /thread_contents/1.json
  def destroy
    @thread_content.destroy
    respond_to do |format|
      format.html { redirect_to thread_contents_url, notice: 'Thread content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thread_content
      @thread_content = ThreadContent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def thread_content_params
      params.require(:thread_content).permit(:id, :content, :topic_id)
    end
end
