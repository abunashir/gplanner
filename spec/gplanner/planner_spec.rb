require "spec_helper"

RSpec.describe Gplanner::Planner do
  describe ".meta_for" do
    context "day as an argument" do
      it "returns day planning attributes" do
        stub_current_date_to(DateTime.new(2017, 12, 24))

        meta = Gplanner::Planner.meta_for("day", day_in_advance: 1)

        expect(meta.branch).to eq("20171225-monday")
        expect(meta.filename).to eq("daily/20171225-monday.md")
        expect(meta.message).to eq("Add daily plans for december 25, 2017")
      end
    end

    context "week as an argument" do
      it "returns week planning attributes" do
        stub_current_date_to(DateTime.new(2017, 12, 25))

        meta = Gplanner::Planner.meta_for("week")

        expect(meta.branch).to eq("20171225-week-52")
        expect(meta.filename).to eq("weekly/20171225-week-52.md")
        expect(meta.message).to eq("Add weekly plans for week 52, 2017")
      end
    end

    context "month as an argument" do
      it "returns month planning attributes" do
        stub_current_date_to(DateTime.new(2017, 12, 25))

        meta = Gplanner::Planner.meta_for("month")

        expect(meta.branch).to eq("20171225-december")
        expect(meta.filename).to eq("monthly/20171225-december.md")
        expect(meta.message).to eq("Add monthly plans for december, 2017")
      end
    end
  end

  def stub_current_date_to(expected_date)
    allow(DateTime).to receive(:now).and_return(expected_date)
  end
end
