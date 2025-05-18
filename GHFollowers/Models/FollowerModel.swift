//
//  FollowerModel.swift
//  GHFollowers
//
//  Created by Huang Yi An on 15/5/25.
//

import Foundation


struct FollowerModel: Codable, Hashable {
    var login: String?
    var id: Int?
    var nodeId: String?
    var avatarUrl: String?
    var gravatarId: String?
    var url, htmlUrl, followersUrl: String?
    var followingUrl, gistsUrl, starredUrl: String?
    var subscriptionsUrl, organizationsUrl, reposUrl: String?
    var eventsUrl: String?
    var receivedEventsUrl: String?
    var type: String?
    var siteAdmin: Bool?
}
