//
//  subSectionViewController.swift
//  DataBase
//
//  Created by alaa on 8/6/18.
//  Copyright © 2018 alaa. All rights reserved.
//

import UIKit


class subSectionViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var txtTitelSubSection: UILabel!
    
    @IBOutlet weak var Rview: UIView!
    
    @IBOutlet weak var txtResult: UILabel!
    ///////////VAR/////////////
    private var AItems = [SubSections]()
    
    var id:String = ""
    
    var name:String = ""
   //////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtTitelSubSection.text = name
        
        DownloadJson()
    }

    func DownloadJson()  {
        
        let url = URL(string: "http://alhazazi.net/sections.php?sub=subsection&SectionID=\(id)")
        
        guard let downloadURL = url else { return }
        
        URLSession.shared.dataTask(with: downloadURL) { (data, URLResponse, error) in
            
            guard let data = data , error == nil , URLResponse != nil
                else {
                    print("Something is Error")
                    return
            }
            print("downloded")
            
            do {
                let decoder = JSONDecoder()
                let downloadAtors = try decoder.decode(SubSectionsx.self, from: data)
                self.AItems = downloadAtors.Items
                DispatchQueue.main.async {
                    //self.tableview.reloadData()
                    if(self.AItems.count == 0){
                        self.Rview.isHidden = false
                        self.tableview.isHidden = true
                        print("No Items OF Sub Section 11")
                        self.txtResult.text = "No Items OF Sub Section"
                    }else{
                         self.Rview.isHidden = true
                        self.tableview.isHidden = false
                        self.tableview.reloadData()
                    }
                }
            } catch {
                print("Error")
            }
            
            }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "subSections") as? SubSectionsTableViewCell
        
        cell?.txtNameSubSection.text = AItems[indexPath.row].name
        
        cell?.txttotalSubSection.text = "ads \(AItems[indexPath.row].total)"
        
       
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        ///////SHOW CONTENT All Items to Sub Section
        let ItemS = storyboard?.instantiateViewController(withIdentifier: "ItemSubSectionItem") as? ViewController
        
    self.navigationController?.pushViewController(ItemS!, animated: true)
        ItemS?.id = AItems[indexPath.row].id
        ItemS?.name = AItems[indexPath.row].name
        
    }
    
    

}
