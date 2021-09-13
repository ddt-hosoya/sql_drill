■問題文
以下は、著者情報テーブル（author）とユーザテーブル（usr）からそれぞれの氏名の情報を取り出すためのSQLですが、2点誤りがあります。
誤りを指摘してください。なお、統合したデータは重複を含まないものとし、結果は氏名（カナ）について降順で並べ替えます。
SELECT
	a.name_kana
FROM
	author AS a
UNION ALL
	SELECT
		u.l_name_kana,
		u.f_name_kana
	FROM
		usr AS u
ORDER BY
	1 DESC
;
■実行文
指摘１：UNION演算子によって結合される列の数は等しくなければならないのでユーザテーブルから取得するカラムはひとつに文字列結合等をする必要がある
指摘２：重複を含まない結合データを取得したいのでUNION ALLではなくUNIONとする必要がある

# 著者情報テーブルから氏名（カナ）を取得する
SELECT
	a.name_kana
FROM
	author AS a
# 著者情報テーブルから取得した氏名（カナ）とユーザテーブルから取得した氏名（カナ）を重複を省いて結合する
UNION
# ユーザテーブルから氏名（カナ）を取得する
	SELECT
		CONCAT(u.l_name_kana,	u.f_name_kana)
	FROM
		usr AS u
# 結合したデータの１列目である氏名（カナ）について降順で表示
ORDER BY
	1 DESC
;
■返却値
mysql> SELECT
    -> a.name_kana
    -> FROM
    -> author AS a
    -> UNION
    -> SELECT
    -> CONCAT(u.l_name_kana,u.f_name_kana)
    -> FROM
    -> usr AS u
    -> ORDER BY
    -> 1 DESC
    -> ;
+------------------+
| name_kana        |
+------------------+
| ワダシュウコ     |
| ヨシオカハルカ   |
| ヤマダヨシヒロ   |
| ヤマダタロウ     |
| ヤマダアイコ     |
| ヤグチアユミ     |
| モリモトエリ     |
| モリグチヤスオ   |
| ムライサチコ     |
| ミナミサエ       |
| マツモトヒロミ   |
| ネギシユウコ     |
| ニシジマフミコ   |
| タナカタロウ     |
| サトウイチロウ   |
| サカグチシュン   |
| コダマツヨシ     |
| クボタマモル     |
| キノシタカズキ   |
| カワナカトモキ   |
| カワイヤスハル   |
| オノユウジ       |
| エモトサトシ     |
| ウエハラコウイチ |
| イノウエイチロウ |
| アリヨシハルミ   |
| アリキマリ       |
+------------------+
27 rows in set (0.06 sec)