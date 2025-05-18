//
//  ErrorMessage.swift
//  GHFollowers
//
//  Created by Huang Yi An on 15/5/25.
//

import Foundation

enum GFError : String, Error {
    case invalidUsername    = "The username is invalid. Please try again !"
    case unableToComplete   = "Unable to complete your request. Please try again and check your internet."
    case invalidResponse    = "Invalid reponse from server. Please try again"
    case dataError          = "The data recived from the server was error. Please try again"
}
