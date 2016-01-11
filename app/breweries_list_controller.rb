class BreweriesListController <UITableViewController
  CELLID = 'CellId'

  def init
    self.tabBarItem = UITabBarItem.alloc.initWithTitle('List', image:UIImage.imageNamed('list.png'), tag:2)
    self
  end

  def viewDidLoad
    view.dataSource = view.delegate = self
  end

  def viewWillAppear(animated)
    navigationController.setNavigationBarHidden(true, animated:true)
  end
  
  def tableView(tableView, numberOfRowsInSection:section)
    Brewery.all.count
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CELLID) || begin
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:CELLID)
      cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton
      cell
   end
    cell.textLabel.text = Brewery.all[indexPath.row].title
    cell
  end

  def tableView(tableView, accessoryButtonTappedForRowWithIndexPath:indexPath)
    brewery = Brewery.all[indexPath.row]
    navigationController.pushViewController(breweryDetailsController, animated:true)
    breweryDetailsController.showDetailsForBrewery(brewery)
  end

  private
  def breweryDetailsController
    @breweryDetailsController ||= BreweryDetailsController.alloc.init
  end
end

