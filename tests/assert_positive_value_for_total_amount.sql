
SELECT order_id , SUM(AMOUNT) AS TOTAL_AMOUNT
FROM  {{ ref('stg_stripe__payments') }}
GROUP BY 1
Having TOTAL_AMOUNT < 0