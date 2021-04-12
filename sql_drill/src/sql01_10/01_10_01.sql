■問題
商品テーブル（product）からp_name,price列を価格が安い順に取り出してみましょう。
その際、p_nameに「商品名」price列に「価格」という別名をつけます。以下の空欄を埋めてSQL命令を完成させてください。

SELECT
	[空欄①],
	[空欄②]
FROM
	product
ORDER by
	price ASC
;

■実行文
# p_name列を商品名として、price列を価格として取得
SELECT
	p_name AS 商品名,
	price AS 価格
# 商品テーブルから取得
FROM
	product
# 価格が安い順に取得
ORDER by
	price ASC
;

■返却値
mysql> SELECT
    -> p_name AS 商品名,
    -> price AS 価格
    -> FROM
    -> product
    -> ORDER by
    -> price ASC
    -> ;
+--------------+-------+
| 商品名       | 価格  |
+--------------+-------+
| 黒ボールペン |   100 |
| 赤ボールペン |   100 |
| 電卓         |   600 |
| トナー黒     |  1000 |
| トナー赤     |  1000 |
| マウスパッド |  1500 |
| 椅子         | 10000 |
| 机           | 15000 |
+--------------+-------+
8 rows in set (0.03 sec)