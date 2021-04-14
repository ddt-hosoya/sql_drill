■問題
以下は、社員テーブル（employee）から所属部署ごとに女性の人数を求め、3人以上の部署だけを出力するためのSQL命令ですが、２つ誤りがあります。
誤りを指摘してください。
SELECT
	depart_id,
	COUNT(*)
FROM
	employee
WHERE
	sex=2
ORDER BY
	depart_id
WHERE
	COUNT(*) >= 3
;
■回答・実行文
指摘１：所属部署ごとに集計したいので ORDER BY depart_idではなく GROUP BY depart_idが正しい
指摘２：所属部署ごとに集計した結果を取得条件にしたいので WHERE COUNT(*) >= 3 ではなく HAVING COUNT(*) >= 3 が正しい

# 部署、部署に所属する女性の人数
SELECT
	depart_id,
	COUNT(*)
# 社員テーブルから取得
FROM
	employee
# 性別が女性の場合に集計
WHERE
	sex=2
# 部署ごとに集計
GROUP BY
	depart_id
# 部署ごとに集計し、女性の人数が3人以上の場合に情報を取得
HAVING
	COUNT(*) >= 3
;

■返却値
mysql> SELECT
    -> depart_id,
    -> COUNT(*)
    -> FROM
    -> employee
    -> WHERE
    -> sex=2
    -> GROUP BY
    -> depart_id
    -> HAVING
    -> COUNT(*) >= 3
    -> ;
+-----------+----------+
| depart_id | COUNT(*) |
+-----------+----------+
| S01       |        4 |
| S02       |        5 |
+-----------+----------+
2 rows in set (0.00 sec)

mysql>