struct Year {
    let year: Int
    var isLeapYear: Bool {
        get {
            if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0 {
                return true
            }
            return false
        }
    }
    
    init(calendarYear: Int) {
        year = calendarYear
    }
}
