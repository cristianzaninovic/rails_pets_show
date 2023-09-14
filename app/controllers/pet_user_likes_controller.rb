class PetUserLikesController < ApplicationController
  before_action :find_pet_post
  def create
    # @pet_post.pet_user_likes.create(pets_user_id: current_pets_user)
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @pet_user_like = current_pets_user.pet_user_likes.new()
      @pet_user_like.pet_post = @pet_post
      @pet_user_like.save
    end if
    redirect_to pet_post_path(@pet_post)
  end
  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @pet_user_like = @pet_post.pet_user_likes.find { |like| like.pets_user_id == current_pets_user.id}
      @pet_user_like.destroy
    end
    redirect_to pet_post_path(@pet_post)
  end
  private
  def find_pet_post
    @pet_post = PetPost.find(params[:pet_post_id])
  end
  def already_liked?
    PetUserLike.where(pets_user_id: current_pets_user.id, pet_post_id: params[:pet_post_id]).exists?
  end
end
