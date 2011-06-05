# encoding: utf-8
require 'spec_helper'

describe ForgeryJa::Name do
  describe ".last_name" do
    context "名字(漢字)が返る" do
      subject { ForgeryJa(:name).last_name(:to => ForgeryJa::KANJI) }
      it { should match /^[^A-Za-zｱ-ﾝｧ-ｮｯｰﾟﾞ･]+$/ }
    end
  end
  describe ".first_name" do
    context "名前(漢字)が返る" do
      subject { ForgeryJa(:name).first_name(:to => ForgeryJa::KANJI) }
      it { should match /^[^A-Za-zｱ-ﾝｧ-ｮｯｰﾟﾞ･]+$/ }
    end
  end
  describe ".male_first_name" do
    context "名前(ひらがな)が返る" do
      subject { ForgeryJa(:name).male_first_name(:to => ForgeryJa::HIRA) }
      it { should match /^[あ-んが-ぼぁ-ょゎっー]+$/ }
    end
  end
  describe ".female_first_name" do
    context "名前(カタカナ)が返る" do
      subject { ForgeryJa(:name).female_first_name(:to => ForgeryJa::KANA) }
      it { should match /^[ア-ンガ-ボァ-ョヮッー]+$/ }
    end
  end
  describe ".full_name" do
    context "フルネーム(漢字)が返る" do
      subject { ForgeryJa(:name).full_name(:to => ForgeryJa::KANJI) }
      it { should match /^[^A-Za-zｱ-ﾝｧ-ｮｯｰﾟﾞ･]+ [^A-Za-zｱ-ﾝｧ-ｮｯｰﾟﾞ･]+$/ }
    end
    context "フルネーム(ひらがな)が返る" do
      subject { ForgeryJa(:name).full_name(:to => ForgeryJa::HIRA) }
      it { should match /^[あ-んが-ぼぁ-ょゎっー]+ [あ-んが-ぼぁ-ょゎっー]+$/ }
    end
    context "フルネーム(カタカナ)が返る" do
      subject { ForgeryJa(:name).full_name(:to => ForgeryJa::KANA) }
      it { should match /^[ア-ンガ-ボァ-ョヮッー]+ [ア-ンガ-ボァ-ョヮッー]+$/ }
    end
    context "フルネーム(半角カタカナ)が返る" do
      subject { ForgeryJa(:name).full_name(:to => ForgeryJa::H_KANA) }
      it { should match /^[ｱ-ﾝｧ-ｮｯｰﾟﾞ･]+ [ｱ-ﾝｧ-ｮｯｰﾟﾞ･]+$/ }
    end
    context "フルネーム(ローマ字)が返る" do
      subject { ForgeryJa(:name).full_name(:to => ForgeryJa::ROMA) }
      it { should match /^[a-zA-Z-]+ [a-zA-Z-]+$/ }
    end
  end
  describe ".company_name" do
    context "企業名が返る" do
      subject { ForgeryJa(:name).company_name(:to => ForgeryJa::KANJI) }
      it { should be_kind_of(String)  }
    end
  end
end
