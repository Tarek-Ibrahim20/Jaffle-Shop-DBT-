select 
    order_id  , amount
from 
    {{ ref('stg_stripe__payments') }}
where
    amount < 0    
