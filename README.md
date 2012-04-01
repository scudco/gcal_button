# GcalButton

So say you have this event and you don't want to
require folks to copy the event information into their
Google Calendar by hand. So you visit [this wonderful page](http://support.google.com/calendar/bin/answer.py?hl=en&answer=2476685)
only to copy and paste this nonsense onto your page. You then close
you browser in disgust and take a shower to wash off your shame.

Instead of running up your water bill everytime you need to create one
of these buttons just generate these URLs with the completely unfunny
and super-seriously named GcalButton.

    button = GcalButton.new("Forever Alone",
                            Time.now,
                            Time.now + 3600)
    button.url
      #=> "http://www.google.com/calendar/event?action=TEMPLATE&dates=20120331T193722Z%2F20120331T203722Z&text=Forever+Alone"

You can also use Date objects for an all-day event:

    button = GcalButton.new("Forever Alone II: The Alonening",
                            Date.today,
                            Date.today + 1)
    button.url
      #=> "http://www.google.com/calendar/event?action=TEMPLATE&dates=20120331%2F20120401&text=Forever+Alone+II%3A+The+Alonening"

Do you have some idea what the mysterious 'sprop' variable is for?
GcalButton can totally handle that:

    button = GcalButton.new("Forever Alone with a Vengeance",
                            Date.today,
                            Date.today + 1,
                            name: "Forever Alone Inc.",
                            website: "http://foreveralone.com")
    button.url
      #=> "http://www.google.com/calendar/event?action=TEMPLATE&dates=20120331%2F20120401&sprop=name%3AForever+Alone+Inc.&sprop=website%3Ahttp%3A%2F%2Fforeveralone.com&text=Forever+Alone+with+a+Vengeance"

Do want to use Google's handy 'Add to Google Calendar' images?

    button.image_url
![Google Calendar](http://www.google.com/calendar/images/ext/gc_button1.gif)

    button.image_url(:remind_me)
![Remind me with Google Calendar](http://www.google.com/calendar/images/ext/gc_button2.gif)

    button.image_url(:add_to)
![Add to Google Calendar](http://www.google.com/calendar/images/ext/gc_button6.gif)

    button.image_url(:large)
![Google Calendar](http://www.google.com/calendar/images/ext/gc_button6.gif)

## TODO

  * Return some video tapes

## License

Please allow me to take some of your time to explain scarcity and abundance.

> [Copying is not theft](http://youtu.be/IeTybKL1pM4).  
> Stealing a thing leaves one less left.  
> Copying it makes one thing more; that's what copying's for.  
>  
> Copying is not theft.  
> If I copy yours you have it too.  
> One for me and one for you.  
> That's what copies can do.  
>  
> If I steal your bicycle you have to take the bus,  
> but if I just copy it there's one for each of us!  
> Making more of a thing, that is what we call "copying".  
> Sharing ideas with everyone--that's why copying is FUN!  
