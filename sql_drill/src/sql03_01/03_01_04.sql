■問題文
以下は、商品テーブル（product）に対して、表のデータを挿入するためのSQL命令ですが、2点誤りがあります。誤りを指摘してください。
--------------------------------------
【挿入対象のデータ】
項目	：	値
商品コード	：	SB00000001
商品名	：	黒スタンプ
単価	：	1250
--------------------------------------
INSERT
	product
VALUES
(
	SB00000001,
	黒スタンプ,
	1250
)
;
■実行文
指摘１：INSERTではなくINSERT INTOが正しい
指摘２：商品コードと商品名の値は文字列なのでシングルクォートで括る必要がある
# 商品テーブルにデータを挿入する
INSERT INTO
	product
# 挿入するデータの値は順に商品コード、商品名、単価
VALUES
(
	'SB00000001',
	'黒スタンプ',
	1250
)
;

■返却値
mysql> INSERT INTO
    -> product
    -> VALUES
    -> (
    -> 'SB00000001',
    -> '黒スタンプ',
    -> 1250
    -> )
    -> ;
Query OK, 1 row affected (0.03 sec)

mysql> select * from product;
+------------+--------------+-------+
| p_id       | p_name       | price |
+------------+--------------+-------+
| DE00000001 | 電卓         |   600 |
| IS00000001 | 椅子         | 10000 |
| MA00000001 | マウスパッド |  1500 |
| PB00000001 | 黒ボールペン |   100 |
| PB00000002 | 赤ボールペン |   100 |
| SB00000001 | 黒スタンプ   |  1250 |
| TO00000001 | トナー黒     |  1000 |
| TO00000002 | トナー赤     |  1000 |
| TU00000001 | 机           | 15000 |
+------------+--------------+-------+
9 rows in set (0.00 sec)