# 課題

動画を再生する iOS アプリケーションを作成します。

## 最小要件（2画面）

### A）動画ファイルのプレイリストを表示する

- [このJSONファイル](https://quipper.github.io/native-technical-exam/playlist.json)からプレイリストを描画してください
- タイトル、サムネイル、説明、講師の名前を表示する
- タイトル、説明、講師の名前、時間の文字列は省略せずに表示する必要があります
- 動画が選択されたら、フルスクリーンモードで動画の再生を開始してください

### B）動画をフルスクリーンモードで再生する

- ランドスケープでの全画面再生をサポート
- 再生、一時停止、再生位置を表示/調整するためのスライダー
- 再生時間と終了時間を表示し続ける

## コーディングの制限

- Swift 5.0 以上
- iOS 11 以降
- こちらのスタイルを満たしてください: [Swift Style Guide - Google](https://google.github.io/swift/)
- Apache, MIT, BSD およびそれらの派生ライセンスで公開されているライブラリを使うことができます

## ターゲットデバイス

- iPhone SE 以降のすべての iPhone 端末

## 言語

- ソースコード (コメントを含む) 及び Git の commit メッセージは英語で記述してください

## Gitコミット

コミットを複数に分割してください。1つの大きなコミットにまとめないでください。

## 提出方法

こちらのコマンド `git bundle create repo.bundle HEAD master` を実行し, 生成された `repo.bundle` ファイルをこちらのアドレス (hiring.jp@quipper.com) 宛にメールで送ってください。(`git-bundle` とは: [Git - git-bundle Documentation](https://git-scm.com/docs/git-bundle))

## ボーナスポイント

- 仕様を満たしていることを確認するため適宜 Unit test を追加してみてください。
- フルスクリーンの動画ビューを開始または終了するときに、トランジションに適したアニメーションを使用してください
  - 例: ユーザーが選択したサムネイルビューから動画ビューが開き、動画が閉じられると動画ビューがサムネイルビューに戻ります
  - または、スキルをアピールするためにより良いエフェクト/アニメーションを提案することもできます
- 限られた時間で最高のUI / UXを設計してみてください
- アプリを改善するためのアイデアがあれば、自由にアプリに取り入れることができます
