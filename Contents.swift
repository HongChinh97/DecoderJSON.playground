//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"
//Decoder JSON
class Feature: Codable {
    var description: String
    
}
class GroceryProduct: Codable {
    var name: String
    var points: Int
    var feature: Feature
    init(name: String, points: Int, feature: Feature) {
        self.name = name
        self.points = points
        self.feature = feature
    }
    enum CodingKeys: String, CodingKey {
        case name, points , feature = "featureInfor"
    }
}
let json = """
{
"name": "Durian",
"points": 600,
"featureInfor": {
    "description": "A fruit with distinstive"
    }
}
""".data(using: .utf8)!
let decoder = JSONDecoder()
let product = try decoder.decode(GroceryProduct.self, from: json)
print(product.name)
print(product.points)
print(product.feature.description)


//class Job: Codable {
//    var title :  String
//    var salary :  Float
//
//    init(title: String, salary: Float) {
//        self.title = title
//        self.salary = salary
//    }
//
//    enum CodingKeys: String, CodingKey {
//        case title, salary
//    }
//}
//
//class Person: Codable {
//    var job : Job
//    var firstName: String
//    var lastName :  String
//    var age :  Int
//
//    init(job: Job, firstName: String, lastName: String, age: Int) {
//        self.job = job
//        self.firstName = firstName
//        self.lastName = lastName
//        self.age = age
//    }
//
//    enum CodingKeys: String, CodingKey {
//        case job = "job_information", firstName = "firstname", lastName = "lastname", age
//    }
//}
//
//let rawData = """
//{
//    "job_information": {
//        "title": "iOS Developer",
//        "salary": 5000
//    },
//    "firstname": "John",
//    "lastname": "Doe",
//    "age": 20
//}
//""".data(using: .utf8)!
//
//
//let person = try JSONDecoder().decode(Person.self, from: rawData)
//print(person.firstName) // John
//print(person.lastName) // Doe
//print(person.job.title) // iOS Developer
