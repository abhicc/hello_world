# Feature files

Upload feature(s) in zipped-up .csv files. Should include two files: one for
training set and one for test set; then zip into a single .zip file.
Only include your features, no other columns. Label your files as:
- **[username]_[description]_train.csv**
- **[username]_[description]_class.csv**

Then zip both of the above files into a .zip file named **[username]_[description].zip**:

```bash
mkdir temp
mv [username]_[description]_train.csv temp/
mv [username]_[description]_class.csv temp/
cd temp
zip [username]_[description].zip *.csv
```

For example, the files for several features related to orders and sizeCode would look like this:

**epwalsh_orderVsSize_train.csv**:

| repeatOrderSameSize | sameProductDiffSize |
| ------------------- | ------------------- |
| 0 | 0 |
| 0 | 0 |
| 1 | 0 |
| 0 | 1 |
| ... | ... |

**epwalsh_orderVsSize_class.csv**:

| repeatOrderSameSize | sameProductDiffSize |
| ------------------- | ------------------- |
| 0 | 1 |
| 0 | 1 |
| 0 | 0 |
| 0 | 0 |
| ... | ... |

Feel free to put all your numeric or categorical features together into a single file for the training set and a 
single file for classification set. Put numeric features in the folder ```numeric/``` and categorical features in 
the folder ```categorical/```, then add a description of your features to the table below.

:exclamation: **Note: the rows in your feature files should match up exactly with the rows in the raw data**

## Feature descriptions

| filename | feature | type | NA  | description | 
| -------- | ------- | ---- | --- | ----------- |
| epwalsh_orders.zip | repeatOrderSameSize | num | No | Has this user ordered this articleID in the same size at another time? (1 for yes, 0 for no) |
| epwalsh_orders.zip | sameArticleDiffSize | num | No | Does this order contain another item with the same articleID but a different sizeCode? (1 for yes, 0 for no) |
| epwalsh_orders.zip | sameProductDiffSize | num | No | Does this order contain another item with the same productGroup but a different sizeCode? (1 for yes, 0 for no) |
| epwalsh_orders.zip | sameArticleDiffColor | num | No | Does this order contain another item with the same articleID but a different color? |
| haozhe_returnCustomer.zip | return_customer | num | No | Has this customer appeared in both train and class dataset? (1 for yes, 0 for no) |
| mxjki_quantity.zip | total_quantity_per_order / article / customer | num | No | Total quantities for each order/article/customer |
| epwalsh_basics.zip | dow | cat | No | Day of the week |
| epwalsh_basics.zip | week | cat | No | Week in year |
| epwalsh_basics.zip | month | cat | No | Month in year |
| epwalsh_basics.zip | - | cat | No | All categorical features from the raw data |
| epwalsh_basics.zip | - | num | Yes | All numeric features from raw data |
| mxjki_color.zip | - | num | Yes | mean/median/var_colorCode_per_order/article/customer |
| mjohny_discountProp.zip | discountProp | num | Yes | Proportion of rrp paid (for price_unit).|
| mxjki_device.zip | - | num | Yes | mean/median/var_deviceID_per_order/article/customer |
|rodrigoplazola_priceVouchAmou.zip | - | num | Yes | price-voucherAmount |
| mxjki_date.zip | - | cat | No | Day of the month/year|
| mxjki_date.zip | - | num | No | Total days, interval by customer/article(-1 means starting point.) |
| haozhe_businessCustomer.zip | businessCustomer | cat | No |The customer is classified as business customer (=1) if the total quantity is larger than 100; otherwise, the customer is classified as private customer (=0). |
| haozhe_businessCustomer2.zip | businessCustomer2 | cat | No |The customer is classified as private customer (=0) if the quantity for any articleID is less than 15; otherwise, the customer is classified as business customer (=1). |
| qili_voucherAmount_rrp_price.zip | discounts_larger_than_voncher | cat | Yes |View the rrp subtract price as the actual discounts, take value to 1 if discounts is larger than voncherAmount, I also think the ratio between voncher and discounts as well as rrp should be something interesting|
| rodrigoplazola_unpr_min_avgp.zip| - | num | Yes | unit price - avg price per articleID |
| hejian_sale_for_each_orderID_articleID.zip | - | cat | Yes | unit_price/rrp and round them to be two digits, if rrp=0 set sale=0|
| hejian_percentage_numeric_voucheramount_each_orderID.zip | - | Num | Yes |  Consider voucheramong/total price as copon off and also consider the numeric voucheramont|
| mjohny_discountPropRound.zip | discountPropRound | num | Yes | Proportion of rrp paid (for price_unit) rounded to 2 decimals. May be more useful for grouping same discounts than previous version "discountProp". |
| hejian_difference_price_orderID.zip | - | Num | No |  I use the total price substract the voucheramong per order|
| hejian_pattern_color_size_orderID__productGroup.zip | - | cat | No |  I use char "a_b" to denote in each order and productgroup, the unique color and unique size are a and b respectively|
| j23414_runningTotals.zip | runningTotalItems | num | No | Running total number of items purchased by a particular customer across combined train and class data |
| j23414_runningTotals.zip | runningTotalOrders | num | No | Running total number of orders made by a particular customer across combined train and class data |
| j23414_runningTotals.zip | runningTotalVoucherAmount | num | No | Running total value of Vouchers used by a particular customer across combined train and class data |
| epwalsh_customerBehavior.zip | time_bewteen2 | num | No | Days between customer orders, for new customers we use maxtime + 1 |
| epwalsh_customerBehavior.zip | mean_time_between | num | No | Mean time between orders - maxtime + 1 for new 1-time visit customers |
| epwalsh_customerBehavior.zip | customer_mean/std/median_price/rrp/voucherAmount | num | No | self explanatory, std NA's filled with 0, mean/median filled with mean of column |
| epwalsh_customerBehavior.zip | customer_orders | num | No | total number of orders per customer |
| epwalsh_price.zip | max/min/mean/median_price_per_size/color/product/article | num | No | self-explanatory |
| epwalsh_counts.zip | customer_size/color/product/article_counts | num | No | total number of unique articles, products, colors, sizes per customer |
| mxjki_ordernum.zip | ordernum_by_orderDate/customerID/deviceID/voucherID | num | No | Ordernum by orderDate/customerID/deviceID/voucherID |
| mxjki_holidays.zip | is_legalholidays/is_generalholidays/is_allholidays | num | No | Whether the orderData is legal holidays/general holidays/all holidays or not |
| mjohny_freqVariables.zip | freqSizeCode/ColorCode/ArticleID/ProductGroup| num | No | frequency each unique size/color/article/product appears in train+class |
| epwalsh_quantity.zip | quantity_per_customer/article/size/color/product | num | No | Total quantity counts |
| epwalsh_quantity.zip | customer_size/color/product/article_quantity | num | No | Total quantities of sizes, colors, products, article per customer |
| epwalsh_quantity.zip | customer_order_size/color/article/product_prop | num | No | quantity / customer_size/color/product/article_quantity, NA's filled with 0 |
| epwalsh_orders.zip | unique_sizes/colors/articles/products_per_order | num | No | Number of unique sizes/articles/colors/products per order |
| epwalsh_orders.zip | articleVs[Size/Color]_per_order | num | No | # unique articles - # unique sizes / colors per order |
| epwalsh_orders.zip | articleVsProduct_per_order | num | No | # unique articles - # unique products per order |
| epwalsh_orders.zip | productVs[Size/Color]_per_order | num | No | # unique products - # unique sizes / colors per order |
| haozhe_clustOrder2.zip | Cluster assignments | cat | No | The number of clusters is 2. All the orders are clustered based on the customer behaviours |
| haozhe_clustOrder3.zip | Cluster assignments | cat | No | The number of clusters is 3. All the orders are clustered based on the customer behaviours |
| haozhe_clustOrder4.zip | Cluster assignments | cat | No | The number of clusters is 4. All the orders are clustered based on the customer behaviours |
| haozhe_clustOrder5.zip | Cluster assignments | cat | No | The number of clusters is 5. All the orders are clustered based on the customer behaviours |
| haozhe_clustOrder6.zip | Cluster assignments | cat | No | The number of clusters is 6. All the orders are clustered based on the customer behaviours |
| keguoh_SizeNum.zip | Num Size & Extreme size | Num | No | values from -1 to 1 (A=I=0); consider -1 and 1 as extreme sizes
| keguoh_totals.zip | - | num | No | total price/rrp/voucherAmount per customer/articleID/orderID/colorcode/productGroup, NA made to 0|
| rodrigoplazola_tot_money.spent_cluster 2.zip | Cluster assignments | cat | No | The number of clusters is 2. All the orders are clustered based on the total "money" spent by customer |
| rodrigoplazola_tot_money.spent_cluster 3.zip | Cluster assignments | cat | No | The number of clusters is 3. All the orders are clustered based on the total "money" spent by customer |
| LiXinyi_IsWeekendChristmas.zip | IsWeekend/IsChristmas | num | No | Indicator of Weekend / Christmas of orderDate |
| haozhe_businessCustomer3.zip | businessCustomer3 | cat | No |The customer is classified as private customer (=0) if the totalPrice is less than 95% quantile; otherwise, the customer is classified as business customer (=1). |
|Heliang_total.ArticleID.productGroup.per.order.zip| Number Of Different Kinds AriticalID & porductGroup Per Order| Num |No |How many different kinds of ariticleID or productGroup per oder|
|Heliang_Is.Holidays.zip|Is the date belong to official holidays or any holidays| Num | No | There are 18 official holidays and total 79 holidays |
| mxjki_voucheramount.zip | articlenum_by_order/voucheramount_avg/price_avg | num | No |  |
| rodrigoplazola_vou_per_ord_min_avg.zip |- | Num | Yes |Tot. Voucher amount per order minus the avg. voucher amount (avg calculated using the combined data set) |
| rodrigoplazola_vou_per_art_min_avg.zip |- | Num | Yes |Tot. Voucher amount per articleID minus the avg. voucher amount by article (avg calculated using the combined data set) |
| rodrigoplazola_vou_per_art_min_avg.zip |- | Num | Yes |Same as above but now per customer |
| rodrigoplazola_Total.price_per_order.minus_avg_price-per.order.zip |- | Num | No |Total price per order minus avg price per order |
|rodrigoplazola_total.price_day.zip |sum price per day | Num | No |Total price (sales) per day |
|rodrigoplazola_total.voucher_amo.per.day.zip |sum voucher amount per day | Num | No |Total voucher amount per day |
|rodrigoplazola_total.custo_per.day.zip | # of different customers per day | Num | No |Total number of different customers per day |
|rodrigoplazola_total.art_per.day.zip | # of different articles per day | Num | No |Total number of different articles per day |
| keguoh_paymentMethod_per_customer.zip | total number of paymentMethod for each customer | Num(Cat) | No | This can also be used as a CATEGORICAL variable to group customers by their # of paymentMethods |
| keguoh_SizeGroup.zip | different size measure types | Cat | No | A and I belong to two separate categories |
| haozhe_TimeArticleIDfirstday.zip |Time since articleID first appeared | Num | No | Time (in days) since articleID first appeared|
| LiXinyi_EndPriceRrp.zip | EndPrice/Endrrp | num | Yes | Ending of Price / rrp |
| mxjki_voucherAmount_five_summary.zip | min/Q1/median/Q3/max of voucherAmount by all/orderDate | num | No |  |
| mxjki_price_five_summary.zip | min/Q1/median/Q3/max of price by all/orderDate | num | No |  |
| hejian_voucherid_voucheramount_price_ratio.zip| - | Num | Yes | I group the data by voucher id and voucher amount, then i use the sum of rrp* quantity /sum of price|
| zl_colorlastthree.zip| Color | Cat| No | The last three digits of the color code.|
| zl_colorhundreddigit.zip| Color | Cat| No | The digit of the hundreds.|
| zl_colorlasttwodigit.zip| Color | Cat| No | The last two digits of color code.|
| zl_colorlastthreesum.zip| Color | Cat| No | The summation of the hundreds, tens and last digits. For example, if the last three digis is 123, then the result is 1+2+3=6.|
| keguo_n_quantity.zip | 1w/2w/1m/3m/6m | Num | No | total quantity in the past 1/2 weeks and 1/3/6 months for each customer
|mjohny_articleIDdigits.zip|articleID_last4/last3/last2/thousands/hundreds/tens/ones| Num| No | extracted last 4,3,2 digits of article ID. Also extracted thousands, hundreds, tens, and ones place of articleID |
|mjohny_voucherIDdigits.zip|voucherID_last3/last2/hundreds/tens/ones| Num| Yes | extracted last 3,2 digits of voucher ID. Also extracted hundreds, tens, and ones place of voucherID |
|mjohny_freqColorCodeDigits.zip|freqColorCode_last3/last2/hundreds/tens/ones| Num| No | frequency of times last 3,2 digits of colorCode appears. frequency of times hundreds, tens, and ones place of colorCode appears. calculated by combining train+class |
