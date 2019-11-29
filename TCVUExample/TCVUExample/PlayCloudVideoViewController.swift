//
//  PlayCloudVideoViewController.swift
//  TCVUExample
//
//  Created by ryan on 2019/11/29.
//  Copyright © 2019 windbird. All rights reserved.
//

import UIKit
import SuperPlayer

class PlayCloudVideoViewController: UIViewController {

    @IBOutlet weak var viewPlayerContainer: UIView!
    public var videoId: String!
    public var appID: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        let playerView = SuperPlayerView()
        playerView.delegate = self
        playerView.fatherView = viewPlayerContainer
        let playerModel = SuperPlayerModel()
        let video = SuperPlayerVideoId()
        video.appId = appID
        video.fileId = videoId
        playerModel.videoId = video
        playerView.play(with: playerModel)
    }


}

extension PlayCloudVideoViewController: SuperPlayerDelegate {

}
