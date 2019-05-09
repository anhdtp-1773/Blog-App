require "rails_helper"

RSpec.describe NotifierMailer, type: :mailer do
  describe "order_received" do
    let(:mail) { NotifierMailer.order_received }

    it "renders the headers" do
      expect(mail.subject).to eq("Order received")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
