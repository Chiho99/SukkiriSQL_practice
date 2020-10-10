-- 1
SELECT 価格 * (SELECT SUM(レンタル日数)
                FROM レンタル
              WHERE 車種コード = 'E01') AS 金額
FROM 料金
WHERE 車種コード = 'E01'
-- E01のレンタル日数
-- E01のレンタル料金


-- 2
SELECT 車種コード, 車種名
FROM 料金
WHERE 車種コード IN (SELECT 車種コード FROM レンタル
                    WHERE レンタル日数 > 1)
ORDER BY 車種コード
-- レンタル日数が1日より多いレンタカーの車種コード
-- レンタル日数が1日より多いレンタカーの車種コードと車種名

-- 3
SELECT SUM(SUB.日数) AS 合計日数,
        COUNT(SUB.車種コード) AS 車種数
FROM (SELECT 車種コード, SUM(レンタル日数) AS 日数
        FROM レンタル
        GROUP BY 車種コード) AS SUB
-- 車種コードとレンタル日数の合計
-- 合計日数, 車種コードの種類