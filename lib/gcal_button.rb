require 'date'

class GcalButton
  def self.event_url(title, start_date, end_date, sprops)
    "http://www.google.com/calendar/event?action=TEMPLATE&text;=My Event&dates;=20430426T180000Z/20430426T200000Z&sprop;=website:http://www.eventcompany.com"
  end
end
