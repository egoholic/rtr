RSpec.describe Rtr::Rule::RequestMatcher do
  let(:http_method)     { :get }
  let :url_parts do
    [
      described_class::UrlPart.new("/", required: true),
      described_class::UrlPart.new("articles", required: true)
    ]
  end

  describe "class" do
    subject { described_class }

    describe ".new" do
      context "when good args" do
        it "returns request matcher" do
          expect(subject.new http_method, url_parts).to be_instance_of described_class
        end
      end

      context "when bad args" do
        it "raises ArgumentError" do
          expect { subject.new }.to raise_error(ArgumentError).with_message(/\Awrong number of arguments/)
          expect { subject.new nil }.to raise_error(ArgumentError).with_message(/\Awrong number of arguments/)
          expect { subject.new nil, nil }.to raise_error(ArgumentError).with_message("'http_method' should be an instance of Symbol")
          expect { subject.new true, nil }.to raise_error(ArgumentError).with_message("'http_method' should be an instance of Symbol")
          expect { subject.new "get", nil }.to raise_error(ArgumentError).with_message("'http_method' should be an instance of Symbol")
          expect { subject.new :pet, nil }.to raise_error(ArgumentError).with_message("'http_method' has wrong HTTP method/verb")
          expect { subject.new :get, nil }.to raise_error(ArgumentError).with_message("'url_parts' should be an instance of Array")
        end
      end
    end
  end

  describe "instance" do

  end
end
