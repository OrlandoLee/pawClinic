require 'spec_helper'

describe Question do
  before { @question = Question.new(pet_owner_id: "1", content: "test content",category: "dog") }

     subject { @question }

     it { should respond_to(:pet_owner_id) }
     it { should respond_to(:content) }
     it { should respond_to(:category) }
     
      it { should be_valid }

          describe "when pet_owner_id is not present" do
            before { @question.pet_owner_id = "" }
            it { should_not be_valid }
          end

          describe "when content is not present" do
             before { @question.content = "" }
             it { should_not be_valid }
           end

end