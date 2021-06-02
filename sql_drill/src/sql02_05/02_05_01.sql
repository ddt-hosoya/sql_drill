■問題文
アンケート回答テーブルから回答者の平均年齢を超えている人の回答（answer1,answer2列）を評価の低い順に取り出してみましょう。

■実行文
# answer1,answer2列を出力
SELECT
	answer1,
	answer2
# アンケート回答テーブル
FROM
	quest
# 回答者の平均年齢を超えている人の回答のみ出力
WHERE
	age > ( SELECT AVG(age) FROM quest )
# 評価の低い順に並べる
ORDER BY
answer1 ASC
;
■返却値
mysql> SELECT
    -> answer1,
    -> answer2
    -> FROM
    -> quest
    -> WHERE
    -> age > ( SELECT AVG(age) FROM quest )
    -> ORDER BY
    -> answer1 ASC
    -> ;
+---------+--------------------+
| answer1 | answer2            |
+---------+--------------------+
|       1 | NULL               |
|       2 | わかりやすいです。 |
|       2 | NULL               |
|       2 |                    |
|       3 | 買ってよかった。   |
|       3 | 文字が小さい。     |
|       3 | 絵がかわいい。     |
+---------+--------------------+
7 rows in set (0.04 sec)