RSpec.describe Rtr::Router do
  let(:rule) { Rtr::Rule.new }

  describe "class" do
    subject { described_class }

    describe ".new" do
      context "when good args" do
        it "returns router" do
          expect(subject.new rule).to be_instance_of described_class
        end
      end

      context "when bad args" do
        it "raises ArgumentError" do
          expect { subject.new }.to       raise_error(ArgumentError).with_message(/\Awrong number of arguments/)
          expect { subject.new nil }.to   raise_error(ArgumentError).with_message("'rule' should be an instance of Rule")
          expect { subject.new true }.to  raise_error(ArgumentError).with_message("'rule' should be an instance of Rule")
          expect { subject.new "abc" }.to raise_error(ArgumentError).with_message("'rule' should be an instance of Rule")
        end
      end
    end
  end

  describe "instance" do

  end
end
