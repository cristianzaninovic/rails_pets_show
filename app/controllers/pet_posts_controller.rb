class PetPostsController < ApplicationController
  before_action :set_pet_post, only: %i[ show edit update destroy ]
  before_action :authenticate_pets_user!, except: [:index, :show]
  # GET /pet_posts or /pet_posts.json
  def index
    @pet_posts = PetPost.all
  end

  # GET /pet_posts/1 or /pet_posts/1.json
  def show
  end

  # GET /pet_posts/new
  def new
    @pet_post = PetPost.new
  end

  # GET /pet_posts/1/edit
  def edit
  end

  # POST /pet_posts or /pet_posts.json
  def create
    # @pet_post = PetPost.new(pet_post_params.merge(pets_user_id: current_pets_user.id))
    @pet_post = current_pets_user.pet_posts.new(pet_post_params)
    respond_to do |format|
      if @pet_post.save
        format.html { redirect_to pet_post_url(@pet_post), notice: "Pet post was successfully created." }
        format.json { render :show, status: :created, location: @pet_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pet_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pet_posts/1 or /pet_posts/1.json
  def update
    respond_to do |format|
      if @pet_post.update(pet_post_params)
        format.html { redirect_to pet_post_url(@pet_post), notice: "Pet post was successfully updated." }
        format.json { render :show, status: :ok, location: @pet_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pet_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pet_posts/1 or /pet_posts/1.json
  def destroy
    @pet_post.destroy

    respond_to do |format|
      format.html { redirect_to pet_posts_url, notice: "Pet post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet_post
      @pet_post = PetPost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pet_post_params
      params.require(:pet_post).permit(:title, :body, images: [])
    end
end
