require "date"
require "ostruct"

module Gplanner
  class Planner
    def initialize(type:, day_in_advance: 0)
      @type = type
      @day_in_advance = day_in_advance
    end

    def meta
      OpenStruct.new(type_metadata[type.to_sym])
    end

    def self.meta_for(type, options = {})
      new(type: type, **options).meta
    end

    private

    attr_reader :type, :day_in_advance

    def type_metadata
      {
        note: note_attributes,
        day: day_attributes,
        week: week_attributes,
        month: month_attributes,
      }
    end

    def datetime
      @datetime ||= DateTime.now + day_in_advance
    end

    def format_date(type_format)
      datetime.strftime(type_format).downcase
    end

    def build_filename(filetype, format)
      [filetype, format_date(format) + ".md"].join("/")
    end

    def day_attributes
      {
        branch: format_date("%Y%m%d-%A"),
        filename: build_filename("daily", "%Y%m%d-%A"),
        message: "Add daily plans for #{format_date('%B %d, %Y')}",
      }
    end

    def week_attributes
      {
        branch: format_date("%Y%m%d-week-%V"),
        filename: build_filename("weekly", "%Y%m%d-week-%V"),
        message: "Add weekly plans for week #{format_date('%V, %Y')}",
      }
    end

    def month_attributes
      {
        branch: format_date("%Y%m%d-%B"),
        filename: build_filename("monthly", "%Y%m%d-%B"),
        message: "Add monthly plans for #{format_date('%B, %Y')}",
      }
    end

    def note_attributes
      {
        branch: format_date("%Y%m%d-%A"),
        filename: build_filename("notes", "%Y%m%d-%A"),
        message: "Add notes for #{format_date('%B %d, %Y')}",
      }
    end
  end
end
