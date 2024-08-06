SELECT
  event_name AS eventName,
  (SELECT param.value.int_value FROM UNNEST(event_params) AS param WHERE param.key = 'species_id') AS speciesId,
  (SELECT param.value.string_value FROM UNNEST(event_params) AS param WHERE param.key = 'species_name') AS speciesName,
  geo.country,
  COUNT(event_name) as count
FROM
  `analytics_452605918.events_*`
WHERE
  event_name IN ('pokemon_saved')
GROUP BY eventName, speciesId, speciesName, geo.country
ORDER BY
  event_name, count desc, speciesId;