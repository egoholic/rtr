RSpec.describe Rtr do
  describe "module" do
    subject { described_class }

    describe ".router" do
      context "when good args" do
        it "returns router" do
          expect(subject.router { |rule| }).to be_instance_of described_class::Router
        end
      end

      context "when bad args" do
        it "raises ArgumentError" do
          expect { subject.router }.to raise_error(ArgumentError).with_message("no block given")
          expect { subject.router nil }.to raise_error(ArgumentError).with_message(/\Awrong number of arguments/)
        end
      end
    end
  end
end
