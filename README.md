# Oyster-Card Challenge

* Week 2 at Makers Academy.
* Test driven Ruby project.
* The challenge was to recreate the logic behind an oyster card, which charges the correct amount for a journey when a user touches out, and logs successive journeys.
* To play with the code clone this repository, navigate to the folder, open `pry` or `irb` and do something like the following...

```
[1] pry(main)> require './lib/oystercard.rb'
=> true
[2] pry(main)> card = Oystercard.new
=> #<Oystercard:0x007f949b1da268 @balance=0, @journey_log=#<JourneyLog:0x007f949b1da1a0 @journey_class=Journey, @journeys=[]>>
[3] pry(main)> card.top_up(20)
=> 20
[4] pry(main)> pimlico = Station.new('Pimlico', 1)
=> #<Station:0x007f949c027e10 @name="Pimlico", @zone=1>
[5] pry(main)> leyton = Station.new('Leyton', 3)
=> #<Station:0x007f949b068b28 @name="Leyton", @zone=3>
[6] pry(main)> card.touch_in(pimlico)
=> #<Journey:0x007f949b2904a0 @entry_station=#<Station:0x007f949c027e10 @name="Pimlico", @zone=1>, @exit_station=nil>
[7] pry(main)> card.touch_out(leyton)
=> 17
[8] pry(main)> card.balance
=> 17
[9] pry(main)> card.journey_log.journeys
=> [#<Journey:0x007f949b2904a0 @entry_station=#<Station:0x007f949c027e10 @name="Pimlico", @zone=1>, @exit_station=#<Station:0x007f949b068b28 @name="Leyton", @zone=3>>]
[10] pry(main)>
```
