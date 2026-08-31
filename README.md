# Cyclistic-analysis
## 背景 / 目的
  - Cyclistic（架空の自転車シェア会社）のカジュアルライダ-（単発/1日利用者）を年間会員へ転換するための示唆を得ることを目的とした分析。使用方法の違い / どのように年間利用への転換を促すのかを考える。

## 使用データ
 - Divvy trip data 2025年8月〜2026年7月（12ヶ月分）
  - Motivate International Inc. により提供

## 使用技術
- Google BigQuery（外れ値検出、データクリーニング・集計）
- Looker Studio（可視化ダッシュボード）

## 分析プロセス
  1. Ask
     - 年間会員とカジュアルライダーで、Cyclisticの自転車の利用方法にどのような違いがあるか？
     - 仮説 : 年間会員は同じ利用目的が連続的（平日or土日）にある可能性（通勤など）あり
  
  2. Prepare
     - Google Cloud Storageから「BigQuery」へのデータ取り込み
     - データ型/データのサイズ/データの最新性を確認

  3. Process
     - 使用時間1分以内のデータが残っていないかの確認
     - 四分位範囲を使用して外れ値を計算
     - クリーニング
     - 利用駅にNULL値があるがその他の項目が分析に使用可能なため残す判断

  6. Analyze
      会員別に下記を算出
       - 利用回数 / 平均利用時間
       - 曜日 / 時間帯別利用回数
       - 月間利用回数の推移
       - 主要利用駅
       - バイクタイプごとの利用回数

  7. Share
     - Looker Studioダッシュボード([Cyclistic-Analysis.pdf](https://github.com/user-attachments/files/31626927/Cyclistic-Analysis.pdf))

  
  8. Act
     -下記提言に記載

## 分析概要と発見
  - 総利用回数
    - Member : 3,636,969回(66.7%)
    - Casual : 1,810,640回(33.3%)
- 使用目的
  - Member : 通勤利用
      - 平日の朝7-8時/夕方16-17時が多い
      - 主要利用駅のランキングより推察

  - Casual : 観光 / レジャー
      - 土日の利用 / 平日の午後利用が多い
      - 主要利用駅のランキングより推察
    
  <img width="1116" height="559" alt="image" src="https://github.com/user-attachments/assets/11df6231-da31-4338-84e8-bcc610a5e674" />
<img width="990" height="595" alt="image" src="https://github.com/user-attachments/assets/6d3260c6-c1fc-4c27-926d-d5dc9b6ac14d" />


  - 月間推移
    - Member : 7月にピーク（1月の約4.4倍）
    - Casual : 7月にピーク（1月の約12倍）
      
<img width="985" height="384" alt="image" src="https://github.com/user-attachments/assets/693ef44d-65cd-452a-904c-9c78f09b91c7" />



## 提言
  1. デジタルメティア
     - 使用回数 / 利用料金 / 年間料金に切り替えた際のお得な金額を確認できるシミュレーターの作成
     - Casualメンバーに対し、土日 / 平日の午後 に年間利用を促すポップアップ / 広告を表示
  
  3. 夏季に向け、Casual会員がよく利用する駅に広告を設置（Navy Pierを中心にする）

  4. 1回利用券 / 1日利用券の値段を上げる（年間料金は維持）
    - 値段の改定により年間会員への推移を計測する
