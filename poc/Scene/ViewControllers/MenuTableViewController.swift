//
//  MenuTableViewController.swift
//  poc
//
//  Created by Salaheddine on 19/04/2020.
//  Copyright © 2020 Salaheddine. All rights reserved.
//

import UIKit

class MenuTableViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource,UIGestureRecognizerDelegate, DimViewTouchDetectedProtocol {
    func close() {
         self.dismiss(animated: true)
    }

    var coordinator : MenuCoordinator?
    @IBOutlet var tableView: UITableView!
    var menuItems : LeftSide? 

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupTableView()
        
        self.navigationController?.navigationBar.isHidden = true

        
    }
    

    // MARK: - Table view data source
    func setupTableView(){
        
        tableView.register(MenuItemCell.self, forCellReuseIdentifier: "MenuItemCells")
        tableView.register(headerCell.self, forCellReuseIdentifier: "section")

    }
     func numberOfSections(in tableView: UITableView) -> Int {
        return menuItems?.menuItems?.count ?? 0
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return menuItems?.menuItems?[section].items?.count ?? 0
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemCell", for: indexPath) as! MenuItemCell
        guard let imageName = menuItems?.menuItems?[indexPath.section].items?[indexPath.row].icon, let textItem = menuItems?.menuItems?[indexPath.section].items?[indexPath.row].title else {
            return cell
            
            
        }
        cell.imageView?.image = UIImage(named:  imageName)
        cell.menuItemLabel.text = NSLocalizedString(textItem, comment: "")

        return cell
        
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                    self.dismiss(animated: true)
        guard let function = menuItems?.menuItems?[indexPath.section].items?[indexPath.row].controller else {
            return
        }
    let fonctionName =  ""+String(describing: function)
        if (self.coordinator?.responds(to: Selector(fonctionName)))! {
            self.coordinator?.perform(Selector(fonctionName))
        }
  

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectionCell") as! headerCell
        cell.sectionName?.text = NSLocalizedString(menuItems?.menuItems?[section].sectionName ?? "", comment: "")
        
        return cell
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }



    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


