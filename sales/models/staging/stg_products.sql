with

source as (

    select * from {{ source('iris', 'products') }}

),

renamed as (

    select

        ----------  ids
        sku as product_id,

        ---------- text
        name as product_name,
        type as product_type,
        description as product_description,


        ---------- numerics
        {{ cents_to_dollars('price') }} as product_price,

        ---------- booleans
        cast(coalesce(CASE WHEN type = 'jaffle' THEN '1' ELSE '0' END, '0') AS BIT) as is_food_item,

        cast(coalesce(CASE WHEN type = 'beverage' THEN '1' ELSE '0' END, '0') AS BIT) as is_drink_item

    from source

)

select * from renamed
