class SessionsController < ApplicationController
  def new
  end
  
  def create
    if(params[:session][:role]=="true")
    expert = Expert.find_by(email: params[:session][:email].downcase)
      if expert && expert.authenticate(params[:session][:password])
        sign_in_expert expert
        redirect_to expert
        # Sign the user in and redirect to the user's show page.
      else
        # Create an error message and re-render the signin form.
       
        render 'new'
      end
    else
      pet_owner = PetOwner.find_by(email: params[:session][:email].downcase)
        if pet_owner && pet_owner.authenticate(params[:session][:password])
          # Sign the user in and redirect to the user's show page.
          sign_in_pet_owner pet_owner
          redirect_to pet_owner
        else
          # Create an error message and re-render the signin form.
          render 'new'
        end
    end
  end
  
  def destroy
    if(signed_in_expert?)
      sign_out_expert
      redirect_to root_url
    elsif(signed_in_pet_owner?)
      sign_out_pet_owner
      redirect_to root_url
    else
      redirect_to root_url
    end
  end
end
