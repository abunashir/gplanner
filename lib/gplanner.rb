require "thor"
require "gplanner/version"
require "gplanner/planner"
require "gplanner/command"


module Gplanner
  def self.run(arguments)
    Gplanner::Command.start(arguments)
  end

  def self.command_line(command)
    system(command)
  end
end
