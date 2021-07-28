■問題文
注文書テーブル（order_main）上に発注日、納品日をキーにした複合インデックスを作成してみましょう。
以下の空欄を埋めて、SQL命令を完成させてください。
[空欄①]
	ind_order
ON
	[空欄②]
	(
		[空欄③]
	)
;
■実行文
# 注文書テーブルにインデックスを作成する
CREATE INDEX
	ind_order
ON
	order_main
	# 発注日、納品日をキーにした複合インデックスを作成する
	(
		order_date, delivery_date
	)
;
■返却値
mysql> CREATE INDEX
    -> ind_order
    -> ON
    -> order_main
    -> (
    -> order_date, delivery_date
    -> )
    -> ;
Query OK, 0 rows affected (0.14 sec)
Records: 0  Duplicates: 0  Warnings: 0