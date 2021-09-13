■問題文
ユーザテーブル（usr）とアンケート回答テーブル（quest）、それぞれに登録されているユーザを氏名を比較し、
ユーザテーブル（usr）にしか登録されていないもののみ取り出してみましょう。
以下の空欄を埋めてSQL命令を完成させてください。
SELECT
	[空欄①]
FROM
	usr AS u
[空欄②]
	SELECT
		q.name
	FROM
		[空欄③]
;
■実行文
※問題文は「EXCEPT」を使用する場合の空欄になっているが、MySQLでExcept演算子が使用できないため、別の方法で取得する実行文を記載。
＃ ユーザテーブルから氏名を取得
SELECT
	CONCAT(u.l_name, u.f_name)
＃ ユーザテーブルから取得
FROM
	usr AS u
＃ 氏名を比較しアンケート回答テーブルに存在しない氏名を取得
WHERE
	NOT EXISTS
	(
	SELECT
		*
	FROM
		quest AS q
	WHERE
		CONCAT(u.l_name, u.f_name) = q.name
	)
;

■返却値
mysql> SELECT
    -> CONCAT(u.l_name, u.f_name)
    -> FROM
    -> usr AS u
    -> WHERE
    -> NOT EXISTS
    -> (
    -> SELECT
    -> *
    -> FROM
    -> quest AS q
    -> WHERE
    -> CONCAT(u.l_name, u.f_name) = q.name
    -> )
    -> ;
+----------------------------+
| CONCAT(u.l_name, u.f_name) |
+----------------------------+
| 井上一郎                   |
| 上原幸一                   |
| 江本聡                     |
| 小野雄二                   |
| 河合泰治                   |
| 木下一樹                   |
| 久保田守                   |
| 児玉毅                     |
| 坂口駿                     |
| 井上一郎                   |
| 矢口亜由美                 |
| 有木茉莉                   |
| 吉岡遥                     |
| 和田修子                   |
| 松本博美                   |
| 南沙恵                     |
| 村井佐知子                 |
| 森本絵里                   |
| 西島文子                   |
| 根岸裕子                   |
+----------------------------+
20 rows in set (0.04 sec)

※MySQLでEXCEPTが対応してないためエラー（問題文の空欄を正しく埋めた場合）
mysql> SELECT
    -> CONCAT(u.l_name, u.f_name)
    -> FROM
    -> usr AS u
    -> EXCEPT
    -> SELECT
    -> q.name
    -> FROM
    -> quest AS q;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'EXCEPT
SELECT
q.name
FROM
quest AS q' at line 5
mysql>


★★★PostgreSQLでの実行結果★★★
postgres=# SELECT
postgres-# CONCAT(u.l_name, u.f_name)
postgres-# FROM
postgres-# usr AS u
postgres-# EXCEPT ALL
postgres-# SELECT
postgres-# q.name
postgres-# FROM
postgres-# quest AS q;
   concat
------------
 村井佐知子
 児玉毅
 久保田守
 矢口亜由美
 根岸裕子
 河合泰治
 上原幸一
 江本聡
 木下一樹
 吉岡遥
 松本博美
 井上一郎
 井上一郎
 南沙恵
 西島文子
 坂口駿
 森本絵里
 小野雄二
 和田修子
 有木茉莉
(20 行)