# WordWolf
SwiftUIによるiOSアプリ

## 本アプリの概要
SwiftUIによって制作したiOSアプリになります。
3人以上30人以上でワード人狼ゲームを行えます。
ワード人狼ゲームのルールは、以下の通りです。
二つの単語から成るお題が自動的に選ばれ、そのお題の単語のいずれかが、各プレイヤーに割り振られます。お題の単語のうち、
一方は1人のプレイヤー(このプレイヤーを「人狼」と呼称します)のみに割り振られ、もう一方の単語は他のプレイヤー全員
(こちらのプレイヤーを「人間」と呼称します)に割り振られます。
各プレイヤーが自分のワードを確認したのち、3分間の話し合いを行います。
その話し合いを行ったのち、誰が人狼だと思うか投票を行います。
投票の結果、本当の人狼への投票数が半分以下であれば人狼側の勝利、そうでない場合は人間側の勝利と判定します。
また、各プレイヤーの勝敗も判定されます。人狼であれば、人狼側の勝利であれば勝ち、人間側の勝利であれば負けとなります。
人間であれば、人間側の勝利かつ、自分の投票先が人狼であれば勝ち、そうでない場合は負けとなります。

## 使用技術

### 言語
Swift
(Apple Swift version 5.2 (swiftlang-1103.0.32.1 clang-1103.0.32.29))

### フレームワーク
SwiftUI

## アプリを使用する前に
現在の状態でもアプリを使用できますが、お題を複数楽しめるようにするため、以下の変更を行うことをお勧めします。
### 変更するファイル
/WorWolf/Words.swift
### 変更内容
14行目以降から、新たな文字列の配列を追加する。追加する文字列の配列は、2つの文字列から構成されるものとする。

### 各画面の概要
ここでは、アプリでゲームを行う際に表示される順番に沿って、各画面を紹介します。

#### トップ画面
アプリを起動すると最初に表示されます。
この画面ではプレイヤー人数を指定します。
「次へ」を押下すると、名前設定画面に遷移します。

#### 名前設定画面
トップ画面で設定した人数分の名前入力フォームが表示され、各プレイヤーの名前が設定できます。
「ゲーム開始」を押下することでワード確認画面に遷移し、以降、1人目のプレイヤーからワード確認を行っていただきます。
なお、左上の「トップ」を押下することでトップ画面に戻ることができます。この仕様は以下の全画面にも共通となります。

#### ワード確認画面
「あなたは〇〇さんですか?」(「〇〇」は各プレイヤーの名前)というメッセージが表示されますので、名前が表示されたプレイヤーにより、
「ワードを確認する」を押下します。
そうしますと、そのプレイヤーに割り当てられたワードが記載されたダイアログが表示されます。
ワードを確認しましたら、「次の人へ」(まだワードを確認していないプレイヤーが存在する場合にこのボタンが表示)ないし
「話し合い画面へ」(すべてのプレイヤーがワードを確認した場合にこのボタンが表示)を押下します。
「次の人へ」を押下すると、画面の表示内容が次のプレイヤー用に置き換わります。
「話し合い画面へ」を押下すると、話し合い画面に遷移します。

#### 話し合い画面
「開始」を押下すると、180秒間のカウントダウンが始まります。
この間に、話し合いを行ってください。
カウントダウンが終わると投票画面に自動遷移し、以降、1人目のプレイヤーから投票を行っていただきます。

#### 投票画面
自分以外のプレイヤーの名前が表示されたピッカーが表示されますので、人狼だと思うプレイヤーの名前を選択し、「投票」を押下します。
「押下」を押下すると、まだ投票を行っていないプレイヤーがいる場合は次のプレイヤーの投票画面に遷移、全プレイヤーが投票した後では
結果画面に
「押下」を押下すると、まだ投票を行っていないプレイヤーがいる場合は次のプレイヤーの投票画面に遷移、全プレイヤーが投票した後では
結果画面に遷移します。

#### 結果画面
人狼側の勝利か人間側の勝利か、そして勝者リスト並びに敗者リストが表示されます。
