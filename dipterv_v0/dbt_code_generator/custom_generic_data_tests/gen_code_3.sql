```sql
-- Test to check if the total_revenue in int_revenue_per_customer is equal to total_revenue in mart_customers
select
    irc.customer_id,
    irc.total_revenue as int_total_revenue,
    mc.total_revenue as mart_total_revenue
from int_revenue_per_customer irc
join mart_customers mc
on irc.customer_id = mc.customer_id
where irc.total_revenue <> mc.total_revenue
```