require 'spec_helper'


describe Answer do
  before { @answer = Answer.new(expert_id: "1", content: "test content",question_id: "1") }

     subject { @answer }

     it { should respond_to(:expert_id) }
     it { should respond_to(:content) }
     it { should respond_to(:question_id) }
     
      it { should be_valid }

          describe "when expert_id is not present" do
            before { @answer.expert_id = "" }
            it { should_not be_valid }
          end

          describe "when content is not present" do
             before { @answer.content = "" }
             it { should_not be_valid }
           end
           
           describe "when question_id is not present" do
             before { @answer.question_id = "" }
             it { should_not be_valid }
           end

end