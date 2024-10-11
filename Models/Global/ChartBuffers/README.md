Why we develope this class instead of using Series of mql5 as CiOpen is that in time series classes with each command to getting data , class copies the data from schratch to given array, 
while here we just passing array itself everywhere.
also the indexing proccess is much easier, consider that you have a unique index for each candle in specific time frame