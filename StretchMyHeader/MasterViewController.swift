//
//  MasterViewController.swift
//  StretchMyHeader
//
//  Created by Jeff Huang on 2015-08-04.
//  Copyright (c) 2015 Jeff Huang. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [AnyObject]()
    @IBOutlet weak var headerUIView: UIView!
    @IBOutlet weak var headerImageVIew: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!




    override func awakeFromNib() {
        super.awakeFromNib()
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            self.clearsSelectionOnViewWillAppear = false
            self.preferredContentSize = CGSize(width: 320.0, height: 600.0)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()

        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = controllers[controllers.count-1].topViewController as? DetailViewController
        }
        
        self.navigationController?.navigationBarHidden = true
        UIApplication.sharedApplication().statusBarHidden = true
        
        self.populateNewsItem()

        var dateformatter = NSDateFormatter()
        dateformatter.dateStyle = NSDateFormatterStyle.LongStyle
        self.headerLabel.text = dateformatter.stringFromDate(NSDate())
        
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(sender: AnyObject) {
        objects.insert(NSDate(), atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let object = objects[indexPath.row] as! NSDate
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! NewsTableViewCell

        let object = objects[indexPath.row] as! NewsItem
        cell.labelCategory.text = object.category
        cell.labelCategory.textColor = object.categoryColor
        cell.labelHeadline.text = object.headline
        
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    func populateNewsItem(){
        var item = NewsItem(category: NewsItem.Category.World, headline: "Climate change protests, divestments meet fossil fuels realities")
        objects.append(item)
        item = NewsItem(category: NewsItem.Category.Europe, headline: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'")
        objects.append(item)
        item = NewsItem(category: NewsItem.Category.MiddleEast, headline: "Airstrikes boost Islamic State, FBI director warns more hostages possible")
        objects.append(item)
        item = NewsItem(category: NewsItem.Category.Africa, headline: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim")
        objects.append(item)
        item = NewsItem(category: NewsItem.Category.AsiaPacific, headline: "Despite UN ruling, Japan seeks backing for whale hunting")
        objects.append(item)
        item = NewsItem(category: NewsItem.Category.Americas, headline: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria")
        objects.append(item)
        item = NewsItem(category: NewsItem.Category.World, headline: "South Africa in $40 billion deal for Russian nuclear reactors")
        objects.append(item)
        item = NewsItem(category: NewsItem.Category.Europe, headline: "'One million babies' created by EU student exchanges")
        objects.append(item)
    }


}

