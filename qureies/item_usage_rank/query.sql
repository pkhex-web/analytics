SELECT
  event_name,
  (SELECT param.value.int_value FROM UNNEST(event_params) AS param WHERE param.key = 'item_id') AS item_id,
  AVG((SELECT param.value.int_value FROM UNNEST(event_params) AS param WHERE param.key = 'quantity')) AS quantity_avg,
  MIN((SELECT param.value.int_value FROM UNNEST(event_params) AS param WHERE param.key = 'quantity')) AS quantity_min,
  MAX((SELECT param.value.int_value FROM UNNEST(event_params) AS param WHERE param.key = 'quantity')) AS quantity_max,
  COUNT(event_name) count
FROM
  `analytics_452605918.events_*`
WHERE
  event_name IN ('item_modified')
  AND _TABLE_SUFFIX >= FORMAT_DATE("%Y%m%d", DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY))
GROUP BY
  event_name, item_id
ORDER BY
  count desc
