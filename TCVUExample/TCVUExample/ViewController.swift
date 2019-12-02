//
//  ViewController.swift
//  TCVUExample
//
//  Created by ryan on 2019/11/28.
//  Copyright © 2019 windbird. All rights reserved.
//

import UIKit
import SwiftCommonTools2

/**
     Secrects.appID为敏感信息，上传git时自动过滤掉了；
     这里需要自行创建Secrects.swift类，并在其中加入Int类型appId常量，如下：
      ```
      import Foundation
      class Secrects {
        public static let appID = xxx
        public static let videoID = "xxx"
        public static let userId = "xxx"
      }
      ```
 */
class ViewController: UIViewController {

    @IBOutlet weak var progressLabel: UILabel!
    private var videoID: String?
    private var userId: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.videoID = Secrects.videoID
        self.userId = Secrects.userId
    }

    @IBAction func didClickUploadButton(_ sender: UIButton) {
        let signature = "oHCOOjg8nTUGcxu/CPNNBZk8YuFzZWNyZXRJZD1BS0lEeG1NZmpZamZwejB3aEJoVU4wb1FSTkoxVmpoUXA4NW0mY3VycmVudFRpbWVTdGFtcD0xNTc1MDExOTUyJmV4cGlyZVRpbWU9MTU3NTA5ODM1MiZyYW5kb209MTU3NTA5ODM1Mg=="
        uploadVideo(userID: "ryan", signature: signature)
    }

    @IBAction func didClickPlayButton(_ sender: UIButton) {
        playVideo()
    }

    /// [签名生成问的文档](https://cloud.tencent.com/document/product/266/9221)
    /// - Parameters:
    ///   - userID: 授权用户ID [用户列表](https://console.cloud.tencent.com/cam)
    ///   - signature: 视频上传授权签名
    func uploadVideo(userID: String, signature: String) {

        guard let videoPath = Bundle.main.path(forResource: "ice_age", ofType: "mp4") else {
            Log.e("视频不存在……")
            return
        }
        guard let publisher = TXUGCPublish(userID: userID) else {
            Log.e("视频上传服务启动失败……")
            return
        }
        let param = TXPublishParam()
        param.videoPath = videoPath
        param.signature = signature
        param.enableHTTPS = true
        param.enableResume = true
        publisher.delegate = self
        let resultCode = publisher.publishVideo(param)
        if resultCode == 0 {
            Log.e("视频上传失败retCode = \(resultCode)")
        }
    }
    
    func playVideo() {
        guard let videoID = videoID else {
            Log.e("videoID为空……")
            return
        }
        let playController = PlayCloudVideoViewController()
        playController.appID = Secrects.appID
        playController.videoId = videoID
        navigationController?.pushViewController(playController, animated: true)
    }
}

extension ViewController: TXVideoPublishListener {

    func onPublishProgress(_ uploadBytes: Int, totalBytes: Int) {
        Log.i("视频上传进度uploadBytes=\(uploadBytes); totalBytes=\(totalBytes)")
        let progress = uploadBytes * 100 / totalBytes
        self.progressLabel.text = "\(progress)%"
    }

    func onPublishComplete(_ result: TXPublishResult!) {
        if let result = result {
            self.videoID = result.videoId
            let des = "retCode=\(result.retCode), msg=\(result.descMsg ?? "")"
            let des2 = "videoId=\(result.videoId ?? ""), videoURL=\(result.videoURL ?? "")"
            Log.i("视频发布成功:\(des),\(des2)")
        }
    }

    func onPublishEvent(_ evt: [AnyHashable: Any]!) {
        Log.i("视频发布事件： ", evt!)
    }
}



