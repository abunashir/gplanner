module Gplanner
  class Command < Thor
    desc "plan", "Plan your day, week and month"
    option :editor, type: :boolean, aliases: "-e", desc: "Open file in Vim"

    def plan(plan_type = "day")
      meta = Planner.meta_for(plan_type)
      create_planner_file(meta, options)
    end

    desc "commit", "Build commit message for types"

    def commit(plan_type = "day")
      say(Planner.meta_for(plan_type).message)
    end

    desc "note", "Create a new daily note"
    option :editor, type: :boolean, aliases: "-e", desc: "Open file in Vim"

    def note
      meta = Planner.meta_for("note")
      create_planner_file(meta, options)
    end

    private

    def execute_command(command)
      Gplanner.command_line(command)
    end

    def create_planner_file(meta, options = {})
      execute_command "git checkout -b #{meta.branch}"
      execute_command "touch #{meta.filename}"

      if options[:editor]
        execute_command "vim #{meta.filename}"
      end
    end
  end
end
