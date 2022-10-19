Good afternoon,

After reviewing the data provided I had a few questions about it and some observations about how we can best utilize this data moving forward.

In the "brands" data, what does the cpg reference correlate with? I suspect we could use additional data there to resolve some of the data quality issues discovered.

Upon loading the data into a test database and running some queries, I discovered several entries in the brands data set have the same barcodes, but different brand codes and categories. This will make it difficult to associate products with the appropriate brands. Also, several items in the receipts item lists do not have a barcode associated with them, which will make it difficult to associate the items with descriptions, brands, etc.

If we are to move forward with using this data for analytics purposes I would need to know how we can most reliably associate items in receipt lists with brands, since in this set many barcode/brand code associations are missing. Looking into the "cpg" reference data would be a good place to start.

As far as performance and scaling concerns with this data, there seems to be a good amount of duplication between the brands data schema and receipts data schema. Some of the receipt item lists from the receipts data contain barcodes and brand codes, as do entries in the brands data. If possible we should determine where this data should reside between these schemas as a single source of truth.

Let me know what you think, thanks!

Brandon Witz