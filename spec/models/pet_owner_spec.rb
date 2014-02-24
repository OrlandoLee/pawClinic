require 'spec_helper'

describe PetOwner do
 before { @pet_owner = PetOwner.new(username: "Example User", email: "user@example.com",pet: "dog",password: "foobar", password_confirmation: "foobar") }

    subject { @pet_owner }

    it { should respond_to(:username) }
    it { should respond_to(:email) }
    it { should respond_to(:pet) }
    it { should respond_to(:password_digest) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:authenticate) }
    
      it { should be_valid }

         describe "when username is not present" do
           before { @pet_owner.username = " " }
           it { should_not be_valid }
         end

         describe "when email is not present" do
            before { @pet_owner.email = " " }
            it { should_not be_valid }
          end
          
          describe "when name is too long" do
              before { @pet_owner.username = "a" * 51 }
              it { should_not be_valid }
            end
            
                describe "when email format is invalid" do
                    it "should be invalid" do
                      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                                     foo@bar_baz.com foo@bar+baz.com]
                      addresses.each do |invalid_address|
                        @pet_owner.email = invalid_address
                        expect(@pet_owner).not_to be_valid
                      end
                    end
                  end

                  describe "when email format is valid" do
                    it "should be valid" do
                      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
                      addresses.each do |valid_address|
                        @pet_owner.email = valid_address
                        expect(@pet_owner).to be_valid
                      end
                    end
                  end
                  
                  describe "when email address is already taken" do
                      before do
                        user_with_same_email = @pet_owner.dup
                        user_with_same_email.save
                      end

                      it { should_not be_valid }
                    end
                     describe "when email address is already taken" do
                          before do
                            user_with_same_email = @pet_owner.dup
                            user_with_same_email.email = @pet_owner.email.upcase
                            user_with_same_email.save
                          end

                          it { should_not be_valid }
                        end
                        
                        describe "when password is not present" do
                          before do
                            @pet_owner = PetOwner.new(username: "Example User", email: "user@example.com",pet: "dog",password: "", password_confirmation: "")
                          end
                          it { should_not be_valid }
                        end
                        
                        describe "when password doesn't match confirmation" do
                           before { @pet_owner.password_confirmation = "mismatch" }
                           it { should_not be_valid }
                         end
                        
                         describe "return value of authenticate method" do
                            before { @pet_owner.save }
                            let(:found_pet_owner) { PetOwner.find_by(email: @pet_owner.email) }

                            describe "with valid password" do
                              it { should eq found_pet_owner.authenticate(@pet_owner.password) }
                            end

                            describe "with invalid password" do
                              let(:pet_owner_for_invalid_password) { found_pet_owner.authenticate("invalid") }

                              it { should_not eq pet_owner_for_invalid_password }
                              specify { expect(pet_owner_for_invalid_password).to be_false }
                            end
                          end
                          
                          describe "with a password that's too short" do
                            before { @pet_owner.password = @pet_owner.password_confirmation = "a" * 5 }
                            it { should be_invalid }
                          end
                          
                          describe "return value of authenticate method" do
                            before { @pet_owner.save }
                            let(:found_pet_owner) { PetOwner.find_by(email: @pet_owner.email) }

                            describe "with valid password" do
                              it { should eq found_pet_owner.authenticate(@pet_owner.password) }
                            end

                            describe "with invalid password" do
                              let(:pet_owner_for_invalid_password) { found_pet_owner.authenticate("invalid") }

                              it { should_not eq pet_owner_for_invalid_password }
                              specify { expect(pet_owner_for_invalid_password).to be_false }
                            end
                          end
                    
                    
end
