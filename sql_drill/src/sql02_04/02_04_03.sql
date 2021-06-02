■問題文
注文書テーブル（order_main）と注文詳細テーブル（order_desc）、ユーザテーブル（usr）、商品テーブル（product）を結合し、
未納の注文について、発注日、注文コード、商品コード昇順に注文情報を出力してみましょう。
出力列の別名は、発注日、注文コード、利用者氏名、商品名、商品単価、購入数とします。

■実行文
# 発注日、注文コード、利用者氏名、商品名、商品単価、購入数を出力する
SELECT
	om.order_date AS 発注日,
	om.po_id AS 注文コード,
	CONCAT(u.l_name,f_name) AS 利用者氏名,
	p.p_name AS 商品名,
	p.price AS 商品単価,
	od.quantity AS 購入数
FROM
	(
		# 注文書テーブルと注文詳細テーブルを注文コードを結合条件に結合する
		(
			order_main AS om
		INNER JOIN
			order_desc AS od
		ON
			om.po_id = od.po_id
		)
	# さらにユーザテーブルについて注文書テーブルのユーザコードを結合条件に結合する
	INNER JOIN
		usr AS u
	ON
		om.user_id = u.user_id
	)
# さらに商品テーブルについて商品コードを結合条件に結合し、その結果からデータを取得する
	INNER JOIN
		product AS p
	ON
		od.p_id = p.p_id
# 未納の注文の場合に出力
WHERE
	om.delivery_date IS NULL
# 発注日、注文コード、商品コード昇順に注文情報を出力
ORDER BY
	om.order_date ASC, om.po_id ASC, od.p_id ASC
;
■返却値
mysql> SELECT
    -> om.order_date AS 発注日,
    -> om.po_id AS 注文コード,
    -> CONCAT(u.l_name,f_name) AS 利用者氏名,
    -> p.p_name AS 商品名,
    -> p.price AS 商品単価,
    -> od.quantity AS 購入数
    -> FROM
    -> (
    -> (
    -> order_main AS om
    -> INNER JOIN
    -> order_desc AS od
    -> ON
    -> om.po_id = od.po_id
    -> )
    -> INNER JOIN
    -> usr AS u
    -> ON
    -> om.user_id = u.user_id
    -> )
    -> INNER JOIN
    -> product AS p
    -> ON
    -> od.p_id = p.p_id
    -> WHERE
    -> om.delivery_date IS NULL
    -> ORDER BY
    -> om.order_date ASC, om.po_id ASC, od.p_id ASC
    -> ;
+------------+------------+------------+--------------+----------+--------+
| 発注日     | 注文コード | 利用者氏名 | 商品名       | 商品単価 | 購入数 |
+------------+------------+------------+--------------+----------+--------+
| 2012-12-22 |         19 | 森本絵里   | 赤ボールペン |      100 |    100 |
| 2012-12-25 |         20 | 西島文子   | 電卓         |      600 |     10 |
+------------+------------+------------+--------------+----------+--------+
2 rows in set (0.03 sec)