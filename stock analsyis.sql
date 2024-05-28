use stock;
/*1*/
/*Average Daily Trading Volume*/
SELECT Ticker, 
COUNT(*) AS TotalDaysTraded, SUM(Volume) AS TotalSharesTraded, AVG(Volume) AS AvgSharesTraded
FROM synthetic_stock_data
GROUP BY Ticker;

/*2*/
/*Most Volatile Stocks*/
SELECT Ticker, avg(Beta) as betavalue
FROM synthetic_stock_data
group by Ticker
ORDER BY Betavalue DESC
LIMIT 10;   

/*3*/
/*Stocks with Highest Dividend and Lowest Dividend*/
-- Stocks with the Highest Dividend and Lowest Dividend
SELECT Ticker, avg(DividendAmount) as dividendamount
FROM synthetic_stock_data
group by ticker
ORDER BY DividendAmount DESC; 


/*4*/
/*(a) Highest P/E Ratios and Lowest P/E Ratios*/
select Ticker,avg(PERatio ) as peratio
from synthetic_stock_data
group by Ticker
order by PERatio desc;

/*5*/
/*Stocks with Highest Market Cap*/
select Ticker,Avg(MarketCap) as marketcap
from synthetic_stock_data
group by Ticker
order by MarketCap desc;

/*6*/
/*Stocks Near 52 Week High*/
SELECT ticker, MAX(52WeekHigh) 
FROM synthetic_stock_data
WHERE Date_recorded >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR)
GROUP BY ticker;

/*7*/
/*Stocks Near 52 Week Low*/
SELECT ticker, min(52WeekHigh) 
FROM synthetic_stock_data
WHERE date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR)
GROUP BY ticker;

/*8*/
/*Stocks with Strong Buy Signals and stocks with Strong Selling Signal*/
SELECT RSI,Ticker
FROM synthetic_stock_data
WHERE 
    RSI < 45 OR -- Oversold market
    (RSI BETWEEN 45 AND 68) OR -- Neutral zone
    RSI >= 69;
    
SELECT MACD,Ticker
FROM  synthetic_stock_data
WHERE MACD > 0 -- bullish
   OR MACD < 0;-- bearish