require "spec_helper"

RSpec.describe "Note" do
  describe "note" do
    it "creates a blank page for notes" do
      allow(Gplanner).to receive(:command_line)
      allow(DateTime).to receive(:now).and_return(DateTime.new(2017, 12, 25))

      command = %w(note --editor)
      Gplanner.run(command)

      expected_to_run_command("vim notes/20171225-monday.md")
      expected_to_run_command("git checkout -b 20171225-monday")
    end
  end

  def expected_to_run_command(command)
    expect(Gplanner).to have_received(:command_line).with(command)
  end
end
