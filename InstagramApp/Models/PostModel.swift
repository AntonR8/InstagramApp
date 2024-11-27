
import SwiftUI

struct PostResponse: Codable {
    let error: Bool
    let messages: [String]
    let data: PostData
}

struct PostData: Codable {
    let post: PostModel
}

struct PostModel: Codable {
    let description, author: String
    let authorProfile: String
    let authorAvatar: String
    let carousel: [Carousel]
    let imageDownloadUrl: String?
    let videoDownloadUrl: String?
    let requestedUrl: String
}

struct Carousel: Codable, Hashable {
    let videoDownloadUrl: String?
    let imageDownloadUrl: String?
}





let mockPostResponse = PostResponse(
    error: false,
    messages: [],
    data: PostData(
        post: PostModel(
            description: "Hi guys I’m back, you can stop unfollowing me now 🤗\n\nBeen busy at work with a promotion and working on my resume to portfolio app (which is almost done so sign up for the waitlist in my bio if you haven’t already)\n\nSome more reels coming soon 🤞\n\n#coding #compsci #photodump #roomtour #lego #studygram",
            author: "subhan.io",
            authorProfile: "https://www.instagram.com/subhan.io",
            authorAvatar: "https://scontent-fra5-2.cdninstagram.com/v/t51.2885-19/459170186_2570423006678490_8126795192099664647_n.jpg?stp=dst-jpg_e0_s150x150&_nc_ht=scontent-fra5-2.cdninstagram.com&_nc_cat=106&_nc_ohc=QgjyVjCVfW4Q7kNvgEPMhSB&_nc_gid=9367c99402914159bd16d4c0516a0264&edm=ALQROFkBAAAA&ccb=7-5&oh=00_AYBmwhaK0sRkMJvuTUrs8cBy4WeCzrfR6v_rKF5nqJ8GVA&oe=674A1161&_nc_sid=fc8dfb",
            carousel: [
                Carousel(
                    videoDownloadUrl: nil,
                    imageDownloadUrl: "https://scontent-fra5-1.cdninstagram.com/v/t51.29350-15/464751680_1631824767364740_8888801934309395809_n.jpg?se=7&stp=dst-jpegr_e35_tt6&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xNDQweDE4MDAuaGRyLmYyOTM1MC5kZWZhdWx0X2ltYWdlIn0&_nc_ht=scontent-fra5-1.cdninstagram.com&_nc_cat=100&_nc_ohc=FXLs__EAHZoQ7kNvgEVeY_q&_nc_gid=9367c99402914159bd16d4c0516a0264&edm=ALQROFkBAAAA&ccb=7-5&ig_cache_key=MzQ4ODk4NTEzOTkxOTM1ODE0MA%3D%3D.3-ccb7-5&oh=00_AYDU_Xhh2_l8UNEMWCpkgrzlAtFrq5VoaCXNUbErNZkhkg&oe=674A0C70&_nc_sid=fc8dfb"
                ),
                Carousel(
                    videoDownloadUrl: nil,
                    imageDownloadUrl: "https://scontent-fra5-2.cdninstagram.com/v/t51.29350-15/465012330_1019635943270874_8254227826580457355_n.jpg?se=7&stp=dst-jpegr_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xNDQweDE4MDAuaGRyLmYyOTM1MC5kZWZhdWx0X2ltYWdlIn0&_nc_ht=scontent-fra5-2.cdninstagram.com&_nc_cat=106&_nc_ohc=ZCu-c2ObJ_MQ7kNvgEr7GuP&_nc_gid=9367c99402914159bd16d4c0516a0264&edm=ALQROFkBAAAA&ccb=7-5&ig_cache_key=MzQ4ODk4NTE0MDM4MDYwNTA4OA%3D%3D.3-ccb7-5&oh=00_AYB379Pf0xD-CUlUX37XYDbpKdsDXXNT5s1mG_Ik4DzluQ&oe=674A20E5&_nc_sid=fc8dfb"
                ),
                Carousel(
                    videoDownloadUrl: nil,
                    imageDownloadUrl: "https://scontent-fra3-1.cdninstagram.com/v/t51.29350-15/464872942_1270324474412653_302351426463220481_n.jpg?se=7&stp=dst-jpegr_e35_tt6&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xNDQweDE4MDAuaGRyLmYyOTM1MC5kZWZhdWx0X2ltYWdlIn0&_nc_ht=scontent-fra3-1.cdninstagram.com&_nc_cat=101&_nc_ohc=gaPzfeNohIkQ7kNvgGLsSRo&_nc_gid=9367c99402914159bd16d4c0516a0264&edm=ALQROFkBAAAA&ccb=7-5&ig_cache_key=MzQ4ODk4NTEzOTg3NzMyODIzMQ%3D%3D.3-ccb7-5&oh=00_AYCFhMqYQWkDYEu98QsY9EcO4Kiggyo7oUc1Da2rsUcJDQ&oe=674A16F6&_nc_sid=fc8dfb"
                ),
                Carousel(
                    videoDownloadUrl: nil,
                    imageDownloadUrl: "https://scontent-fra5-1.cdninstagram.com/v/t51.29350-15/464575572_1315215776131056_5022747092567647979_n.jpg?se=7&stp=dst-jpegr_e35_tt6&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xNDQweDE4MDAuaGRyLmYyOTM1MC5kZWZhdWx0X2ltYWdlIn0&_nc_ht=scontent-fra5-1.cdninstagram.com&_nc_cat=100&_nc_ohc=xAqNcOUBxIoQ7kNvgFWhW4g&_nc_gid=9367c99402914159bd16d4c0516a0264&edm=ALQROFkBAAAA&ccb=7-5&ig_cache_key=MzQ4ODk4NTEzOTgzNTUwODU1OA%3D%3D.3-ccb7-5&oh=00_AYA8zPqG7gJXm7ZMoWZVFmo84fiA6b9hNyWMdmFfMBjt9w&oe=674A28F8&_nc_sid=fc8dfb"
                ),
                Carousel(
                    videoDownloadUrl: nil,
                    imageDownloadUrl: "https://scontent-fra5-2.cdninstagram.com/v/t51.29350-15/464982243_1578670619689389_5594018595395571909_n.jpg?se=7&stp=dst-jpegr_e35_tt6&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xNDQweDE4MDAuaGRyLmYyOTM1MC5kZWZhdWx0X2ltYWdlIn0&_nc_ht=scontent-fra5-2.cdninstagram.com&_nc_cat=109&_nc_ohc=NWFVSUV65vkQ7kNvgFEdsWu&_nc_gid=9367c99402914159bd16d4c0516a0264&edm=ALQROFkBAAAA&ccb=7-5&ig_cache_key=MzQ4ODk4NTEzOTkyNzcxMzQ2OQ%3D%3D.3-ccb7-5&oh=00_AYB-nzeXUAxvij6HubJ3ESHdHnMydzcH_X4rZltr4JC6Jw&oe=674A2598&_nc_sid=fc8dfb"
                ),
                Carousel(
                    videoDownloadUrl: nil,
                    imageDownloadUrl: "https://scontent-fra5-2.cdninstagram.com/v/t51.29350-15/465001686_569099775600237_4437701196219247761_n.jpg?se=7&stp=dst-jpegr_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xNDQweDE4MDAuaGRyLmYyOTM1MC5kZWZhdWx0X2ltYWdlIn0&_nc_ht=scontent-fra5-2.cdninstagram.com&_nc_cat=109&_nc_ohc=hY7dMSy8uIkQ7kNvgHqE4FY&_nc_gid=9367c99402914159bd16d4c0516a0264&edm=ALQROFkBAAAA&ccb=7-5&ig_cache_key=MzQ4ODk4NTEzOTkyNzc1NjEyNQ%3D%3D.3-ccb7-5&oh=00_AYADG99Jt2ejTfuAZFalt_ZB2ILyz2ob3wXdFsyC6xqnKQ&oe=674A0B26&_nc_sid=fc8dfb"
                ),
                Carousel(
                    videoDownloadUrl: nil,
                    imageDownloadUrl: "https://scontent-fra3-1.cdninstagram.com/v/t51.29350-15/464762772_981864167033101_8987426068303372945_n.jpg?se=7&stp=dst-jpegr_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xNDQweDE4MDAuaGRyLmYyOTM1MC5kZWZhdWx0X2ltYWdlIn0&_nc_ht=scontent-fra3-1.cdninstagram.com&_nc_cat=101&_nc_ohc=iS1ZUCG6ttAQ7kNvgHVIxeV&_nc_gid=9367c99402914159bd16d4c0516a0264&edm=ALQROFkBAAAA&ccb=7-5&ig_cache_key=MzQ4ODk4NTE0MDM4MDcyNDI2Nw%3D%3D.3-ccb7-5&oh=00_AYD2Caf-bhDJaYlA951aq45j1qZK4QnXKAIdIqGGnLBxxw&oe=674A24DD&_nc_sid=fc8dfb"
                ),
                Carousel(
                    videoDownloadUrl: nil,
                    imageDownloadUrl: "https://scontent-fra5-1.cdninstagram.com/v/t51.29350-15/464652204_517082121156468_6776384948737786358_n.jpg?se=7&stp=dst-jpegr_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xNDQweDE4MDAuaGRyLmYyOTM1MC5kZWZhdWx0X2ltYWdlIn0&_nc_ht=scontent-fra5-1.cdninstagram.com&_nc_cat=100&_nc_ohc=x0GpLqH3Y48Q7kNvgGFq9No&_nc_gid=9367c99402914159bd16d4c0516a0264&edm=ALQROFkBAAAA&ccb=7-5&ig_cache_key=MzQ4ODk4NTEzOTgyNzAzMjQ0MQ%3D%3D.3-ccb7-5&oh=00_AYBFwd2OIdEAuSYnb2Cic8UrCCvc3Fdq2vpFJjNp28TbTQ&oe=674A0B36&_nc_sid=fc8dfb"
                ),
                Carousel(
                    videoDownloadUrl: nil,
                    imageDownloadUrl: "https://scontent-fra5-2.cdninstagram.com/v/t51.29350-15/464822725_1258866861975606_7283858833141463838_n.jpg?se=7&stp=dst-jpegr_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xNDQweDE4MDAuaGRyLmYyOTM1MC5kZWZhdWx0X2ltYWdlIn0&_nc_ht=scontent-fra5-2.cdninstagram.com&_nc_cat=106&_nc_ohc=RtE2DeH4jw8Q7kNvgEG6PKP&_nc_gid=9367c99402914159bd16d4c0516a0264&edm=ALQROFkBAAAA&ccb=7-5&ig_cache_key=MzQ4ODk4NTE0MDM4MDc5MTYzOQ%3D%3D.3-ccb7-5&oh=00_AYCeFuDvwMyGxtLmZZaG1mh9p5vCmXa0M2VV6NShUFDM7A&oe=674A28CC&_nc_sid=fc8dfb"
               )
            ],
            imageDownloadUrl: "https://scontent-fra5-1.cdninstagram.com/v/t51.29350-15/464751680_1631824767364740_8888801934309395809_n.jpg?se=7&stp=dst-jpg_e35_tt6&_nc_ht=scontent-fra5-1.cdninstagram.com&_nc_cat=100&_nc_ohc=FXLs__EAHZoQ7kNvgEVeY_q&_nc_gid=9367c99402914159bd16d4c0516a0264&edm=ALQROFkBAAAA&ccb=7-5&ig_cache_key=MzQ4ODk4NTEzOTkxOTM1ODE0MA%3D%3D.3-ccb7-5&oh=00_AYC7TvEofng7f3MjGEUfj6sl9tKMFz2ciRvm26YxROUECg&oe=674A0C70&_nc_sid=fc8dfb",
            videoDownloadUrl: nil,
            requestedUrl: "https://www.instagram.com/p/DCPkOAEoKg0/?igsh=MTcxZ3JkZWMxdGQ1eQ=="
)))
