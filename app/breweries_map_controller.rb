class BreweriesMapController < UIViewController
  ViewIdentifier = 'ViewIdentifier'

  def init
    self.tabBarItem = UITabBarItem.alloc.initWithTitle('Map', image:UIImage.imageNamed('map.png'), tag:1)
    self
  end

  def loadView
    self.view = MKMapView.alloc.init
    self.view.delegate = self
  end

  def viewDidLoad
    coordinates = CLLocationCoordinate2D.new(40.7127,-74.0059)
    region = MKCoordinateRegionMake(coordinates, MKCoordinateSpanMake(0.3, 0.3))
    self.view.setRegion(region)
    
    Brewery.all.each do |brewery|
     self.view.addAnnotation(brewery)
    end
  end

  def viewWillAppear(animated)
    navigationController.setNavigationBarHidden(true, animated:true)
  end

  def mapView(mapView, viewForAnnotation:brewery)
     view = MKPinAnnotationView.alloc.initWithAnnotation(brewery, reuseIdentifier:ViewIdentifier)
     view.canShowCallout = true
     view.animatesDrop = true
     button = UIButton.buttonWithType(UIButtonTypeDetailDisclosure)
     button.addTarget(self, action: :'showDetails:', forControlEvents:UIControlEventTouchUpInside)
     view.rightCalloutAccessoryView = button
     view
  end

  def showDetails(sender)
    brewery = view.selectedAnnotations[0]
    puts brewery.url
    navigationController.pushViewController(breweryDetailsController, animated:true)
    breweryDetailsController.showDetailsForBrewery(brewery)
  end

  private
  def breweryDetailsController
    @breweryDetailsController ||= BreweryDetailsController.alloc.init
  end

end