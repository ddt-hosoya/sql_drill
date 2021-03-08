■問題
アンケート集計テーブル（quest）から感想欄が未定義（NULL値）のでない情報のみを取り出してみましょう。
取り出す列は answer2 列のみとします。

■実行文
# answer2 列を取り出す
SELECT
	answer2
# アンケート集計テーブルから取得
FROM
	quest
# 感想欄が未定義（NULL値）のでない情報のみ取得
WHERE
	answer2 IS NOT NULL
;

■返却値
mysql> SELECT
    -> answer2
    -> FROM
    -> quest
    -> WHERE
    -> answer2 IS NOT NULL
    -> ;
+--------------------------+
| answer2                  |
+--------------------------+
| 重宝しています。         |
| 面白いです。             |
| ちょっと難しいです。     |
| 次回作に期待しています。 |
| わかりやすいです。       |
| 絵が少ない。             |
| 買ってよかった。         |
|                          |
| 文字が小さい。           |
| 読みやすいです。         |
| 絵がかわいい。           |
+--------------------------+
11 rows in set (0.00 sec)