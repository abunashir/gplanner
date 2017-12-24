module Gplanner
  class Command < Thor
    desc "plan", "Plan your day, week and month"
    option :type, aliases: "-t", required: true, desc: "Type for the plan"
    option :editor, type: :boolean, aliases: "-e", desc: "Open file in Vim"

    def plan
      meta = Planner.meta_for(options[:type])
      execute_command "git checkout -b #{meta.branch}"
      execute_command "touch #{meta.filename}"

      if options[:editor]
        execute_command "vim #{meta.filename}"
      end
    end

    private

    def execute_command(command)
      Gplanner.command_line(command)
    end
  end
end
