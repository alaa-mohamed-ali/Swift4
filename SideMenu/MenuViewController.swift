//
//  MenuViewController.swift
//  DataBase
//
//  Created by alaa on 8/3/18.
//  Copyright © 2018 alaa. All rights reserved.
//

import UIKit

protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(_ index : Int32)
}

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    /**
     *  Array to display menu options
     */
    //@IBOutlet var tblMenuOptions : UITableView!
    
    @IBOutlet weak var tblMenuOptions: UITableView!
    /**
     *  Transparent button to hide menu
     */
    
    @IBOutlet weak var btnCloseMenuOverlay: UIButton!
    /**
     *  Array containing menu options
     */
    var arrayMenuOptions = [Dictionary<String,String>]()
    
    /**
     *  Menu button which was tapped to display the menu
     */
    var btnMenu : UIButton!
    
    /**
     *  Delegate of the MenuVC
     */
    var delegate : SlideMenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tblMenuOptions.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnCloseMenuOverlay(_ button: UIButton) {
        btnMenu.tag = 0
        
        if (self.delegate != nil) {
            var index = Int32(button.tag)
            if(button == self.btnCloseMenuOverlay){
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParentViewController()
        })
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateArrayMenuOptions()
    }
    
    func updateArrayMenuOptions(){
        arrayMenuOptions.append(["title":"Sections", "icon":"HOME"])
        arrayMenuOptions.append(["title":"Favorite", "icon":"f1"])
        arrayMenuOptions.append(["title":"Chat", "icon":"Setting"])
        arrayMenuOptions.append(["title":"Contect US", "icon":"Setting"])
        arrayMenuOptions.append(["title":"Setting", "icon":"Setting"])
        
       // tblMenuOptions.reloadData()
    }
    
    @IBAction func onCloseMenuClick(_ button:UIButton!){
        btnMenu.tag = 0
        
        if (self.delegate != nil) {
            var index = Int32(button.tag)
            if(button == self.btnCloseMenuOverlay){
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParentViewController()
        })
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellMenu") as! MenuTableViewCell
        
        
        let imgIcon:UIImageView = cell.imageView as! UIImageView
         imgIcon.image = UIImage(named: arrayMenuOptions[indexPath.row]["icon"]!)
        
        let txt:UILabel = cell.textLabel as! UILabel
        txt.text = arrayMenuOptions[indexPath.row]["title"]!
        txt.textColor = UIColor(white: 1, alpha: 1)
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.layoutMargins = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
        cell.backgroundColor = UIColor.clear
        
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if(indexPath.row == 0){
            let HOME:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let DVCx = HOME.instantiateViewController(withIdentifier: "main") as! SectionsViewController
            
            self.navigationController?.pushViewController(DVCx, animated: true)
        }else if(indexPath.row == 1){
            let FAV:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let DVC = FAV.instantiateViewController(withIdentifier: "favorite") as! FavoriteViewController
            
            self.navigationController?.pushViewController(DVC, animated: true)
        }else if(indexPath.row == 2){
            let HOME:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let DVCx = HOME.instantiateViewController(withIdentifier: "main") as! SectionsViewController
            
            self.navigationController?.pushViewController(DVCx, animated: true)
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMenuOptions.count
    }
}
