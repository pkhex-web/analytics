SELECT
  event_name AS eventName,
  (SELECT param.value.string_value FROM UNNEST(event_params) AS param WHERE param.key = 'version_name') AS versionName,
  geo.country AS country,
  COUNT(event_name) AS count
FROM
  `analytics_452605918.events_*`
WHERE
  event_name IN ('game_loaded')
  AND _TABLE_SUFFIX >= FORMAT_DATE("%Y%m%d", DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY))
GROUP BY
  eventName, versionName, geo.country
ORDER BY
  count desc;