# Cyclistic-analysis
## 背景 / 目的
  - Cyclistic（架空の自転車シェア会社）のカジュアルライダ-（単発/1日利用者）を年間会員へ転換するための示唆を得ることを目的とした分析。
    - 使用方法の違い / どのように年間利用への転換を促すのかを考える

## 使用データ
 - Divvy trip data 2025年8月〜2026年7月（12ヶ月分）
  - Motivate International Inc. により提供

## 使用技術
- Google BigQuery（外れ値検出、データクリーニング・集計）
- Looker Studio（可視化ダッシュボード）

## 分析プロセス
  # Prepare
    - Google Cloud Storageから「BigQuery」へのデータ取り込み
