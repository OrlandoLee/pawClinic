module SessionsHelper
  def sign_in_expert(expert)
      remember_token = Expert.new_remember_token
      cookies.permanent[:remember_token] = remember_token#needs to change
      expert.update_attribute(:remember_token, Expert.encrypt(remember_token))
      self.current_expert = expert
    end
    
    def sign_in_pet_owner(pet_owner)
        remember_token = PetOwner.new_remember_token
        cookies.permanent[:remember_token] = remember_token#needs to change
        pet_owner.update_attribute(:remember_token, PetOwner.encrypt(remember_token))
        self.current_pet_owner = pet_owner
    end
    
    def current_expert=(expert)
        @current_expert = expert
    end
    
    def current_expert
        remember_token = Expert.encrypt(cookies[:remember_token])
        @current_expert ||= Expert.find_by(remember_token: remember_token)
    end
    
    def current_pet_owner=(pet_owner)
        @current_pet_owner = pet_owner
    end
    
    def current_pet_owner
        remember_token = PetOwner.encrypt(cookies[:remember_token])
        @current_pet_owner ||= PetOwner.find_by(remember_token: remember_token)
    end
    
    def signed_in_expert?
        !current_expert.nil?
    end
    
    def signed_in_pet_owner?
        !current_pet_owner.nil?
    end
    
    def sign_out_pet_owner
        current_pet_owner.update_attribute(:remember_token,
                                      PetOwner.encrypt(PetOwner.new_remember_token))
        cookies.delete(:remember_token)
        self.current_pet_owner = nil
    end
      
    def sign_out_expert
          current_expert.update_attribute(:remember_token,
                                        Expert.encrypt(Expert.new_remember_token))
          cookies.delete(:remember_token)
          self.current_expert = nil
    end
end
