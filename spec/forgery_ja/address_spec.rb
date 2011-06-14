# encoding: utf-8
require 'spec_helper'

describe ForgeryJa::Address do
  describe ".zip" do
    context "何も指定しないとき" do
      subject { ForgeryJa(:address).zip }
      it { should match /^[0-9]{3}-[0-9]{4}+$/ }
    end
    context "hyphenをfalseにしたとき" do
      subject { ForgeryJa(:address).zip(:hyphen => false) }
      it { should match /^[0-9]{7}+$/ }
    end
  end

  describe ".street_name" do
    context "何も指定しないとき" do
      subject { ForgeryJa(:address).street_name }
      it { should match /^[^A-Za-zｱ-ﾝｧ-ｮｯｰﾟﾞ･]+$/ }
    end
  end

  describe ".street_number" do
    context "番地が返る" do
      subject { ForgeryJa(:address).street_number }
      it { should be_kind_of(String) }
    end
  end

  describe ".city" do
    context "何も指定しないとき" do
      subject { ForgeryJa(:address).city }
      it { should match /^[^A-Za-zｱ-ﾝｧ-ｮｯｰﾟﾞ･]+$/ }
    end
  end

  describe ".state" do
    
    context "ForgeryJa::KANJIを指定したとき" do
      subject { ForgeryJa(:address).state(:to => ForgeryJa::KANJI) }
      it { should match /^[一-龠]+$/ }
    end
    
    context "ForgeryJa::HIRAを指定したとき" do
      subject { ForgeryJa(:address).state(:to => ForgeryJa::HIRA) }
      it { should match /^[あ-んが-ぼぁ-ょゎっー]+$/ }
    end
    
    context "ForgeryJa::KANAを指定したとき" do
      subject { ForgeryJa(:address).state(:to => ForgeryJa::KANA) }
      it { should match /^[ア-ンガ-ボァ-ョヮッー]+$/ }
    end
    
    context "ForgeryJa::H_KANAを指定したとき" do
      subject { ForgeryJa(:address).state(:to => ForgeryJa::H_KANA) }
      it { should match /^[ｱ-ﾝｧ-ｮｯｰﾟﾞ･]+$/ }
    end
    
    context "ForgeryJa::ROMAを指定したとき" do
      subject { ForgeryJa(:address).state(:to => ForgeryJa::ROMA) }
      it { should match /^[a-zA-Z-]+$/ }
    end
    
  end

  describe ".full_address" do
    context "何も指定しないとき" do
      subject { ForgeryJa(:address).full_address }
      it { should be_kind_of(String) }
    end
    context "ForgeryJa::ARRAYを指定し、blankをtrueにしたとき" do
      let(:res){ ForgeryJa(:address).full_address(:to => ForgeryJa::ARRAY, :blank => true) }
      it { res.should be_kind_of(Array) }
      it { res.should have(5).items }
      it { res[0].split(' ').should have(4).items }
    end
  end
  
  describe ".address_list" do
    context "何も指定しないとき" do
      let(:res){ForgeryJa(:address).address_list }
      it "4つのkeyをもつHash" do
        res.should be_kind_of(Hash)
        res.should have(4).items
      end
      it ":stateというkeyをもちvalueはArray" do
        res.should be_has_key(:state)
        res[:state].should be_kind_of(Array)
      end
      it ":cityというkeyをもちvalueはArray" do
        res.should be_has_key(:city)
        res[:city].should be_kind_of(Array)
      end
      it ":streetというkeyをもちvalueはArray" do
        res.should be_has_key(:street)
        res[:street].should be_kind_of(Array)
      end
      it ":numberというkeyをもちvalueはString" do
        res.should be_has_key(:number)
        res[:number].should be_kind_of(String)
      end
    end
    
    context ":stateにfalseを指定したとき" do
      let(:res){ ForgeryJa(:address).address_list(:state => false) }
      it "3つのkeyをもつHash" do
        res.should be_kind_of(Hash)
        res.should have(3).items
      end
      it ":stateというkeyはもたない" do
        res.should_not be_has_key(:state)
      end
    end
    
    context ":cityにfalseを指定したとき" do
      let(:res){ ForgeryJa(:address).address_list(:city => false) }
      it "3つのkeyをもつHash" do
        res.should be_kind_of(Hash)
        res.should have(3).items
      end
      it ":cityというkeyはもたない" do
        res.should_not be_has_key(:city)
      end
    end
    
    context ":street,:cityにfalseを指定したとき" do
      let(:res){ ForgeryJa(:address).address_list(:city => false, :street => false) }
      it "2つのkeyをもつHash" do
        res.should be_kind_of(Hash)
        res.should have(2).items
      end
      it ":city,:streetというkeyはもたない" do
        res.should_not be_has_key(:city)
        res.should_not be_has_key(:street)
      end
    end
    
    context ":number,:stateにfalseを指定したとき" do
      let(:res){ ForgeryJa(:address).address_list(:state => false, :number => false) }
      it "2つのkeyをもつHash" do
        res.should be_kind_of(Hash)
        res.should have(2).items
      end
      it ":number,:stateというkeyはもたない" do
        res.should_not be_has_key(:number)
        res.should_not be_has_key(:state)
      end
    end
    
  end
end
