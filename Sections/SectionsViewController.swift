//
//  SectionsViewController.swift
//  DataBase
//
//  Created by alaa on 8/5/18.
//  Copyright © 2018 alaa. All rights reserved.
//

import UIKit
struct MyVariables {
    static var IDSUB = ""
}

class SectionsViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tableview: UITableView!
   
    @IBOutlet weak var viewCon: UIView!
    
    @IBOutlet weak var txtConection: UILabel!
    
    ////////////var///////////
    final let url = URL(string: "http://alhazazi.net/sections.php?Allsection=section")
    
    private var AItems = [Sections]()
    
    ////////////////////////
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DownloadJson2()
    }

    func DownloadJson2()  {
        
        guard let downloadURL = url else { return }
        
        URLSession.shared.dataTask(with: downloadURL) { (data, URLResponse, error) in
            
            guard let data = data , error == nil , URLResponse != nil
                else {
                   // print("Something is Error")
                    DispatchQueue.main.async { // Correct
                        self.txtConection.text = "NO Connect Internet"
                        self.tableview.isHidden = true
                        
                        self.viewCon.isHidden = false
                        
                        self.txtConection.isHidden = false
                    }
                    
                    
                    return
            }
            print("downloded")
            
            do {
                let decoder = JSONDecoder()
                let downloadAtors = try decoder.decode(Sectionsx.self, from: data)
                /////Array to DataBase name to json
                self.AItems = downloadAtors.Items
                DispatchQueue.main.async {
                    self.viewCon.isHidden = true
                    
                    self.txtConection.isHidden = true
                    
                    self.tableview.reloadData()
                    //self.SlidColl.reloadData()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Sections") as? SectionsTableViewCell
        
        cell?.txtTitle.text = AItems[indexPath.row].name
        
        cell?.txttotal.text = "ads \(AItems[indexPath.row].total)"
        
        /////Images
        if
            let ImgURL = URL(string: AItems[indexPath.row].img){
            
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: ImgURL)
                if let data = data{
                    let Image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell?.imgSection.image = Image
                    }
                }
            }
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ///////sent to var to sub Section  SHOW All Items to Section
        let stor = storyboard?.instantiateViewController(withIdentifier: "subSectionItem") as? subSectionViewController
        
        self.navigationController?.pushViewController(stor!, animated: true)
        stor?.id = AItems[indexPath.row].id
        stor?.name = AItems[indexPath.row].name
        
    }

}
