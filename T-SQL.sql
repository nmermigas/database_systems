/* 3� ���������*/

USE DB52

/* ������� 1

������ ��� stored procedure � ����� �� ������� ��� ������ ���� ����������� �������� ��� ��
������� ��� ������ ��� ������� �� ���� ��� ������� */

/*DROP PROCEDURE customersOfArea*/
CREATE PROCEDURE customersOfArea
	@geo_code int
AS
	SELECT COUNT(*) AS customerscount
	FROM customer
	WHERE geocode = @geo_code
	
EXECUTE customersOfArea  2

/* ������� 2

������ ��� stored procedure � ����� �� ������� ��� ������ ��������� ��� ��� ����������� ���
�� ������� ��� ��������� ��� ��������� ��� ���� ��� ���������� ����� ��� ��������� ���
�������� ������ ��� ��� ����������� (������� ����������, ��������, ����������).
��������������� �������� �������. */

DROP PROCEDURE suppliesBetweenDates

CREATE PROCEDURE suppliesBetweenDates 
(@pr_code INTEGER, @date1 DATE, @date2 DATE)
AS
BEGIN
DECLARE @pr_descr VARCHAR(50) , @supplycode INTEGER , @quantity INT , @shippingdate DATE
DECLARE CRS CURSOR
DYNAMIC GLOBAL FORWARD_ONLY 
FOR
SELECT P.[description], S.supplycode, S.quantity, S.shipping_date
FROM product AS P, supply AS S
WHERE S.shipping_date >= @date1 AND S.shipping_date <= @date2 AND S.productcode = @pr_code AND S.productcode = P.productcode
OPEN CRS
FETCH NEXT FROM CRS INTO @pr_descr, @supplycode, @quantity, @shippingdate
WHILE @@FETCH_STATUS = 0
	BEGIN 
	PRINT 'Description: ' + @pr_descr  
	PRINT 'Supply Code :' + CAST(@supplycode AS VARCHAR)
	PRINT'Quantity :' + CAST(@quantity AS VARCHAR)
	PRINT 'Shipping Date :' + CAST(@shippingdate AS VARCHAR)
	FETCH NEXT FROM CRS INTO @pr_descr, @supplycode, @quantity, @shippingdate
END

CLOSE CRS
DEALLOCATE CRS
END

EXECUTE suppliesBetweenDates 1, '2020-08-30', '2020-12-30'


/* ������� 3

������ ��� ��������� Java �� ����� ������� ��� �� ������ ��� ������ ��� ������ ���
������� �� ��� ���������. ��� ��� ����� ������ ������������ ������������, ��������� ��
������������ ��� �� ������� �� ��� ������ �������� (�����������, �.�.�.) */

SELECT * FROM [order] WHERE ordercode = 5

SELECT * FROM customer