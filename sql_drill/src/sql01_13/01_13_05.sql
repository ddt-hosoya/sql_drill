■問題
以下は社員テーブル（employee）から社員名（氏＋名を連結したもの）、
役職クラス（部長、課長は管理職、主任、担当は総合職、アシスタントは一般職とします）を出力するためのSQL命令ですが、
２つ誤りがあります。誤りを指摘してください。
SELECT
	CONCAT(l_name, f_name),
	CASE
		WHERE class IN ('部長','課長') THEN '管理職'
		WHERE class IN ('主任','担当') THEN '総合職'
		ELSE THEN '一般職'
	END AS 役職クラス
FROM
	employee
;
■回答・実行文
指摘①別名をつけるためCONCAT(l_name, f_name)の後ろにAS 社員名が必要
指摘②CASE文の条件式の前はWHEREではなくWHENで、ELSEの後ろのTHENは不要

# 社員名（氏＋名を連結したもの）と役職クラス（部長、課長は管理職、主任、担当は総合職、アシスタントは一般職）を出力
SELECT
	CONCAT(l_name, f_name) AS 社員名,
	CASE
		WHEN class IN ('部長','課長') THEN '管理職'
		WHEN class IN ('主任','担当') THEN '総合職'
		ELSE  '一般職'
	END AS 役職クラス
# 社員テーブルから取得
FROM
	employee
;

■返却値
mysql> SELECT
    -> CONCAT(l_name, f_name) AS 社員名,
    -> CASE
    -> WHEN class IN ('部長','課長') THEN '管理職'
    -> WHEN class IN ('主任','担当') THEN '総合職'
    -> ELSE  '一般職'
    -> END AS 役職クラス
    -> FROM
    -> employee
    -> ;
+------------+------------+
| 社員名     | 役職クラス |
+------------+------------+
| 相沢聡     | 管理職     |
| 大門一郎   | 総合職     |
| 藤井雄太   | 総合職     |
| 藤岡幸太郎 | 総合職     |
| 速水和幸   | 管理職     |
| 葉山俊輔   | 一般職     |
| 川口裕子   | 一般職     |
| 加藤昭雄   | 一般職     |
| 神田佐知子 | 一般職     |
| 木村一郎   | 総合職     |
| 中澤康代   | 一般職     |
| 西雄一     | 一般職     |
| 新渡戸康治 | 一般職     |
| 野上利江   | 一般職     |
| 佐藤智子   | 管理職     |
| 妹尾春樹   | 管理職     |
| 清水春子   | 総合職     |
| 田中真由子 | 総合職     |
| 田辺正一   | 一般職     |
| 寺岡陽一   | 管理職     |
| 近田晃子   | 管理職     |
| 遠山真一   | 管理職     |
| 戸川よしみ | 総合職     |
| 津村知美   | 総合職     |
| 上田一也   | 管理職     |
| 山田奈美   | 管理職     |
+------------+------------+
26 rows in set (0.04 sec)