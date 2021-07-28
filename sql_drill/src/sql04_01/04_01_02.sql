■問題文
注文明細テーブル（order_desc）を新規に作成してみましょう。以下の空欄を埋めて、SQL命令を完成させてください。
[空欄①]
	order_desc
	(
		po_id INT NOT NULL,
		p_id CHAR(10) NOT NULL,
		[空欄②],
		[空欄③] (po_id, p_id)
	)
;
■実行文
# 注文明細テーブルを作成する
CREATE TABLE
# 列定義を下記のとおりとする、主キーはpo_idとp_idとする
	order_desc
	(
		po_id INT NOT NULL,
		p_id CHAR(10) NOT NULL,
		quantity INT NOT NULL,
		PRIMARY KEY (po_id, p_id)
	)
;

■返却値
mysql> CREATE TABLE
    -> order_desc
    -> (
    -> po_id INT NOT NULL,
    -> p_id CHAR(10) NOT NULL,
    -> quantity INT NOT NULL,
    -> PRIMARY KEY (po_id, p_id)
    -> )
    -> ;
Query OK, 0 rows affected (0.15 sec)