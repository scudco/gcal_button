require 'gcal_button'

describe GcalButton do
  let (:start_time) { DateTime.parse("April 26, 2043 6:00 PM-07:00") }
  let (:end_time) { DateTime.parse("April 26, 2043 8:00 PM-07:00") }
  let (:button) do
    GcalButton.new("My Event",
                   start_time,
                   end_time,
                   website: "http://www.myeventcompany.com")
  end

  describe "#url" do
    it "returns a Google Calendar Event URL" do
      url = "http://www.google.com/calendar/event?" +
        "action=TEMPLATE&" +
        "dates=20430427T010000Z%2F20430427T030000Z&" +
        "sprop=website%3Ahttp%3A%2F%2Fwww.myeventcompany.com&" +
        "text=My+Event"

      button.url.should eql(url)
    end

    it "can leave off the sprop hash" do
      button = GcalButton.new("My Event",
                              start_time,
                              end_time)
      url = "http://www.google.com/calendar/event?" +
        "action=TEMPLATE&" +
        "dates=20430427T010000Z%2F20430427T030000Z&" +
        "text=My+Event"
      button.url.should eql(url)
    end

    it "can accept multiple sprop values" do
      button = GcalButton.new("My Event",
                              start_time,
                              end_time,
                              website: "http://www.myeventcompany.com",
                              name: "My Event Company")

      url = "http://www.google.com/calendar/event?" +
        "action=TEMPLATE&" +
        "dates=20430427T010000Z%2F20430427T030000Z&" +
        "sprop=name%3AMy+Event+Company&" +
        "sprop=website%3Ahttp%3A%2F%2Fwww.myeventcompany.com&" +
        "text=My+Event"

      button.url.should eql(url)
    end

    it "can accept Date objects for all day events" do
      button = GcalButton.new("My Event",
                              Date.parse("29 December 2027"),
                              Date.parse("30 December 2027"),
                              name: "My Event Company")

      url = "http://www.google.com/calendar/event?" +
        "action=TEMPLATE&" +
        "dates=20271229%2F20271230&" +
        "sprop=name%3AMy+Event+Company&" +
        "text=My+Event"

      button.url.should eql(url)
    end
  end

  describe "#image_url" do
    it "returns the URL to the 'Google Calendar' button image" do
      url = "http://www.google.com/calendar/images/ext/gc_button1.gif"
      button.image_url.should eql(url)
    end

    it "returns the URL to the 'Remind me with Google Calendar' button image" do
      url = "http://www.google.com/calendar/images/ext/gc_button2.gif"
      button.image_url(:remind_me).should eql(url)
    end

    it "returns the URL to the 'Add to Google Calendar' button image" do
      url = "http://www.google.com/calendar/images/ext/gc_button6.gif"
      button.image_url(:add_to).should eql(url)
    end

    it "returns the URL to a larger 'Google Calendar' button image" do
      url = "http://www.google.com/calendar/images/ext/gc_button6.gif"
      button.image_url(:large).should eql(url)
    end
  end
end
