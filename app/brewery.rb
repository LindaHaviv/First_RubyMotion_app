class Brewery


  def initialize(latitude, longitude, name, url)
    @name = name
    @coordinate = CLLocationCoordinate2D.new
    @coordinate.latitude = latitude
    @coordinate.longitude = longitude
    @url = NSURL.alloc.initWithString(url)
  end

  def title
    @name
  end

  def coordinate
    @coordinate
  end

  def url
    @url
  end

  
  class << self
   def all
    [
      Brewery.new(40.7089654, -74.0114969, 'Trinity Place Bar', 'http://www.trinityplacenyc.com'),
      Brewery.new( 40.7033, -74.011034, 'The Dead Rabbit', 'http://www.deadrabbitnyc.com/'),
      Brewery.new(40.7050392,-74.0079998, 'Bar Seven Five', 'http://newyork.wallstreet.andaz.hyatt.com/en/hotel/dining.html'),
      Brewery.new(40.7103805, -74.0166051, 'Black Hound Bar & Lounge', 'http://blackhoundbar.com'),
      Brewery.new(50.895942, 2.721262, 'Westvleteren', 'http://en.wikipedia.org/wiki/Westvleteren_Brewery'),
      Brewery.new(51.298800, 5.488570, 'Achel', 'http://en.wikipedia.org/wiki/Achel_Brewery')
    ]
   end
 end


end