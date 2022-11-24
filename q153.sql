use sql_challenge;
create table ad_campaigns(
campaign_id int,
spend  int,
revenue int,
advertiser_id int);

-- Q153.Google marketing managers are analysing the performance of various advertising accounts over the
-- last month. They need your help to gather the relevant data.
-- Write a query to calculate the return on ad spend (ROAS) for each advertiser across all ad campaigns.
-- Round your answer to 2 decimal places, and order your output by the advertiser_id

select * from ad_campaigns;

select advertiser_id, round(sum(revenue)/sum(spend),2) as ROAS
from ad_campaigns
group by advertiser_id
order by advertiser_id;