■問題文
以下は、ユーザーテーブル（usr）に対して住所（都道府県、市町村、その他）で複合インデックスを作成するためのSQL命令ですが、
誤りが２点あります。誤りを指摘してください。
CREATE INDEX
	ind_usr
IN
	usr
	(
		prefecture
		city
		o_address
	)
;
■回答・実行文
指摘１：INではなくONが正しい
指摘２：インデックスとする列複数指定する箇所はカンマで区切る必要がある

# ユーザーテーブルにインデックスを作成する
CREATE INDEX
	ind_usr
ON
	usr
	# インデックスの対象となる列は都道府県、市町村、その他とする
	(
		prefecture,
		city,
		o_address
	)
;

■返却値
mysql> # ユーザーテーブルにインデックスを作成する
mysql> CREATE INDEX
    -> ind_usr
    -> ON
    -> usr
    -> # インデックスの対象となる列は都道府県、市町村、その他とする
    -> (
    -> prefecture,
    -> city,
    -> o_address
    -> )
    -> ;
Query OK, 0 rows affected (0.15 sec)
Records: 0  Duplicates: 0  Warnings: 0