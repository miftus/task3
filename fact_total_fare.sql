{{
  config(
    materialized='table'
  )
}}

    SELECT 
    Year_Date, Company, sum(fare) as Total_Fare
FROM
    {{ ref('chicago_taxi') }}
where 
Year_Date IS NOT NULL
AND Company IS NOT NULL
GROUP BY Year_Date, Company
ORDER BY Year_Date, Company