SELECT CONVERT(ROUND(MIN(plans.plan_value), 2), CHAR) AS faturamento_minimo,
	     CONVERT(ROUND(MAX(plans.plan_value), 2), CHAR) AS faturamento_maximo,
       CONVERT(ROUND(AVG(plans.plan_value), 2), CHAR) AS faturamento_medio,
	     CONVERT(ROUND(SUM(plans.plan_value), 2), CHAR) AS faturamento_total
FROM SpotifyClone.plans AS plans
INNER JOIN SpotifyClone.users AS users
ON users.id_plan = plans.id_plan;