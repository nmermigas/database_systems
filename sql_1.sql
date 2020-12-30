CREATE DATABASE DB52

USE DB52

/*������� 1 */
SELECT * FROM customer

/*������� 2 */
SELECT customercode, amount
FROM payment
WHERE payment_date >='2012-05-12' AND payment_date<='2012-05-22'

/*������� 3 */
SELECT O.orderdate,O.ordercode,C.productcode
FROM [order] AS O, consistsof AS C
ORDER BY O.ordercode

/*������� 4 */
UPDATE product
SET price = 1.03 * PRICE 
/*SELECT price FROM product*/

/*������� 5 */
SELECT DATEPART(month,payment_date) AS month, SUM(amount) AS SUM, AVG(amount) AS AVG
FROM payment
WHERE DATEPART(year, payment_date)=2012
GROUP BY DATEPART(month,payment_date)

/*������� 6 */

SELECT C.ssn,C.name
FROM customer C
WHERE 2500< ALL (SELECT SUM(CO.quantity * P.price)
				  FROM consistsof AS CO, product AS P, [order] AS O
				  WHERE P.productcode = CO.productcode AND
						O.customercode = C.customercode AND
						O.ordercode = CO.ordercode AND
						DATEPART(year,O.orderdate)=2013 AND
						DATEPART(month,O.orderdate)=1)


/*������� 7*/

SELECT CAT.categorycode, SUM(P.price * CO.quantity) AS TOTAL, O.customercode
FROM category AS CAT, customer AS CUS,consistsof AS CO, product AS P, [order] AS O
WHERE O.customercode = CUS.customercode AND CO.ordercode = O.ordercode AND P.productcode = CO.productcode AND P.categorycode = CAT.categorycode
GROUP BY O.customercode, CAT.categorycode


/*������� 8*/

/*����� �� ���� ��� ��� �������� ��� ���������� ������� ��� ���������*/

SELECT G.geocode,CAT.categorycode, AVG(P.price * CO.quantity) AS AVG
FROM geo_area AS G,product AS P, consistsof as CO, [order] as O, customer as C, category AS CAT
WHERE P.productcode = CO.productcode AND C.customercode = O.customercode AND O.ordercode = CO.ordercode AND C.geocode = G.geocode AND P.categorycode = CAT.categorycode
GROUP BY G.geocode, CAT.categorycode


/*������� 9

��� ���� ���� ��� 2012, ����� ��� ��������� �������� ��� ���� ��� ������� ��� ���������
������� �������� ��� 2012.*/

GO
CREATE VIEW SALES(month, total_sales ) AS
SELECT DATEPART(month,O.orderdate), SUM(P.price * CO.quantity)
FROM consistsof AS CO, product AS P, [order] AS O
WHERE DATEPART(year,O.orderdate)=2012 AND P.productcode = CO.productcode AND O.ordercode = CO.ordercode
GROUP BY DATEPART(month,O.orderdate)
GO

SELECT * FROM SALES

GO
CREATE VIEW YEAR_SALES(annual_sales) AS
SELECT  SUM(P.price * CO.quantity)
FROM consistsof AS CO, product AS P, [order] AS O
WHERE DATEPART(year,O.orderdate)=2012 AND P.productcode = CO.productcode AND O.ordercode = CO.ordercode
GO

SELECT * FROM YEAR_SALES

SELECT SALES.month, CAST(SALES.total_sales AS FLOAT)/CAST(YEAR_SALES.annual_sales AS FLOAT) AS PERCENTAGE_OF_ANNUAL_SALES
FROM SALES,YEAR_SALES


/* ������� 10

��� ���� ����, ������� ����� ������� ����� ���� ��� ����� ������ ���������� ��� �� ����
��� ��� ����.*/


DROP VIEW MONTH_AVG
GO
CREATE VIEW MONTH_AVG(year,month,monthly_avg) AS
SELECT DATEPART(year,O.orderdate),DATEPART(month,O.orderdate), AVG(P.price * CO.quantity)
FROM consistsof AS CO, product AS P, [order] AS O
WHERE P.productcode = CO.productcode AND O.ordercode = CO.ordercode
GROUP BY DATEPART(month,O.orderdate),DATEPART(year,O.orderdate)

SELECT * FROM MONTH_AVG

DROP VIEW MONTHLY_PURCHASES
GO
CREATE VIEW MONTHLY_PURCHASES(customercode,year,month,monthly_purchases_avg) AS
SELECT CU.customercode, DATEPART(year,O.orderdate),DATEPART(month,O.orderdate), AVG(P.price * CO.quantity)
FROM consistsof AS CO, product AS P, [order] AS O, customer AS CU
WHERE P.productcode = CO.productcode AND O.ordercode = CO.ordercode AND CU.customercode = O.customercode
GROUP BY DATEPART(month,O.orderdate),DATEPART(year,O.orderdate),CU.customercode

SELECT * FROM MONTHLY_PURCHASES

SELECT MONTH_AVG.month, MONTH_AVG.year, COUNT(*) as count
FROM MONTH_AVG AS month_avg, MONTHLY_PURCHASES AS monthly_purchases, customer AS CU
WHERE month_avg.monthly_avg <  monthly_purchases.monthly_purchases_avg AND month_avg.month = monthly_purchases.month AND CU.customercode = monthly_purchases.customercode
GROUP BY MONTH_AVG.month, MONTH_AVG.year

SELECT V3.month,V3.year, count(*) as custCount
FROM V3, V4
WHERE V3.month=V4.month AND V4.avgAmount > V3.avgAmount
GROUP BY V3.month,V3.year

/* ������� */


DROP VIEW V3,V4
GO
CREATE VIEW V3(month,year, avgAmount) AS
SELECT DATEPART(month, O.orderdate), DATEPART(year, O.orderdate) as year,
       AVG(P.price * ORD.quantity)
FROM Product AS P, [order] AS O, consistsof AS ORD, customer AS C
WHERE P.productcode = ORD.productcode AND O.ordercode=ORD.ordercode 
GROUP BY DATEPART(month,  O.orderDate),DATEPART(year, O.orderDate)

GO
CREATE VIEW V4(customercode, month,year, avgAmount) as
SELECT customercode, DATEPART(month, O.orderDate) AS Month,DATEPART(year, O.orderDate) as year,
       AVG(P.price * ORD.quantity) AS AVERAGE
FROM Product AS P, [order] AS O, consistsof AS ORD
WHERE P.productcode = ORD.productcode AND O.ordercode=ORD.ordercode 
GROUP BY customercode, DATEPART(month, O.orderDate),DATEPART(year, O.orderDate)

SELECT V3.month,V3.year, count(*) as custCount
FROM V3, V4
WHERE V3.month=V4.month AND V4.avgAmount > V3.avgAmount
GROUP BY V3.month,V3.year


/*������� 11
��� ���� ���� ��� 2012, �������� ��� ��������� �������� ��� ���� �� ����� �� ��� ����������
���� ��� 2011 (��� �������).*/

GO
CREATE VIEW SALES2012(month, total_sales ) AS
SELECT DATEPART(month,O.orderdate), SUM(P.price * CO.quantity)
FROM consistsof AS CO, product AS P, [order] AS O
WHERE DATEPART(year,O.orderdate)=2012 AND P.productcode = CO.productcode AND O.ordercode = CO.ordercode
GROUP BY DATEPART(month,O.orderdate)

GO
CREATE VIEW SALES2011(month, total_sales ) AS
SELECT DATEPART(month,O.orderdate), SUM(P.price * CO.quantity)
FROM consistsof AS CO, product AS P, [order] AS O
WHERE DATEPART(year,O.orderdate)=2011 AND P.productcode = CO.productcode AND O.ordercode = CO.ordercode
GROUP BY DATEPART(month,O.orderdate)
GO

SELECT SALES2012.month, SALES2012.total_sales AS sales2012, SALES2011.total_sales AS sales2011,((SALES2012.total_sales - SALES2011.total_sales) / SALES2011.total_sales) *100 as sales2012_compared_to_sales2011
FROM SALES2012 LEFT JOIN SALES2011
ON SALES2011.month = SALES2012.month AND SALES2011.total_sales<>0

UPDATE SALES2011
SET total_sales = 0 
WHERE total_sales = NULL

SELECT * FROM SALES2011
SELECT * FROM SALES2012

DROP VIEW SALES2011,SALES2012


/*������� 12
����� ��� ���� ���� ��� 2012, �� ���� ��� �������� ����� ��� ���� ��� �� ���� ���
�������� ���� ���� ����� ��� ����������� �����. */

DROP VIEW AVG_SALES_2012

CREATE VIEW AVG_SALES_2012(month, avg_sales) AS
SELECT DATEPART(month,O.orderdate), AVG(P.price * CO.quantity)
FROM consistsof AS CO, product AS P, [order] AS O, SALES2012
WHERE DATEPART(year,O.orderdate)=2012 AND P.productcode = CO.productcode AND O.ordercode = CO.ordercode
GROUP BY DATEPART(month,O.orderdate)

GO

SELECT * FROM AVG_SALES_2012


SELECT * FROM SALES2012 

/* ����� ���� ��� ����� ���� */
SELECT AVG1.month AS month, AVG1.avg_sales AS AVG_CURRENT_MONTH,AVG(AVG2.avg_sales) AS PREVIOUS_AVG
FROM AVG_SALES_2012 AS AVG1 LEFT JOIN AVG_SALES_2012 AS AVG2
ON AVG2.month < AVG1.month
GROUP BY AVG1.month,AVG1.avg_sales

/* ����� ���� ��������� �������� */
SELECT AVG1.month AS month, AVG1.avg_sales AS AVG_CURRENT_MONTH,AVG(SALES2012.total_sales) AS PREVIOUS_AVG
FROM AVG_SALES_2012 AS AVG1 LEFT JOIN SALES2012 
ON SALES2012.month < AVG1.month
GROUP BY AVG1.month,AVG1.avg_sales



/*������� 13

����� ���� �������� ��� ��������� ��� ���� �� ����������� ���� ����������� ��� ��� ����
���������� �������.*/

SELECT DISTINCT P.productcode
FROM product AS P, supplier AS supplier1, supply AS supply1
WHERE P.productcode = supply1.productcode AND supply1.suppliercode = supplier1.suppliercode AND supplier1.geocode = ALL ( SELECT geocode
																														  FROM supplier AS supplier2,supply as supply2
																														  WHERE supplier2.suppliercode <> supplier1.suppliercode
																														  AND supply2.suppliercode = supplier2.suppliercode
																														  AND supply1.productcode =supply2.productcode)
