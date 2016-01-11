RSpec.describe Rtr::Rule::RequestMatcher::UrlPart do
  describe "class" do
    subject { described_class }

    context "when good args" do
      it "returns URL part" do
        expect(subject.new "publications", required: true).to        be_instance_of described_class
        expect(subject.new(/\Apublications/, required: true)).to     be_instance_of described_class
        expect(subject.new 1, required: false).to                    be_instance_of described_class
        expect(subject.new 99999999999999999999, required: false).to be_instance_of described_class
      end
    end

    context "when bad args" do
      it "raises ArgumentError" do
        expect { subject.new }.to                               raise_error(ArgumentError).with_message(/\Awrong number of arguments/)
        expect { subject.new nil }.to                           raise_error(ArgumentError).with_message("missing keyword: required")
        expect { subject.new nil, required: nil }.to            raise_error(ArgumentError).with_message("'part' should be an instance of String, Regexp, Fixnum or Bignum")
        expect { subject.new true, required: nil }.to           raise_error(ArgumentError).with_message("'part' should be an instance of String, Regexp, Fixnum or Bignum")
        expect { subject.new [1, 2, 3], required: nil }.to      raise_error(ArgumentError).with_message("'part' should be an instance of String, Regexp, Fixnum or Bignum")
        expect { subject.new "publications", required: nil }.to raise_error(ArgumentError).with_message("'required' should be an instance of TrueClass or FalseClass")
        expect { subject.new "publications", required: 5 }.to   raise_error(ArgumentError).with_message("'required' should be an instance of TrueClass or FalseClass")
      end
    end
  end

  describe "instance" do
    subject { described_class.new *args }

    describe "#matches?" do
      context "when good args" do
        context "when required" do
          let(:args) { ["string", required: true] }

          context "when matches" do
            it "returns true" do
              expect(subject.matches? "string").to be true
            end
          end
        end
      end

      context "when bad args" do

      end
    end
  end
end
