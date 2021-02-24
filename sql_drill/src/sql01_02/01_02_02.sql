■問題
商品テーブル（product）から商品と単価を取り出してみましょう。以下の空欄を埋めてSQL命令を完成させてください。
SELECT
	[①空欄]
	[②空欄]
FROM
	product
;

■実行文

SELECT
	p_name,
	price
FROM
	product
;


■返却値
mysql> SELECT
    -> p_name,
    -> price
    -> FROM
    -> product
    -> ;
+--------------+-------+
| p_name       | price |
+--------------+-------+
| 電卓         |   600 |
| 椅子         | 10000 |
| マウスパッド |  1500 |
| 黒ボールペン |   100 |
| 赤ボールペン |   100 |
| トナー黒     |  1000 |
| トナー赤     |  1000 |
| 机           | 15000 |
+--------------+-------+
8 rows in set (0.00 sec)