import UIKit
import AGVideoPlayerView

class MediaCell: UITableViewCell {
    @IBOutlet weak var playerView: AGVideoPlayerView!

    func setData(videoUrl: URL, previewImageUrl: URL?) {
        self.playerView.videoUrl = videoUrl
        self.playerView.previewImageUrl = previewImageUrl
        self.playerView.shouldAutoplay = true
        self.playerView.shouldAutoRepeat = true
        self.playerView.showsCustomControls = false
        self.playerView.shouldSwitchToFullscreen = true
    }

    override func layoutSubviews() {
        self.playerView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)

        super.layoutSubviews()
    }
}

class ViewController: UITableViewController {
    var items: [URL] = [
        URL(string: "http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_1mb.mp4")!,
        URL(string: "http://yt-dash-mse-test.commondatastorage.googleapis.com/media/car-20120827-85.mp4")!,
        URL(string: "http://yt-dash-mse-test.commondatastorage.googleapis.com/media/oops-20120802-85.mp4")!,
        URL(string: "http://yt-dash-mse-test.commondatastorage.googleapis.com/media/motion-20120802-85.mp4")!
    ]
    var images: [URL?] = [
        URL(string: "https://i.ytimg.com/vi/aqz-KE-bpKQ/maxresdefault.jpg"),
        URL(string: "http://www.bialystok.pl/resource/video-thumb/192/334/6102/14724/750x415.jpg"),
        nil,
        nil
    ]

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MediaCell", for: indexPath) as! MediaCell
        let index = indexPath.row % 4

        cell.setData(videoUrl: items[index], previewImageUrl: images[index])
        return cell
    }
}
