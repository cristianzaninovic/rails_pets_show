class PetCommentsController < ApplicationController
  before_action :set_pet_comment, only: %i[ show edit update destroy ]
  # before_action :authenticate_pets_user!, except: [:index, :show]
  # GET /pet_comments or /pet_comments.json
  def index
    @pet_comments = PetComment.all
  end

  # GET /pet_comments/1 or /pet_comments/1.json
  def show
  end

  # GET /pet_comments/new
  def new
    @pet_post = PetPost.find(params[:pet_post_id])
    @pet_comment = @pet_post.pet_comments.new(parent_id: params[:parent_id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /pet_comments/1/edit
  def edit
  end

  # POST /pet_comments or /pet_comments.json
  def create
    @pet_post = PetPost.find(params[:pet_post_id])    
    @pet_comment = PetComment.new(pet_comment_params)
    @pet_comment.pet_post = @pet_post
    @pet_comment.pets_user = current_pets_user if current_pets_user
    # new_pet_comment_params = pet_comment_params.merge(pet_post_id: params[:pet_post_id])
    # @pet_comment = PetComment.new(new_pet_comment_params)
    respond_to do |format|
      if @pet_comment.save
        format.html { redirect_to @pet_post, notice: "Pet comment was successfully created." }
        format.json { render :show, status: :created, location: @pet_comment }
      else
        format.html { render @pet_comment, status: :unprocessable_entity }
        format.json { render json: @pet_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pet_comments/1 or /pet_comments/1.json
  def update
    respond_to do |format|
      if @pet_comment.update(pet_comment_params)
        format.html { redirect_to pet_comment_url(@pet_comment), notice: "Pet comment was successfully updated." }
        format.json { render :show, status: :ok, location: @pet_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pet_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pet_comments/1 or /pet_comments/1.json
  def destroy
    @pet_comment.destroy

    respond_to do |format|
      format.html { redirect_to pet_comments_url, notice: "Pet comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet_comment
      @pet_comment = PetComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pet_comment_params
      params.require(:pet_comment).permit(:body, :pets_user_id, :pet_post_id, :parent_id)
    end
end
