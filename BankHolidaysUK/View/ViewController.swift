//
//  ViewController.swift
//  BankHolidaysUK
//
//  Created by Silas Hayri on 26.05.2023.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
   
    
    @IBOutlet weak var tableView: UITableView!
    
    private var holidaysTableViewModel : HolidaysTableViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        veriAl()
        
            
    }
    
    func veriAl(){
        
        let url = URL(string: "https://www.gov.uk/bank-holidays.json")
        WebService().fetchData(url: url!) { (holidays) in
            if let holidays = holidays{
                print("haberler: ")
               self.holidaysTableViewModel = HolidaysTableViewModel(holidaysList: holidays)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return holidaysTableViewModel == nil ? 0 : self.holidaysTableViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        as! HolidaysCell
        
        let holidaysViewModel = self.holidaysTableViewModel.holidaysAtIndexPath(indexPath.row)
        cell.titleLabel.text = holidaysViewModel.title
        cell.dateLabel.text = holidaysViewModel.date
        return cell
    }

   
    
}

