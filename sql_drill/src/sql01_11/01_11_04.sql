■問題
書籍情報テーブル（books）で、出版社ごとの書籍価格の平均値を求めてみましょう。
平均値が小数点になった場合、小数点以下を切り捨てます。

■実行文
# 出版社とその書籍価格の平均値を小数点以下を切り捨てた形で取得
SELECT
	publish,
	FLOOR(AVG(price)) AS 平均値
# 書籍情報テーブルから取得
from
	books
# 出版社ごとに値を算出
GROUP BY
	publish
;

■返却値
mysql> SELECT
    -> publish,
    -> FLOOR(AVG(price)) AS 平均値
    -> from
    -> books
    -> GROUP BY
    -> publish
    -> ;
+--------------+--------+
| publish      | 平均値 |
+--------------+--------+
| 山田出版     |   2157 |
| 秀和システム |   2400 |
| 翔泳社       |   3150 |
| 日経BP       |   2433 |
+--------------+--------+
4 rows in set (0.01 sec)

