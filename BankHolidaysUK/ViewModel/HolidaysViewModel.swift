//
//  HolidaysViewModel.swift
//  BankHolidaysUK
//
//  Created by Silas Hayri on 27.05.2023.
//

import Foundation

struct HolidaysTableViewModel {
    
    let holidaysList: [Holidays]
    
    func numberOfRowsInSection() ->Int{
        return self.holidaysList.count
    }
    
    func holidaysAtIndexPath(_ index: Int) -> HolidaysViewModel{
        let holidays = self.holidaysList[index]
        return HolidaysViewModel(holidays: holidays)
        
    }
    
}

struct HolidaysViewModel{
    
    let holidays : Holidays
    var title : String{
        return self.holidays.title
    }
    var date : String{
        return self.holidays.date
    }
    
}
