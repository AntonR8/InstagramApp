
import SwiftUI


struct ProfileResponse: Codable {
    let error: Bool
    let messages: [String]
    let data: ProfileData
}

struct ProfileData: Codable {
    let profile: ProfileModel
}

struct ProfileModel: Codable {
    let userId, name, username: String
    let avatar: String
    let description: String
    let bioLinks: [BioLink]
    let totalPublications, totalSubscribers, totalSubscriptions: Int
    let requestedUrl: String
}

struct BioLink: Codable, Hashable {
    let type, title: String
    let url: String
}


let mockProfileResponse = ProfileResponse(
    error: false,
    messages: [],
    data: ProfileData(
        profile: ProfileModel(
            userId: "196703118",
            name: "Сергей",
            username: "rusbear28",
            avatar: "https://scontent-mad1-1.cdninstagram.com/v/t51.2885-19/308853405_3242603756052123_9037857428105701301_n.jpg?stp=dst-jpg_e0_s150x150&_nc_ht=scontent-mad1-1.cdninstagram.com&_nc_cat=103&_nc_ohc=RFP9-rgF6lgQ7kNvgF0ETYu&_nc_gid=5354d7ee09604cea97cf0be12ed16fa3&edm=AO4kU9EBAAAA&ccb=7-5&oh=00_AYDEPiaDHQIcW_52C2k4B9vYb1PHlc_O156ZlJsREOCA2Q&oe=674A2B8E&_nc_sid=164c1d",
            description: "💻 Lead backend developer",
            bioLinks: [
                BioLink(
                    type: "external",
                    title: "",
                    url: "https://bearcode.ru/"
                )
            ],
            totalPublications: 49,
            totalSubscribers: 128,
            totalSubscriptions: 157,
            requestedUrl: "https://www.instagram.com/thehuskyfam?igsh=MWJwZGZjeHQ5NmMzOQ=="
)))
