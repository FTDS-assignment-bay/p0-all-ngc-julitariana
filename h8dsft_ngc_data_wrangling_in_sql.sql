
SELECT
    EXTRACT(YEAR FROM PARSE_DATE('%Y%m%d', Filing_date)) AS year,
    EXTRACT(MONTH FROM PARSE_DATE('%Y%m%d', Filing_date)) AS month,
    COUNT(*) AS total_patents
FROM
    `patents-public-data.uspto_oce_cancer.publications`
WHERE
    PARSE_DATE('%Y%m%d', Filing_date) BETWEEN DATE('2012-01-01') AND DATE('2023-12-31')
    AND LOWER(Patent_Title) LIKE '%data mining%'
GROUP BY
    year, 
    month
ORDER BY
    year DESC,
    month ASC;
