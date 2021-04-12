■問題
貸出記録テーブル（rental）から未返却の書籍情報を貸出日について昇順で抽出してみましょう。
取得列はISBNコードと貸出日（YY/MM/DDの形式）、別名は「ISBNコード」「貸出日」とします。以下の空欄を埋めて、SQL命令を完成させてください。
SELECT
	isbn AS ISBNコード,
	[空欄①]
FROM
	rental
WHERE
	returned=0
[空欄②]
	rental_date ASC
;

■実行文
# ISBNコード、貸出日（YY/MM/DDの形式）を取得
SELECT
	isbn AS ISBNコード,
	DATE_FORMAT(rental_date, '%y/%m/%d') AS 貸出日
# 貸出記録テーブルから取得
FROM
	rental
# 未返却の場合のみ取得
WHERE
	returned=0
# 貸出日が古い順に取得
ORDER BY
	rental_date ASC
;

■返却値
mysql> SELECT
    -> isbn AS ISBNコード,
    -> DATE_FORMAT(rental_date, '%y/%m/%d') AS 貸出日
    -> FROM
    -> rental
    -> WHERE
    -> returned=0
    -> ORDER BY
    -> rental_date ASC
    -> ;
+---------------+----------+
| ISBNコード    | 貸出日   |
+---------------+----------+
| 4-8833-0000-2 | 12/02/22 |
| 4-0010-0000-0 | 12/03/20 |
| 4-0010-0000-0 | 12/06/14 |
| 4-8833-0000-2 | 12/12/10 |
| 4-8833-0000-3 | 12/12/22 |
| 4-0010-0000-9 | 12/12/27 |
| 4-7981-0959-2 | 13/01/12 |
| 4-7980-0945-8 | 13/01/14 |
| 4-0010-0000-1 | 13/03/10 |
| 4-8833-0000-1 | 13/03/16 |
+---------------+----------+
10 rows in set (0.00 sec)

