import SwiftUI

struct StoriesResponse: Codable {
    let error: Bool
    let messages: [String]
    let data: StoriesData
}

struct StoriesData: Codable {
    let stories: StoriesModel
}


struct StoriesModel: Codable {
    let author: String
    let authorProfile: String
    let authorAvatar: String
    let duration: Double
    let videoDownloadURL: String?
    let imageDownloadURL: String
    let publishedAt, sinceStr: String
    let imagePreview: String
    let requestedUrl: String
}


let mockStoriesResponse = StoriesResponse(
        error: false,
        messages: [],
        data: StoriesData(
            stories: StoriesModel(
                author: "coding.lol",
                authorProfile: "https://www.instagram.com/coding.lol",
                authorAvatar: "https://scontent-fra3-1.cdninstagram.com/v/t51.2885-19/427545793_1126865438557040_4071981930808933769_n.jpg?stp=dst-jpg_e0_s150x150&_nc_ht=scontent-fra3-1.cdninstagram.com&_nc_cat=108&_nc_ohc=JStDAaWOZ2cQ7kNvgE8srxB&_nc_gid=40b258a4482f4d57b6d7736924a3f90f&edm=ALQROFkBAAAA&ccb=7-5&oh=00_AYC31_wln8oXjvhoKpD9_99fjx4--n0t5SGJiFJinciGOw&oe=674A26F9&_nc_sid=fc8dfb",
                duration: 11.958,
                videoDownloadURL: "https://scontent-fra3-1.cdninstagram.com/o1/v/t16/f1/m82/A24059409DF0986DCED009C4F986DFA1_video_dashinit.mp4?efg=eyJ4cHZfYXNzZXRfaWQiOjI0OTU1NzQ0OTA4MzA2OTQsInZlbmNvZGVfdGFnIjoieHB2X3Byb2dyZXNzaXZlLklOU1RBR1JBTS5DTElQUy5DMy43MjAuZGFzaF9iYXNlbGluZV8xX3YxIn0&_nc_ht=scontent-fra3-1.cdninstagram.com&_nc_cat=106&vs=b2008708184f3476&_nc_vs=HBksFQIYT2lnX3hwdl9yZWVsc19wZXJtYW5lbnRfcHJvZC9BMjQwNTk0MDlERjA5ODZEQ0VEMDA5QzRGOTg2REZBMV92aWRlb19kYXNoaW5pdC5tcDQVAALIAQAVAhg6cGFzc3Rocm91Z2hfZXZlcnN0b3JlL0dCM1VWeHBJaUlhaHFxQUNBTHcxMDkxRW1JMUlicV9FQUFBRhUCAsgBACgAGAAbAogHdXNlX29pbAExEnByb2dyZXNzaXZlX3JlY2lwZQExFQAAJszdyvDG7e4IFQIoAkMzLBdAJ-6XjU_fOxgSZGFzaF9iYXNlbGluZV8xX3YxEQB1_gcA&ccb=9-4&oh=00_AYB_uC-WxlTZ7X1P3APfFXWog94Mgl6F5OP9xrCIAkSKpA&oe=67461784&_nc_sid=1d576d",
                imageDownloadURL: "https://scontent-fra3-1.cdninstagram.com/v/t51.29350-15/436567705_997734132029773_9138059946690327759_n.jpg?stp=dst-jpg_e15_tt6&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4zODl4NjkyLnNkci5mMjkzNTAuZGVmYXVsdF9jb3Zlcl9mcmFtZSJ9&_nc_ht=scontent-fra3-1.cdninstagram.com&_nc_cat=101&_nc_ohc=GecPboVJZ-YQ7kNvgFKJiTV&_nc_gid=40b258a4482f4d57b6d7736924a3f90f&edm=ALQROFkBAAAA&ccb=7-5&ig_cache_key=MzM2NzY0MjUyNjQyNjg4ODEwMg%3D%3D.3-ccb7-5&oh=00_AYBRrAOMx9Kvktv8OnGF8Ye5Zmd7V1Lz2A1zmbGXAMpvbQ&oe=674A11A2&_nc_sid=fc8dfb",
                publishedAt: "14.05.2024 08:11:48",
                sinceStr: "6 months before",
                imagePreview: "https://scontent-waw2-2.cdninstagram.com/v/t51.29350-15/436567705_997734132029773_9138059946690327759_n.jpg?stp=dst-jpg_e15_tt6&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4zODl4NjkyLnNkci5mMjkzNTAuZGVmYXVsdF9jb3Zlcl9mcmFtZSJ9&_nc_ht=scontent-waw2-2.cdninstagram.com&_nc_cat=101&_nc_ohc=GecPboVJZ-YQ7kNvgEXpz02&_nc_gid=26645e4b9191479fbfc682d332f320b4&edm=ALQROFkBAAAA&ccb=7-5&ig_cache_key=MzM2NzY0MjUyNjQyNjg4ODEwMg%3D%3D.3-ccb7-5&oh=00_AYDSlopTxKUY_-wiXo7Bj3TVIKRwayLL8mjEjIRmiGLPRw&oe=674B6322&_nc_sid=fc8dfb",
                requestedUrl: "https://www.instagram.com/reel/C68RQkGLHem/?igsh=MWwxYm5rMGdzbmZtbQ=="
)))
