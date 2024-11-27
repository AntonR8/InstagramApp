
import SwiftUI

struct ReelsResponse: Codable {
    let error: Bool
    let messages: [String]
    let data: ReelsData
}

struct ReelsData: Codable {
    let reels: ReelsModel
}

struct ReelsModel: Codable, Hashable {
    let author: String
    let authorProfile: String
    let description: String
    let authorAvatar: String
    let audioPageURL: String?
    let audioID: String?
    let audioDownloadURL: String?
    let audioAuthor, audioTitle: String?
    let videoDownloadURL: String
    let imagePreview: String
    let requestedUrl: String
}

var mockReelsResponse = ReelsResponse(
    error: false,
    messages: [],
    data: ReelsData(
        reels: ReelsModel(
            author: "subhan.io",
            authorProfile: "https://www.instagram.com/subhan.io",
            description: "Been using the @jsaux_official FlipGo Pro for the past month and I’m impressed. The 2.2K resolution is very good for its size and it only needs one cable to connect to your laptop. The foldable stand could be a bit sturdier but the fact that you can use it wherever you go makes up for it. If you need a monitor you can take with you, this is the one. #setup #desktour #aesthetic #compsci #study #jsaux",
            authorAvatar: "https://scontent-waw2-2.cdninstagram.com/v/t51.2885-19/459170186_2570423006678490_8126795192099664647_n.jpg?stp=dst-jpg_e0_s150x150&_nc_ht=scontent-waw2-2.cdninstagram.com&_nc_cat=106&_nc_ohc=QgjyVjCVfW4Q7kNvgFNLX7g&_nc_gid=6a3eb814aa0745e6984559a469138d21&edm=ALQROFkBAAAA&ccb=7-5&oh=00_AYCd-XMXlsIhMd7oEdWx21WA2TbSPippP4tV9lSmmUM0JQ&oe=674A1161&_nc_sid=fc8dfb",
            audioPageURL: "https://www.instagram.com/reels/audio/1088964299324648",
            audioID: "18452972443035714",
            audioDownloadURL: "https://scontent-waw2-2.xx.fbcdn.net/o1/v/t2/f2/m69/AQPARskYBNx6t3DILXJibRxTZMFjwKRXCzpzmOdtizNIqzTB1xqemN0oQnaryO03Wjm67PuP8c7kOM-pwkOozn-b.mp4?strext=1&_nc_cat=106&_nc_sid=8bf8fe&_nc_ht=scontent-waw2-2.xx.fbcdn.net&_nc_ohc=CvZYYmX4_f4Q7kNvgGeCVpK&efg=eyJ2ZW5jb2RlX3RhZyI6Inhwdl9wcm9ncmVzc2l2ZS5BVURJT19PTkxZLi5DMy4wLnByb2dyZXNzaXZlX2F1ZGlvX2FhY3BfNDhfZnJhZ18yX2F1ZGlvIiwieHB2X2Fzc2V0X2lkIjo4NjEwMzAzNjI4MTI3NDIsInVybGdlbl9zb3VyY2UiOiJ3d3cifQ%3D%3D&ccb=9-4&_nc_zt=28&oh=00_AYBL1i_ZIpe_nZK9PF8c8NJSMaBvOZ7CKiGvEVcDAu57hQ&oe=674A140D",
            audioAuthor: "Drake",
            audioTitle: "Circadian Rhythm",
            videoDownloadURL: "https://scontent-waw2-2.cdninstagram.com/o1/v/t16/f1/m86/0B46D07F0C046A7FBAC3DCC4A375FD8B_video_dashinit.mp4?efg=eyJ4cHZfYXNzZXRfaWQiOjEyMjYwMzUxOTg0MjQ2ODQsInZlbmNvZGVfdGFnIjoieHB2X3Byb2dyZXNzaXZlLklOU1RBR1JBTS5DTElQUy5DMy43MjAuZGFzaF9iYXNlbGluZV8xX3YxIn0&_nc_ht=scontent-waw2-2.cdninstagram.com&_nc_cat=102&vs=9a838332cb6f771e&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC8wQjQ2RDA3RjBDMDQ2QTdGQkFDM0RDQzRBMzc1RkQ4Ql92aWRlb19kYXNoaW5pdC5tcDQVAALIAQAVAhg6cGFzc3Rocm91Z2hfZXZlcnN0b3JlL0dCcENYUnVNQjFjVGhXNEZBRnk3ZlJPaXQ2UkticV9FQUFBRhUCAsgBACgAGAAbAogHdXNlX29pbAExEnByb2dyZXNzaXZlX3JlY2lwZQExFQAAJtjZ34fSxK0EFQIoAkMzLBdANsKPXCj1wxgSZGFzaF9iYXNlbGluZV8xX3YxEQB1_gcA&ccb=9-4&oh=00_AYBjLx7hwMLzgVazPn8n4UfqDg8FysCnPtOF1P0u-M-FxA&oe=67461CC0&_nc_sid=1d576d",
            imagePreview: "https://scontent-fra3-1.cdninstagram.com/v/t51.29350-15/412762902_1024960658616471_8606375437983844876_n.jpg?stp=dst-jpg_e15_p480x480&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi43MjB4MTI4MC5zZHIuZjI5MzUwLmRlZmF1bHRfY292ZXJfZnJhbWUifQ&_nc_ht=scontent-fra3-1.cdninstagram.com&_nc_cat=103&_nc_ohc=DZfk8WKotG8Q7kNvgGw_K9f&_nc_gid=044c01f457a8440d989151b014858c78&edm=ALQROFkBAAAA&ccb=7-5&ig_cache_key=MzI2Njc3MTMxODQ1MDY2NTM4NA%3D%3D.3-ccb7-5&oh=00_AYBCWP5O87WMqTU0b1RT_nPUz4887SJDv_HO_QaCJbLhAQ&oe=674B30B5&_nc_sid=fc8dfb",
            requestedUrl: "https://www.instagram.com/reel/C1V5zS-r7eo/?igsh=OXZhdnR1azZybTdl"

            )))

