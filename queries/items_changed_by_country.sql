SELECT
  event_name AS eventName,
  (SELECT param.value.int_value FROM UNNEST(event_params) AS param WHERE param.key = 'item_id') AS itemId,
  AVG((SELECT param.value.int_value FROM UNNEST(event_params) AS param WHERE param.key = 'quantity')) AS quantityAverage,
  MIN((SELECT param.value.int_value FROM UNNEST(event_params) AS param WHERE param.key = 'quantity')) AS quantityMin,
  MAX((SELECT param.value.int_value FROM UNNEST(event_params) AS param WHERE param.key = 'quantity')) AS quantityMax,
  geo.country AS country,
  COUNT(event_name) AS count
FROM
  `analytics_452605918.events_*`
WHERE
  event_name IN ('item_modified')
  AND _TABLE_SUFFIX >= FORMAT_DATE("%Y%m%d", DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY))
GROUP BY
  eventName, itemId, country
ORDER BY
  count desc
