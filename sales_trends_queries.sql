--count the number of refunds per month (non-null refund date) and calculate the refund rate
--refund rate is equal to the total number of refunds divided by the total number of orders
select date_trunc(orders.purchase_ts, month) as month,
    sum(case when refund_ts is not null then 1 else 0 end) as refunds,
    sum(case when refund_ts is not null then 1 else 0 end)/count(distinct orders.id) as refund_rate
from `elist-390902.elist.orders` orders
left join `elist-390902.elist.order_status` order_status
    on orders.id = order_status.order_id
group by 1
order by 1;

--count the number of refunds, filtered to 2021
--only include products with 'apple' in the name - use lowercase to account for any differences in capitalization
select date_trunc(order_status.refund_ts, month) as month,
    sum(case when order_status.refund_ts is not null then 1 else 0 end) as refunds
from `elist-390902.elist.orders` orders
left join `elist-390902.elist.order_status` order_status
    on orders.id = order_status.order_id
where extract(year from order_status.refund_ts) = 2021
and lower(product_name) like '%apple%'
group by 1
order by 1;

--count the number of refunds per month (non-null refund date) and calculate the refund rate
--refund rate is equal to the total number of refunds divided by the total number of orders
select date_trunc(orders.purchase_ts, month) as month,
    sum(case when refund_ts is not null then 1 else 0 end) as refunds,
    sum(case when refund_ts is not null then 1 else 0 end)/count(distinct orders.id) as refund_rate
from `elist-390902.elist.orders` orders
left join `elist-390902.elist.order_status` order_status
    on orders.id = order_status.order_id
group by 1
order by 1;

--count the number of refunds, filtered to 2021
--only include products with 'apple' in the name - use lowercase to account for any differences in capitalization
select date_trunc(order_status.refund_ts, month) as month,
    sum(case when order_status.refund_ts is not null then 1 else 0 end) as refunds
from `elist-390902.elist.orders` orders
left join `elist-390902.elist.order_status` order_status
    on orders.id = order_status.order_id
where extract(year from order_status.refund_ts) = 2021
and lower(product_name) like '%apple%'
group by 1
order by 1;
