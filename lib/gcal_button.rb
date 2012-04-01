require 'date'

class GcalButton
  GCAL_TIME_FORMAT = "%Y%m%dT%H%M%SZ"
  GCAL_DATE_FORMAT = "%Y%m%d"

  BASE_URL = "http://www.google.com/calendar/event"
  IMAGE_URLS = {
    default: "http://www.google.com/calendar/images/ext/gc_button1.gif",
    remind_me: "http://www.google.com/calendar/images/ext/gc_button2.gif",
    add_to: "http://www.google.com/calendar/images/ext/gc_button6.gif",
    large: "http://www.google.com/calendar/images/ext/gc_button6.gif"
  }

  def initialize(title, start_time, end_time, sprops={})
    @title = title
    @start_time = start_time
    @end_time = end_time
    @sprops = sprops
  end

  def url
    "#{BASE_URL}?#{query_params}"
  end

  def image_url(type=:default)
    IMAGE_URLS[type]
  end

  private
  def sprops
    @sprops.collect do |key,val|
      ["sprop", "#{key}:#{val}"]
    end
  end

  def dates
    "#{formatted_time(@start_time)}/#{formatted_time(@end_time)}"
  end

  def formatted_time(time)
    if time.class == Date
      time.strftime(GCAL_DATE_FORMAT)
    else
      time.strftime(GCAL_TIME_FORMAT)
    end
  end

  def query_params
    params = {
      action: "TEMPLATE",
      dates: dates,
      text: @title
    }

    params = params.to_a + sprops

    params.collect do |key, value|
      to_query(key, value)
    end.sort * '&'
  end

  def to_query(key, value)
    require 'cgi' unless defined?(CGI) && defined?(CGI::escape)
    "#{CGI.escape(key.to_s)}=#{CGI.escape(value.to_s)}"
  end
end
