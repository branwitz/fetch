-- Which brand has the most spend among users who were created within the past 6 months?
-- Which brand has the most transactions among users who were created within the past 6 months?
select b.brandName, COUNT(r.receiptId), SUM(ri.finalPrice) from receipts r
join users u on r.userId = u.userId
join receipt_items ri on r.receiptId = ri.receiptId
join brand_barcode bb on ri.barcode = bb.barcode
join brands b on bb.brandCode = b.brandCode 
where u.createdDate > date_sub(curdate(), interval 6 month)
group by b.brandName ;