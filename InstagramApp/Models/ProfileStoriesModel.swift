
import Foundation

struct ProfileStoriesResponse: Codable {
    let error: Bool
    let messages: [String]
    let data: ProfileStoriesData
}

struct ProfileStoriesData: Codable {
    let profileStories: ProfileStories
}

struct ProfileStories: Codable {
    let items: [ProfileStoriesModel]
}

struct ProfileStoriesModel: Codable, Hashable {
    //    let id, mediaType, productType: String
    //    let isPinned: Bool
    //    let userId: String
    let name: String
        let username: String
    let avatar: String
    //    let thumbnail: String
    let imageDownloadUrl: String
    let videoDownloadUrl: String?
    //    let publishedAt: String
    let sinceStr: String
    let requestedUrl: String


}


// MARK: - MockData

let mockProfileStoriesResponse = ProfileStoriesResponse(
    error: false,
    messages: [],
    data: ProfileStoriesData(
        profileStories: ProfileStories(
            items: [
                ProfileStoriesModel(
//                    id: "3509103626444018026",
//                    mediaType: "2",
//                    productType: "story",
//                    isPinned: false,
//                    userId: "30569564320",
                    name: "Marcus Mesquita",
                    username: "mmvtech",
                    avatar: "https://scontent-hou1-1.cdninstagram.com/v/t51.2885-19/352836536_1310178243234220_7103284466095978702_n.jpg?stp=dst-jpg_e0_s150x150_tt6&_nc_ht=scontent-hou1-1.cdninstagram.com&_nc_cat=104&_nc_ohc=LduCgeLSfaAQ7kNvgGMBLE8&_nc_gid=65f9d8bd789643a99a7b6d0e28efd065&edm=AA0lj5EBAAAA&ccb=7-5&oh=00_AYBWiwGzaUrJI7ciF08bHcj5q4L_eZH61sXnq2OiTIVlHQ&oe=674B35F2&_nc_sid=0a490e",
//                    thumbnail: "https://scontent-hou1-1.cdninstagram.com/v/t51.2885-15/468286365_1101264228320337_6543367415344343720_n.jpg?stp=dst-jpg_e15&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi42NDB4MTEzNi5zZHIuZjcxODc4LmRlZmF1bHRfY292ZXJfZnJhbWUifQ&_nc_ht=scontent-hou1-1.cdninstagram.com&_nc_cat=109&_nc_ohc=zUmFPkaidG4Q7kNvgHTq14o&_nc_gid=65f9d8bd789643a99a7b6d0e28efd065&edm=AA0lj5EBAAAA&ccb=7-5&ig_cache_key=MzUwOTEwMzYyNjQ0NDAxODAyNg%3D%3D.3-ccb7-5&oh=00_AYAl7N6lCruy8o2Ygnlnf6rk4MsW6lP_3eIux6RyCz_5vw&oe=674B55D4&_nc_sid=0a490e",
                    imageDownloadUrl: "https://scontent-hou1-1.cdninstagram.com/v/t51.2885-15/468286365_1101264228320337_6543367415344343720_n.jpg?stp=dst-jpg_e15&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi42NDB4MTEzNi5zZHIuZjcxODc4LmRlZmF1bHRfY292ZXJfZnJhbWUifQ&_nc_ht=scontent-hou1-1.cdninstagram.com&_nc_cat=109&_nc_ohc=zUmFPkaidG4Q7kNvgHTq14o&_nc_gid=65f9d8bd789643a99a7b6d0e28efd065&edm=AA0lj5EBAAAA&ccb=7-5&ig_cache_key=MzUwOTEwMzYyNjQ0NDAxODAyNg%3D%3D.3-ccb7-5&oh=00_AYAl7N6lCruy8o2Ygnlnf6rk4MsW6lP_3eIux6RyCz_5vw&oe=674B55D4&_nc_sid=0a490e",
                    videoDownloadUrl: "https://scontent-hou1-1.cdninstagram.com/o1/v/t16/f1/m78/9D496E5C1C4B544F9214A13510B26992_video_dashinit.mp4?efg=eyJ4cHZfYXNzZXRfaWQiOjM5MzkzMzY2NTYzNDM5NDIsInZlbmNvZGVfdGFnIjoieHB2X3Byb2dyZXNzaXZlLklOU1RBR1JBTS5TVE9SWS5DMy43MjAuZGFzaF9iYXNlbGluZV8xX3YxIn0&_nc_ht=scontent-hou1-1.cdninstagram.com&_nc_cat=104&vs=bf89eb0a46d0b48e&_nc_vs=HBksFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyLzlENDk2RTVDMUM0QjU0NEY5MjE0QTEzNTEwQjI2OTkyX3ZpZGVvX2Rhc2hpbml0Lm1wNBUAAsgBABUCGDpwYXNzdGhyb3VnaF9ldmVyc3RvcmUvR0liUjZodHgxT0NOc2tFREFKYkF5ZkE1TXVzcWJwa3dBQUFGFQICyAEAKAAYABsCiAd1c2Vfb2lsATEScHJvZ3Jlc3NpdmVfcmVjaXBlATEVAAAmjM7qoMmz_w0VAigCQzMsF0AwzMzMzMzNGBJkYXNoX2Jhc2VsaW5lXzFfdjERAHXoBwA&ccb=9-4&oh=00_AYD_jt_Uay6o4sCta7PAsSJS7juG0ChoyXTn5Px9CuFbLw&oe=6747471A&_nc_sid=1d576d",
//                    publishedAt: "25.11.2024 12:29:27",
                    sinceStr: "18 hours before",
                    requestedUrl: "https://www.instagram.com/mmvtech"
                ),
                ProfileStoriesModel(
//                    id: "3509256716762377084",
//                    mediaType: "2",
//                    productType: "story",
//                    isPinned: false,
//                    userId: "30569564320",
                    name: "Marcus Mesquita",
                    username: "mmvtech",
                    avatar: "https://scontent-hou1-1.cdninstagram.com/v/t51.2885-19/352836536_1310178243234220_7103284466095978702_n.jpg?stp=dst-jpg_e0_s150x150_tt6&_nc_ht=scontent-hou1-1.cdninstagram.com&_nc_cat=104&_nc_ohc=LduCgeLSfaAQ7kNvgGMBLE8&_nc_gid=65f9d8bd789643a99a7b6d0e28efd065&edm=AA0lj5EBAAAA&ccb=7-5&oh=00_AYBWiwGzaUrJI7ciF08bHcj5q4L_eZH61sXnq2OiTIVlHQ&oe=674B35F2&_nc_sid=0a490e",
//                    thumbnail: "https://scontent-hou1-1.cdninstagram.com/v/t51.2885-15/468399210_2405593656315935_3552542425599919232_n.jpg?stp=dst-jpg_e15&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi42NDB4MTEzNi5zZHIuZjcxODc4LmRlZmF1bHRfY292ZXJfZnJhbWUifQ&_nc_ht=scontent-hou1-1.cdninstagram.com&_nc_cat=111&_nc_ohc=gN3iZSnFWf0Q7kNvgFz5tf3&_nc_gid=65f9d8bd789643a99a7b6d0e28efd065&edm=AA0lj5EBAAAA&ccb=7-5&ig_cache_key=MzUwOTI1NjcxNjc2MjM3NzA4NA%3D%3D.3-ccb7-5&oh=00_AYD5cY7vjXbOksJa0LTWfXyac0qOEi2xWC8Rj6arwfxDGA&oe=674B36B7&_nc_sid=0a490e",
                    imageDownloadUrl: "https://scontent-hou1-1.cdninstagram.com/v/t51.2885-15/468399210_2405593656315935_3552542425599919232_n.jpg?stp=dst-jpg_e15&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi42NDB4MTEzNi5zZHIuZjcxODc4LmRlZmF1bHRfY292ZXJfZnJhbWUifQ&_nc_ht=scontent-hou1-1.cdninstagram.com&_nc_cat=111&_nc_ohc=gN3iZSnFWf0Q7kNvgFz5tf3&_nc_gid=65f9d8bd789643a99a7b6d0e28efd065&edm=AA0lj5EBAAAA&ccb=7-5&ig_cache_key=MzUwOTI1NjcxNjc2MjM3NzA4NA%3D%3D.3-ccb7-5&oh=00_AYD5cY7vjXbOksJa0LTWfXyac0qOEi2xWC8Rj6arwfxDGA&oe=674B36B7&_nc_sid=0a490e",
                    videoDownloadUrl: "https://scontent-hou1-1.cdninstagram.com/o1/v/t16/f1/m78/8E4651EAEE9CC96BAC72B61001243BA2_video_dashinit.mp4?efg=eyJ4cHZfYXNzZXRfaWQiOjQzMjAxMTY5NjYyNzQ4NCwidmVuY29kZV90YWciOiJ4cHZfcHJvZ3Jlc3NpdmUuSU5TVEFHUkFNLlNUT1JZLkMzLjcyMC5kYXNoX2Jhc2VsaW5lXzFfdjEifQ&_nc_ht=scontent-hou1-1.cdninstagram.com&_nc_cat=105&vs=2c2a7aed33702823&_nc_vs=HBksFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyLzhFNDY1MUVBRUU5Q0M5NkJBQzcyQjYxMDAxMjQzQkEyX3ZpZGVvX2Rhc2hpbml0Lm1wNBUAAsgBABUCGDpwYXNzdGhyb3VnaF9ldmVyc3RvcmUvR1B2LTR4dWg4UWVDV0s0QkFBT1h1MnRvTldCQ2Jwa3dBQUFGFQICyAEAKAAYABsCiAd1c2Vfb2lsATEScHJvZ3Jlc3NpdmVfcmVjaXBlATEVAAAmuPy6-7G6xAEVAigCQzMsF0As7peNT987GBJkYXNoX2Jhc2VsaW5lXzFfdjERAHXoBwA&ccb=9-4&oh=00_AYBCs2AxhlozzECTx0m2jYQxIveWXBl4V6xUfC9ob4LXug&oe=674750C1&_nc_sid=1d576d",
//                    publishedAt: "25.11.2024 17:33:27",
                    sinceStr: "13 hours before",
                    requestedUrl: "https://www.instagram.com/mmvtech"
                )

            ]
        )
    )
)
