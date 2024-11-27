import SwiftUI


struct TrendsResponse: Codable {
    let error: Bool
    let messages: [String]
    let data: [SectionModel]
}

struct SectionModel: Codable, Hashable, Identifiable {
    let id: Int
    let title: String
    let isMain: Bool
    let pos: Int
    let sets: [CountryChart]
}

struct CountryChart: Codable, Hashable, Identifiable {
    let id: Int
    let title: String
    let pos: Int
    let isPremium: Bool
    let image: String
    let music: [TrackModel]
}

struct TrackModel: Codable, Hashable {
    let title, creator: String
    let cover: String
    let trend: String?
    let url: String
}





let mockTrendsResponse = TrendsResponse(
    error: false,
    messages: [],
    data: [
        SectionModel(
            id: 1,
            title: "Америка",
            isMain: false,
            pos: 1,
            sets: [
                CountryChart(
                    id: 2,
                    title: "Трендовые: США",
                    pos: 1,
                    isPremium: false,
                    image: "https://proinstsave.site/storage/setImages/r3PPAWiAaVxMfmzXVYTpOEbWxf3USRzf3g9W8umY.webp",
                    music: []
              ),
                CountryChart(
                    id: 3,
                    title: "Трендовые: Канада",
                    pos: 2,
                    isPremium: true,
                    image: "https://proinstsave.site/storage/setImages/yY49BPsZaOy4V9vRNj7ivRGDWrU7KOZxGMAZyWkK.webp",
                    music: []
                ),
                  CountryChart(
                    id: 1,
                    title: "Трендовые: Бразилия",
                    pos: 3,
                    isPremium: true,
                    image: "https://proinstsave.site/storage/setImages/6Sqgau79aMlQKkLtGjUCRehYEAS38PMqiOUv9W7U.webp",
                    music: []
                )
            ]
        ),
        SectionModel(
            id: 6,
            title: "Западная Европа",
            isMain: false,
            pos: 2,
            sets: [
                CountryChart(
                    id: 4,
                    title: "Трендовые: Великобритания",
                    pos: 1,
                    isPremium: false,
                    image: "https://proinstsave.site/storage/setImages/hBrbZLbXezToNEDyPVYMP2qAhDrDXwSPByRKx6C1.webp",
                    music: []
                    ),
                      CountryChart(
                    id: 5,
                    title: "Трендовые: Германия",
                    pos: 2,
                    isPremium: true,
                    image: "https://proinstsave.site/storage/setImages/6SS1AM2rpXQj7uXScPdvy03pmbTvhmKawuGYYIQM.webp",
                    music: []
                      ),
                        CountryChart(
                    id: 6,
                    title: "Трендовые: Франция",
                    pos: 3,
                    isPremium: true,
                    image: "https://proinstsave.site/storage/setImages/Na3BvSHT8JdlxanbzEAx8vwz18oGfBoaxnUrFNMY.webp",
                    music: []
         )
            ]
                        ),
                        SectionModel(
            id: 7,
            title: "Восточная Европа",
            isMain: false,
            pos: 3,
            sets: [
                CountryChart(
                    id: 7,
                    title: "Трендовые: Беларусь",
                    pos: 1,
                    isPremium: false,
                    image: "https://proinstsave.site/storage/setImages/xQEw59ERQljvtUrGxtuIvYSGcVvSjkovWPBJmtZy.webp",
                    music: []
                    ),
                      CountryChart(
                    id: 8,
                    title: "Трендовые: Россия",
                    pos: 2,
                    isPremium: true,
                    image: "https://proinstsave.site/storage/setImages/Duy6JCow6IQwmbgu0IYvflUV3WLB2UZ5kwbf0GB3.webp",
                    music: [
                        TrackModel(
                            title: "Wicked Game",
                            creator: "Chris Isaak",
                            cover: "https://proinstsave.site/storage/cover/APRSoZxnbC4e0kZOXcacES6SiIhgdv5mnQMdxwUZaDkrfeXWOMwxVEJ0encH.jpg",
                            trend: "up",
                            url: "https://proinstsave.site/storage/audio/MGlZbqMbUtiSR2XMrvKej9xrh6YSqghNynDl0o785nqAhReSJLmV3NieB6NC.mp4"
                        ),
                        TrackModel(
                            title: "На часах ноль-ноль",
                           creator: "Dabro",
                            cover: "https://proinstsave.site/storage/cover/3TJFmD5cLddIr5u2QMFgVFPXKfPhondp0ji2eTtowlvSZQI60meyjzDmTeVY.jpg",
                            trend: "up",
                            url: "https://proinstsave.site/storage/audio/se7NFpEaAfObLOn8sQfv0cwOlGImnzu2TcIBxUk1t7whcR8MrN13zSh4FmCl.mp4"
                        ),
                        TrackModel(
                            title: "Тяжёлый люкс",
                            creator: "45/13",
                            cover: "https://proinstsave.site/storage/cover/MazIYXIx91i23MjIaziY953yjJDryKr8XD0OLqHs6tz366EM9p4l9hHK268T.jpg",
                            trend: "up",
                            url: "https://proinstsave.site/storage/audio/vhVwZsr2ZZ6Kc6QCTCPE1eH1CrY55lc3jrHMegLHaXTYgjwD1U4VemL5DPVu.mp4"
                        ),
                        TrackModel(
                            title: "Pedro (Techno)",
                            creator: "puremind",
                            cover: "https://proinstsave.site/storage/cover/dz3npC7lOrB3pVDWP7pg9IloRh8ZMbLo9LbsBLfTY1QfW7qVqlcXMsdg8jO.jpg",
                            trend: "up",
                            url: "https://proinstsave.site/storage/audio/pMnk9ZRF5NpdBdnVaTIuDYI9RPUt9LhFlgUZhqPu7sMMwldcBLJ81OhN1G3n.mp4"
                        ),
                        TrackModel(
                            title: "Take You On",
                            creator: "James Mercy, PhiloSofie",
                            cover: "https://proinstsave.site/storage/cover/zeJN3IWuAeODm72nrIOAlOuwMVkxBHIIe76c96FOo8QHFnFfX0cXGd9knZus.jpg",
                            trend: "down",
                            url: "https://proinstsave.site/storage/audio/vrrIG7ccQuPXxPSVRyT3WZRwwnOA2jDzE7wHudhvIEVFK7orUNZ3yCnVTHJt.mp4"
                        ),
                        TrackModel(
                            title: "Good Vibes (Instrumentals)",
                            creator: "Beats by Talent",
                            cover: "https://proinstsave.site/storage/cover/YpvJZhkEUGsqP17bRlyzeeUOGwGfueOP6KfUCbRJL8dInhBnZHKqpjSh1FrT.jpg",
                            trend: "down",
                            url: "https://proinstsave.site/storage/audio/MKCLyJ1syataaCkM3i1ef5M84VocyKziZkq6dUKgViI3yw7mS2Ez7tnNaJBa.mp4"
                        ),
                        TrackModel(
                            title: "Intro",
                            creator: "The xx",
                            cover: "https://proinstsave.site/storage/cover/WDjUokBmhOAl1JKEQ6NzTYJgDPdYtXzxu7aDNjOdnoqK9yYXSejb9Zd7aypE.jpg",
                            trend: "down",
                            url: "https://proinstsave.site/storage/audio/CMaKJquRVY95xsSZBcpd9FpnPN0ca1pDOM6P64516W4hWzHtfKuXPYtsbRjf.mp4"
                        ),
                        TrackModel(
                            title: "snowfall",
                            creator: "Øneheart, reidenshi",
                           cover: "https://proinstsave.site/storage/cover/m0Xk4AzZoQs376O15shE0f3jrgSjlv3kd0rILsWWwvKjJTsnhV4OWPHEp1NJ.jpg",
                            trend: "up",
                            url: "https://proinstsave.site/storage/audio/cjBcS87k16j1jc8wQE17fMuHC4bQLEB5malm67c33Otq8U5K6VL3uXas5Vug.mp4"
                        ),
                        TrackModel(
                            title: "Idea 10",
                            creator: "Gibran Alcocer",
                            cover: "https://proinstsave.site/storage/cover/rmj2WkHbAW1xUaaRlbfLLOtvkkKQ8Dy6pcuomSLcANRev7CfjDEBizjaTGtW.jpg",
                            trend: "up",
                            url: "https://proinstsave.site/storage/audio/ttH7jSYa9FNzMOYfzOuOvy3KnXJHx3ibdGnPbKEiESFqCxm2p3cT9HXtrDLH.mp4"
                        ),
                        TrackModel(
                            title: "Ты неси меня река",
                            creator: "Любэ",
                            cover: "https://proinstsave.site/storage/cover/OavSqHxkdbYEDEGXJiYTyF3IQpp8rf7DJqive6ik0qlF1uH6ubgxxtjnZnfD.jpg",
                            trend: "up",
                            url: "https://proinstsave.site/storage/audio/voJt9UXFrfqdyTtpgWM4yxmO9GMZqlB1eDeyCtjgZuERSqJTDtPsPQDw5gvP.mp4"
                        )
                    ]
                )
            ]
                      ),
                      SectionModel(
            id: 8,
            title: "Азия и Океания",
            isMain: false,
            pos: 4,
            sets: [
                CountryChart(
                    id: 9,
                    title: "Трендовые: Япония",
                    pos: 1,
                    isPremium: false,
                    image: "https://proinstsave.site/storage/setImages/ISRThF5EqVFuRTUBhjBeaWktz3eIZYXGWsN8DtYD.webp",
                    music: []
                    ),
                      CountryChart(
                    id: 10,
                    title: "Трендовые: Корея",
                    pos: 2,
                    isPremium: true,
                    image: "https://proinstsave.site/storage/setImages/Ih1EaAsgh63gCEeWusEvD3YOp4usVB8CfR2Bkg5B.webp",
                    music: []
                      ),
                        CountryChart(
                    id: 11,
                    title: "Трендовые: Австралия",
                    pos: 3,
                    isPremium: true,
                    image: "https://proinstsave.site/storage/setImages/O2XLdcBVrOu15S4fmZe2x4n1a2f9WwLowWQu2amO.webp",
                    music: []
                )
            ]
        )
    ]
)
