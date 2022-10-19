-- Data Quality Issues

-- Reveals several items having the same barcodes, but different brandCodes, categorys, showing what appear to be totally different products.
select
	*
from
	brands_raw
where
	barcode in(
	select
		barcode
	from
		brands_raw
	group by
		barcode
	having
		count(barcode) > 1)
order by
	barcode
;

-- Shows several category names that do not have an associated categoryCode. This can make it difficult to make a lookup table for categories, given the "category" field is a string, often with special characters.
select
	*
from
	brands_raw
where
	category is not null
	and categoryCode is null
;

-- Searching the JSON string rewardsReceiptItemList shows many item list arrays have no barcode key/value pair. This will make it difficult to know exactly what the item is to match it up with a brand.
select
	_id,
	case
		when rewardsReceiptItemList like '%barcode%' then '1'
		else '0'
	end
from
	receipts_raw
	;