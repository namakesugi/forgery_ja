# encoding: utf-8
require 'spec_helper'

describe ForgeryJa::Date do
  describe ".day_of_week" do
    context "何も指定しないとき" do
      subject { ForgeryJa::Date::JA_DAYS.include?(ForgeryJa(:date).day_of_week) }
      it "Forgery::Date::JA_DAYSのいずれか" do
         should be_true
      end
    end
    context ":abbrにtrueを指定すると" do
      subject { ForgeryJa::Date::JA_DAYS_ABBR.include?(ForgeryJa(:date).day_of_week(:abbr => true)) }
      it "Forgery::Date::JA_DAYS_ABBRのいずれか" do
         should be_true
      end
    end
  end
  describe ".month" do
    context "何も指定しないとき" do
      subject { ForgeryJa::Date::JA_MONTHS.include?(ForgeryJa(:date).month) }
      it { should be_true }
    end
    context ":abbrにtrueを指定すると" do
      subject { ForgeryJa::Date::JA_MONTHS_WA.include?(ForgeryJa(:date).month(:wa => true)) }
      it { should be_true }
    end
  end
end
