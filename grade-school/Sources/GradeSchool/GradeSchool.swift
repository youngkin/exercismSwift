import Foundation

class GradeSchool {
    var roster = [Int:[String]]()
    
    var sortedRoster: [Int:[String]] {
        get {
            var rosterSorted = [Int:[String]](uniqueKeysWithValues: roster.sorted { $0.key < $1.key})
            for studentsInGrade in rosterSorted {
                var students = studentsInGrade.value
                students.sort()
                rosterSorted[studentsInGrade.key] = students
            }
            return rosterSorted
        }
    }
    
    func addStudent(_ name: String, grade: Int) {
        var students: [String]? = roster[grade]
        students?.append(name) ?? (students = [name])
        roster[grade] = students
    }
    
    func studentsInGrade(_ grade: Int) -> [String] {
        return roster[grade] ?? [String]()
    }
    
}

// A better solution?
//class GradeSchool: NSObject {
//
//    var roster: [Int: [String]] = [:]
//
//    // How did this work, the dictionary isn't sorted, just the value array
//    var sortedRoster: [Int: [String]] {
//        var result: [Int: [String]] = [:]
//        roster.forEach {
//            (grade, names) in
//            result[grade] = names.sorted()
//        }
//        return result
//    }
//
//    func addStudent(_ student: String, grade: Int) {
//        roster[grade] = (roster[grade] ?? []) + [student]
//    }
//    func studentsInGrade(_ grade:Int) -> [String] {
//        return roster[grade] ?? []
//    }
//
//
//}
