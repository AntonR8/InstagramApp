
import SwiftUI

struct PostImages: View {
    let post: PostModel
    @Binding var currentImage: String

    func showNavPoints() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = .gray
//        UIPageControl.appearance().preferredIndicatorImage = UIImage(systemName: "circle.fill")
        UIPageControl.appearance().hidesForSinglePage = true
        //        UIPageControl.appearance().setIndicatorImage(UIImage(systemName: "circle.fill", withConfiguration: UIImage.SymbolConfiguration(font: .systemFont(ofSize: 5))), forPage: 3)
    }

    var body: some View {
            TabView {
                ForEach(post.carousel, id: \.self) { onePost in

                    if let videoURL = onePost.videoDownloadUrl {
                        if let imageURL = onePost.imageDownloadUrl {
                            PostVideoPreview(imagePreview: imageURL, videoPreview: videoURL)
                                .onAppear {
                                    currentImage = imageURL
                                }
                    }
                    } else if let imageURL = onePost.imageDownloadUrl {
                        PostImageView(imagePreview: imageURL)
                            .onAppear {
                                currentImage = imageURL
                            }
                    }
                }
        }
        .frame(maxWidth: .infinity, minHeight: UIScreen.main.bounds.width * 1.2)
        .tabViewStyle(.page)
        .onAppear {
            showNavPoints()
        }

    }
}

#Preview {
    ScrollView {
        PostImages(post: mockPostResponse.data.post, currentImage: .constant(""))
    }
}
