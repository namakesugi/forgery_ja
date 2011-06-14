# encoding: utf-8
require 'spec_helper'

describe ForgeryJa::Mobile do
  describe ".emoji_unicode" do
    it { ForgeryJa(:mobile).emoji_unicode.should be_kind_of(String) }
    it { ForgeryJa(:mobile).emoji_unicode(:docomo => false).should be_kind_of(String) }
    it { ForgeryJa(:mobile).emoji_unicode(:kddi => false).should be_kind_of(String) }
    it { ForgeryJa(:mobile).emoji_unicode(:softbank => false).should be_kind_of(String) }
    it { ForgeryJa(:mobile).emoji_unicode(:google => true).should be_kind_of(String) }
    it { ForgeryJa(:mobile).emoji_unicode(:docomo => false, :kddi => false, :softbank => false).should be_nil }
  end

  describe ".emoji_sjis" do
    it { ForgeryJa(:mobile).emoji_sjis.should be_kind_of(String) }
    it { ForgeryJa(:mobile).emoji_sjis(:docomo => false).should be_kind_of(String) }
    it { ForgeryJa(:mobile).emoji_sjis(:kddi => false).should be_kind_of(String) }
    it { ForgeryJa(:mobile).emoji_sjis(:softbank => false).should be_kind_of(String) }
    it { ForgeryJa(:mobile).emoji_sjis(:docomo => false, :kddi => false, :softbank => false).should be_nil }
  end
  
  describe ".phone_number" do
    context "何も指定しないとき" do
      subject { ForgeryJa(:mobile).phone_number }
      it { should be_kind_of(String) }
      it { should match /^0[987]0-[0-9]{4}-[0-9]{4}/}
    end
    context "hyphenにtrueを指定したとき" do
      subject { ForgeryJa(:mobile).phone_number(:hyphen => false) }
      it { should be_kind_of(String) }
      it { should match /^0[987]0[0-9]{4}[0-9]{4}/}
    end
  end

  describe ".ip" do
    it { ForgeryJa(:mobile).ip.should be_kind_of(String) }
    it { ForgeryJa(:mobile).ip(:docomo => false).should be_kind_of(String) }
    it { ForgeryJa(:mobile).ip(:docomo => false, :kddi => false, :softbank => false).should be_nil }
  end
  
  describe ".emoji_docomo_unicode" do
    it "Stringがかえること" do
      ForgeryJa(:mobile).emoji_docomo_unicode.should be_kind_of(String)
    end
  end

  describe ".emoji_docomo_sjis" do
    it "Stringがかえること" do
      ForgeryJa(:mobile).emoji_docomo_sjis.should be_kind_of(String)
    end
  end

  describe ".emoji_kddi_unicode" do
    it "Stringがかえること" do
      ForgeryJa(:mobile).emoji_kddi_unicode.should be_kind_of(String)
    end
  end

  describe ".emoji_kddi_sjis" do
    it "Stringがかえること" do
      ForgeryJa(:mobile).emoji_kddi_sjis.should be_kind_of(String)
    end
  end

  describe ".emoji_softbank_unicode" do
    it "Stringがかえること" do
      ForgeryJa(:mobile).emoji_softbank_unicode.should be_kind_of(String)
    end
  end
  
  describe ".emoji_kddi_sjis" do
    it "Stringがかえること" do
      ForgeryJa(:mobile).emoji_softbank_sjis.should be_kind_of(String)
    end
  end
  
  describe ".emoji_google_unicode" do
    it "Stringがかえること" do
      ForgeryJa(:mobile).emoji_google_unicode.should be_kind_of(String)
    end
  end
  
  describe ".docomo_ip" do
    subject { ForgeryJa(:mobile).docomo_ip }
    it { should be_kind_of(String) }
    it { should match /^[1-2]*[0-9]*[0-9]\.[1-2]*[0-9]*[0-9]\.[1-2]*[0-9]*[0-9]\.[1-2]*[0-9]*[0-9]/ }
  end
  describe ".kddi_ip" do
    subject { ForgeryJa(:mobile).kddi_ip }
    it { should be_kind_of(String) }
    it { should match /^[1-2]*[0-9]*[0-9]\.[1-2]*[0-9]*[0-9]\.[1-2]*[0-9]*[0-9]\.[1-2]*[0-9]*[0-9]/ }
  end
  describe ".softbank_ip" do
    subject { ForgeryJa(:mobile).softbank_ip }
    it { should be_kind_of(String) }
    it { should match /^[1-2]*[0-9]*[0-9]\.[1-2]*[0-9]*[0-9]\.[1-2]*[0-9]*[0-9]\.[1-2]*[0-9]*[0-9]/ }
  end
end

