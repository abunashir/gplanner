require "spec_helper"

RSpec.describe "Commit message" do
  describe "commit" do
    it "builds commit messages for the type" do
      command = %w(commit day)
      allow(DateTime).to receive(:now).and_return(DateTime.new(2017, 12, 25))

      output = capture_stdout { Gplanner.run(command) }

      expect(output).to match(/Add daily plans for december 25, 2017/)
    end
  end
end
