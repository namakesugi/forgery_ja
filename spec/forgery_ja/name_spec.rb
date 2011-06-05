# encoding: utf-8
require 'spec_helper'

describe ForgeryJa::Name do
  describe ".last_name" do
    context "名字(漢字)が返る" do
      subject { ForgeryJa(:name).last_name(ForgeryJa::KANJI) }
      it { should match /^[^あ-んa-zア-ンｱｰﾝ]+$/ }
    end
    context "名字(ひらがな)が返る" do
      subject { ForgeryJa(:name).last_name(ForgeryJa::HIRA) }
      it { should.is_a?(String) }
    end
    context "名字(カタカナ)が返る" do
      subject { ForgeryJa(:name).last_name(ForgeryJa::KANA) }
      it { should.is_a?(String) }
    end
    context "名字(半角カタカナ)が返る" do
      subject { ForgeryJa(:name).last_name(ForgeryJa::H_KANA) }
      it { should.is_a?(String) }
    end
    context "名字(ローマ字)が返る" do
      subject { ForgeryJa(:name).last_name(ForgeryJa::ROMA) }
      it { should.is_a?(String) }
    end
  end
end
