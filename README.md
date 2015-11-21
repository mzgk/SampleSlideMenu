# SampleSlideMenu
スワイプで画面左端から表示されるSlideMenuのサンプル

## 目的
簡単なSlideMenuが欲しかったが、OSSは大袈裟なものが多かったので。

## 方法
- ViewControllerにContanierViewを追加する
- ContanierViewのAutoLayoutを設定する
    - 重要：表示サイズをどの程度にするか（Equal Width = SuperViewに対して80%）
- 表示／非表示はフラグ（isContanierShown）で制御
- 表示／非表示はContanierViewのleading.space（左端の制約）を操作する
    - 0：表示中
    - マイナスContanierView.width：画面外
- 初期表示はviewDidload()ではなく、viewDidLayoutSubviews()で行う
    - contanierViewのレイアウトが済むのがこのタイミングなので