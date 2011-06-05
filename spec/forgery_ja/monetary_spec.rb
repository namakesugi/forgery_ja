# encoding: utf-8
require 'spec_helper'

describe ForgeryJa::Monetary do
  describe ".formatted_money" do
    context "何も指定しないと" do
      subject { ForgeryJa(:monetary).formatted_money }
      it { should match /^[1-9]*[0-9]*円$/ }
    end
    context "formatを指定すると" do
      subject { ForgeryJa(:monetary).formatted_money(:format => '\%d') }
      it { should match /^\\[1-9]+[0-9]*$/ }
    end
  end
  describe ".popularity_money" do
    context "何も指定しないと" do
      subject  { ForgeryJa(:monetary).popularity_money.to_s }
      it { should match /^[1-9]980$/ }
    end
    context "digitを5にすると" do
      subject  { ForgeryJa(:monetary).popularity_money(:digit => 5).to_s }
      it { should match /^[1-9]9800$/ }
    end
    context "digitを3にすると" do
      subject  { ForgeryJa(:monetary).popularity_money(:digit => 3).to_s }
      it { should match /^[1-9]98$/ }
    end
    context "digitを2にすると" do
      subject  { ForgeryJa(:monetary).popularity_money(:digit => 2).to_s }
      it { should match /^[1-9]0$/ }
    end
  end

  describe ".money" do
    context "何も指定しないと" do
      subject { ForgeryJa(:monetary).money }
      it { should >= 0 }
      it { should <= 1000 }
    end
    context "maxに0, minに0を指定すると" do
      subject { ForgeryJa(:monetary).money(:max => 0, :min =>0) }
      it { should eql 0 }
    end
    context "maxに1000, minに1000を指定すると" do
      subject { ForgeryJa(:monetary).money(:max => 1000, :min => 1000) }
      it { should eql 1000 }
    end
  end
end
