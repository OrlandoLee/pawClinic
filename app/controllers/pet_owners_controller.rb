class PetOwnersController < ApplicationController
  before_action :set_pet_owner, only: [:show, :edit, :update, :destroy]

  # GET /pet_owners
  # GET /pet_owners.json
  def index
    @pet_owners = PetOwner.all
  end

  # GET /pet_owners/1
  # GET /pet_owners/1.json
  def show
  end

  # GET /pet_owners/new
  def new
    @pet_owner = PetOwner.new
  end

  # GET /pet_owners/1/edit
  def edit
  end

  # POST /pet_owners
  # POST /pet_owners.json
  def create
    @pet_owner = PetOwner.new(pet_owner_params)

    respond_to do |format|
      if @pet_owner.save
        format.html { redirect_to @pet_owner, notice: 'Pet owner was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pet_owner }
      else
        format.html { render action: 'new' }
        format.json { render json: @pet_owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pet_owners/1
  # PATCH/PUT /pet_owners/1.json
  def update
    respond_to do |format|
      if @pet_owner.update(pet_owner_params)
        format.html { redirect_to @pet_owner, notice: 'Pet owner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pet_owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pet_owners/1
  # DELETE /pet_owners/1.json
  def destroy
    @pet_owner.destroy
    respond_to do |format|
      format.html { redirect_to pet_owners_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet_owner
      @pet_owner = PetOwner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_owner_params
      params.require(:pet_owner).permit(:username, :email, :pet)
    end
end
