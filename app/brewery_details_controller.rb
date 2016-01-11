class BreweryDetailsController <UIViewController

  def loadView 
    self.view = UIWebView.alloc.init
  end

  def viewWillAppear(animated)
    navigationController.setNavigationBarHidden(false, animated:true)
  end

 def showDetailsForBrewery(brewery)
  navigationItem.title = brewery.title
    request = NSURLRequest.requestWithURL(brewery.url)
    self.view.loadRequest(request)
 end

end