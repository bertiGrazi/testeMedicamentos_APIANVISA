//
//  ViewController.swift
//  TesteAPI_DrugData
//
//  Created by Grazi Berti on 05/01/21.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var tableViewList: UITableView!
    
    var arrayRemedios = [Remedio] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewList.delegate = self
        tableViewList.dataSource = self
        
        loadBrandData()
    }
    func loadBrandAPI(completion: @escaping (_ result: Bool, _ error: Error?) -> Void) {
               AF.request("https://raw.githubusercontent.com/paolapagotto/csvtojson/master/medicamentos.json").responseJSON { response in
                   if let arrayDictionary = response.value as? [[String: String]] {
                       
                       for item in arrayDictionary {
                           let brand = Remedio(json: JSON(item))
                           self.arrayRemedios.append(brand)
                       }
                       completion(true, nil)
                   } else {
                       completion(false, response.error)
                   }
                   
               }
               
           }
    
    func loadBrandData() {
           loadBrandAPI(completion: {  (sucess, error) in
               if sucess {
                   DispatchQueue.main.async {
                       self.tableViewList.reloadData()
                   }
               }
           })
       }
}

extension ViewController: UITableViewDelegate {
    
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayRemedios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RemedioTableViewCell", for: indexPath) as! RemedioTableViewCell
        cell.setup(produto: arrayRemedios[indexPath.row])
        return cell
    }
    
    
}
