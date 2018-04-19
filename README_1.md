# Feature files

Upload feature(s) in zipped-up .csv files. Whereever applicable you should include two files: one for
training set (months October to January) and one for prediction set (February); then zip into a single .zip file.
Only include your features, no other columns. Label your files as:
- **[username]_[description]_train.csv**
- **[username]_[description]_class.csv**

Then zip both of the above files into a .zip file named **[username]_[description].zip**:

For example, if I generate a feature about brand of a product, the files would be
- **[abhicc]_[Brand]_train.csv**
- **[abhicc]_[Brand]_class.csv**
My zip file would be **[abhicc]_[Brand].zip**

If your feature(s) are (log) likelihood ratio, please use LLR for your description. For example, **brandLLR**

Feel free to put all your numeric or categorical (binary) features together into a single file for the training set and a 
single file for prediction set. Put numeric features in the folder ```numeric/``` and categorical features in 
the folder ```categorical/```, then add a description of your features to the table below.

:exclamation: **Note: the rows in your feature files should match up exactly with the rows in the raw data**

## Feature descriptions

| filename | feature | type | NA  | description | 
| -------- | ------- | ---- | --- | ----------- |
| 		   |         |      |     |             |
