use lx_acm14601;

#Question 1

SELECT date, sum(impressions) AS total_impressions FROM marketing_performance
	GROUP BY date
    ORDER BY date;

#Question 2
    
SELECT state, sum(revenue) AS total_revenue FROM website_revenue
	GROUP BY state
    ORDER BY total_revenue DESC
    LIMIT 3;
    
# The top 3 revenue generating states are New York, Georgia, and Ohio
# Ohio is the third-best revenue-earner with $37,577 in revenues

#Question 3

SELECT name, ROUND(sum(cost),2) AS total_cost, 
sum(impressions) AS total_impressions, 
sum(clicks) AS total_clicks, 
sum(revenue) AS total_revenue FROM campaign_info
	JOIN marketing_performance ON (campaign_info.id=marketing_performance.campaign_id)
    JOIN website_revenue ON (campaign_info.id=website_revenue.campaign_id)
    GROUP BY name
    ORDER BY name;

#Question 4

SELECT name, sum(conversions) AS total_conversions, state FROM campaign_info
	JOIN marketing_performance ON (campaign_info.id=marketing_performance.campaign_id)
	JOIN website_revenue ON (campaign_info.id=website_revenue.campaign_id)
	WHERE name="Campaign5"
	GROUP BY state
	ORDER BY total_conversions DESC;

#Georgia generated the most conversions for Campaign 5, with 3,342 total conversions

#Question 5

SELECT name, ROUND(sum(revenue/cost),2) AS efficiency FROM campaign_info
	JOIN marketing_performance ON (campaign_info.id=marketing_performance.campaign_id)
    JOIN website_revenue ON (campaign_info.id=website_revenue.campaign_id)
    GROUP BY name
	ORDER BY efficiency DESC;
    
/*In my opinion, Campaign 3 was the most efficient. To calculate efficiency,
I divided total revenue by total cost for each campaign. As seen in this output,
 Campaign 3 receives the highest efficiency rating, generating $3,284.57 in revenue
 for each dollar spent on marketing. Although costs were higher for this campaign,
 more revenues were generated to compensate for these costs.*/

#Question 6    
    
SELECT DAYNAME(website_revenue.date) AS day_of_week, ROUND(sum(revenue/cost),2) AS efficiency FROM website_revenue
JOIN marketing_performance ON (marketing_performance.date=website_revenue.date)
    GROUP BY day_of_week
    ORDER BY efficiency DESC;
    
/*Using the same efficiency metric from the previous question, I calculated the efficiency of running ads for 
each day of the week. As seen in the output, Thursday is the most efficient day to run ads, generating $291.79 in revenue
for each dollar spent. */