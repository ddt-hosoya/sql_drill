■問題文
商品テーブル（product）上に商品名をキーとしたインデックスを作成してみましょう。インデックス名はind_productとします。

■実行文
# 商品テーブルにインデックスを作成する
CREATE INDEX
	ind_product
ON
	product
	# インデックスの対象となる列は商品名とする
	(
		p_name
	)
;

■返却値
mysql> # 商品テーブルにインデックスを作成する
mysql> CREATE INDEX
    -> ind_product
    -> ON
    -> product
    -> # インデックスの対象となる列は商品名とする
    -> (
    -> p_name
    -> )
    -> ;
Query OK, 0 rows affected (0.14 sec)
Records: 0  Duplicates: 0  Warnings: 0