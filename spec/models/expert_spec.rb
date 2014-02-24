require 'spec_helper'

describe Expert do
  before { @expert = Expert.new(username: "Example User", email: "user@example.com",level: 1,question_answered: 10,password: "foobar", password_confirmation: "foobar") }

     subject { @expert }

     it { should respond_to(:username) }
     it { should respond_to(:email) }
     it { should respond_to(:level) }
     it { should respond_to(:question_answered) }
     it { should respond_to(:password_digest) }
     it { should respond_to(:password) }
     it { should respond_to(:password_confirmation) }
     it { should respond_to(:authenticate) }
     
     it { should be_valid }

       describe "when username is not present" do
         before { @expert.username = " " }
         it { should_not be_valid }
       end
       
       describe "when email is not present" do
          before { @expert.email = " " }
          it { should_not be_valid }
        end
        
        describe "when level is not present" do
            before { @expert.level = " " }
            it { should_not be_valid }
          end
          
        describe "when question_answered is not present" do
              before { @expert.question_answered = " " }
              it { should_not be_valid }
          end
          
          describe "when name is too long" do
              before { @expert.username = "a" * 51 }
              it { should_not be_valid }
            end
            describe "when email format is invalid" do
                it "should be invalid" do
                  addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                                 foo@bar_baz.com foo@bar+baz.com]
                  addresses.each do |invalid_address|
                    @expert.email = invalid_address
                    expect(@expert).not_to be_valid
                  end
                end
              end

              describe "when email format is valid" do
                it "should be valid" do
                  addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
                  addresses.each do |valid_address|
                    @expert.email = valid_address
                    expect(@expert).to be_valid
                  end
                end
              end
              
               describe "when email address is already taken" do
                    before do
                      user_with_same_email = @expert.dup
                      user_with_same_email.save
                    end

                    it { should_not be_valid }
                  end
                  
                  describe "when email address is already taken" do
                     before do
                       user_with_same_email = @expert.dup
                       user_with_same_email.email = @expert.email.upcase
                       user_with_same_email.save
                     end

                     it { should_not be_valid }
                   end
                   
                   describe "when password is not present" do
                     before do
                       @expert = Expert.new(username: "Example User", email: "user@example.com",level: 1,question_answered: 10,password: "", password_confirmation: "")
                     end
                     it { should_not be_valid }
                   end
                       
                       
                   describe "when password doesn't match confirmation" do
                     before { @expert.password_confirmation = "mismatch" }
                     it { should_not be_valid }
                   end
                   
                   describe "return value of authenticate method" do
                     before { @expert.save }
                     let(:found_expert) { Expert.find_by(email: @expert.email) }

                     describe "with valid password" do
                       it { should eq found_expert.authenticate(@expert.password) }
                     end

                     describe "with invalid password" do
                       let(:expert_for_invalid_password) { found_expert.authenticate("invalid") }

                       it { should_not eq expert_for_invalid_password }
                       specify { expect(expert_for_invalid_password).to be_false }
                     end
                   end
                   describe "with a password that's too short" do
                     before { @expert.password = @expert.password_confirmation = "a" * 5 }
                     it { should be_invalid }
                   end
                   
                   describe "return value of authenticate method" do
                     before { @expert.save }
                     let(:found_expert) { Expert.find_by(email: @expert.email) }

                     describe "with valid password" do
                       it { should eq found_expert.authenticate(@expert.password) }
                     end

                     describe "with invalid password" do
                       let(:expert_for_invalid_password) { found_expert.authenticate("invalid") }

                       it { should_not eq expert_for_invalid_password }
                       specify { expect(expert_for_invalid_password).to be_false }
                     end
                   end

end