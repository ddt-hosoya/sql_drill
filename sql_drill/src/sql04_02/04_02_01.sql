■問題文
貸し出し記録テーブル（rental）上に貸出日をキーにしたインデックスを作成してみましょう。
[空欄①]
	ind_rental
[空欄②]
	rental
	(
		[空欄③]
	)
;

■実行文
# 貸し出し記録テーブルにインデックスを作成する
CREATE INDEX
	ind_rental
ON
	rental
	# インデックスの対象となる列は貸出日とする
	(
		rental_date
	)
;
■返却値
mysql> # 貸し出し記録テーブルにインデックスを作成する
mysql> CREATE INDEX
    -> ind_rental
    -> ON
    -> rental
    -> # インデックスの対象となる列は貸出日とする
    -> (
    -> rental_date
    -> )
    -> ;
Query OK, 0 rows affected (0.13 sec)
Records: 0  Duplicates: 0  Warnings: 0