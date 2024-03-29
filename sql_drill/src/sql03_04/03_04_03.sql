■問題文
価格改定に伴い、商品テーブル（product）に登録されている全商品を10％値上げすることになりました。
対応するためのSQL命令を記述してみましょう。

■実行文
# 商品テーブルを更新する
UPDATE
	product
# 全商品の価格を１０％値上げした価格で更新する
SET
	price = price * 1.1
;


■確認
mysql> # 商品テーブルを更新する
mysql> UPDATE
    -> product
    -> # 全商品の価格を１０％値上げした価格で更新する
    -> SET
    -> price = price * 1.1
    -> ;
Query OK, 9 rows affected (0.06 sec)
Rows matched: 9  Changed: 9  Warnings: 0

【Before】
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
9 rows in set (0.02 sec)

【After】
mysql> select * from product;
+------------+--------------+-------+
| p_id       | p_name       | price |
+------------+--------------+-------+
| DE00000001 | 電卓         |   660 |
| IS00000001 | 椅子         | 11000 |
| MA00000001 | マウスパッド |  1650 |
| PB00000001 | 黒ボールペン |   110 |
| PB00000002 | 赤ボールペン |   110 |
| SB00000001 | 黒スタンプ   |  1375 |
| TO00000001 | トナー黒     |  1100 |
| TO00000002 | トナー赤     |  1100 |
| TU00000001 | 机           | 16500 |
+------------+--------------+-------+
9 rows in set (0.00 sec)