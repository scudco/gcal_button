require 'gcal_button'

describe GcalButton do
  it "returns a Google Calendar Event URL" do
    start_time = "April 26, 2043 6:00 PM"
    end_time = "April 26, 2043 8:00 PM"

    url = GcalButton.event_url("My Event",
                               DateTime.parse(start_time),
                               DateTime.parse(end_time),
                               "http://myeventcompany.com")

    expected_url = "http://www.google.com/calendar/event?" +
                    "action=TEMPLATE&" +
                    "text;=My Event&" +
                    "dates;=20430426T180000Z/20430426T200000Z&" +
                    "sprop;=website:http://www.eventcompany.com"

    url.should eql(expected_url)
  end
end
