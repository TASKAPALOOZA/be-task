require "rails_helper"

describe "Hello World" do
    it "is a string that says hello world" do
        str = "Hello World"

        expect(str).to be_a(String)
        expect(str).to eq("Hello World")
    end
end