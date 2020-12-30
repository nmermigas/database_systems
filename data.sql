USE DB52

INSERT INTO category VALUES('������')
INSERT INTO category VALUES('��������')
INSERT INTO category VALUES('�������������')

INSERT INTO product VALUES('�������','����',10,3.00,1)
INSERT INTO product VALUES('��������','��������',20,1.00,2)
INSERT INTO product VALUES('��������','�������',15,4.00,3)

INSERT INTO geo_area VALUES('�����',500000)
INSERT INTO geo_area VALUES('�������',100000)
INSERT INTO geo_area VALUES('������',78000)

INSERT INTO supplier VALUES(12345678956,'������������',6940724390,'�����','�����������',13,14122,1)
INSERT INTO supplier VALUES(98765432150,'���������������',6972639812,'������','����������',18,14154,3)
INSERT INTO supplier VALUES(96523147800,'�������',6989521475,'�������','�������',11,15140,2)

INSERT INTO supply VALUES(1,10,'�������','2020-10-27',1)
INSERT INTO supply VALUES(3,50,'��������','2020-10-27',2)
INSERT INTO supply VALUES(2,40,'��������','2020-10-27',3)


INSERT INTO customer VALUES('�������������',12365478963,6958456356,'������','������',12,15092,3)
INSERT INTO customer VALUES('�����������',12365474856,6958455236,'�������','����',19,13692,2)
INSERT INTO customer VALUES('�������������',12365421365,695845845,'������','������',18,13636,1)


INSERT INTO frequent_customer VALUES(2,50.70,200.00)
INSERT INTO frequent_customer VALUES(3,65.36,200.00)


INSERT INTO payment VALUES(2,50.00,'2020-10-29')
INSERT INTO payment VALUES(3,30.00,'2012-05-15')
INSERT INTO payment VALUES(2,62.00,'2012-10-04')
INSERT INTO payment VALUES(3,96.00,'2012-05-29')
INSERT INTO payment VALUES(3,70.00,'2012-05-12')
INSERT INTO payment VALUES(3,70.00,'2012-07-13')
INSERT INTO payment VALUES(3,60.00,'2012-07-30')
INSERT INTO payment VALUES(2,50.00,'2012-10-29')



INSERT INTO [order] VALUES('2013-01-15','2013-01-19',1)
INSERT INTO [order] VALUES('2013-01-10','2013-01-20',1)
INSERT INTO [order] VALUES('2013-01-09','2013-01-25',2)
INSERT INTO [order] VALUES('2013-02-15','2013-02-18',2)
INSERT INTO [order] VALUES('2013-01-15','2013-02-18',1)

/*DELETE 
FROM [order]
WHERE ordercode>6 */

INSERT INTO consistsof VALUES(3,2,5)
INSERT INTO consistsof VALUES(3,3,5)
INSERT INTO consistsof VALUES(4,1,3)
INSERT INTO consistsof VALUES(5,1,7)
INSERT INTO consistsof VALUES(6,3,9)
INSERT INTO consistsof VALUES(7,3,3000)



INSERT INTO [order] VALUES('2020-11-12', '2020-11-19',1)
INSERT INTO [order] VALUES('2020-11-14', '2020-11-21',2)
INSERT INTO [order] VALUES('2012-01-14', '2012-03-21',2)

INSERT INTO [order] VALUES('2012-11-12', '2012-11-19',3)
INSERT INTO [order] VALUES('2012-10-14', '2012-11-21',2)
INSERT INTO [order] VALUES('2012-03-14', '2012-03-21',2)
INSERT INTO [order] VALUES('2012-09-12', '2012-09-19',3)
INSERT INTO [order] VALUES('2012-07-14', '2012-07-21',3)
INSERT INTO [order] VALUES('2012-05-14', '2012-05-21',3)

INSERT INTO [order] VALUES('2011-11-12', '2012-11-19',3)
INSERT INTO [order] VALUES('2011-10-14', '2011-11-21',2)
INSERT INTO [order] VALUES('2011-10-14', '2011-03-21',3)
INSERT INTO [order] VALUES('2011-04-12', '2011-09-19',2)
INSERT INTO [order] VALUES('2011-08-14', '2011-07-21',1)
INSERT INTO [order] VALUES('2011-06-14', '2011-05-21',1)
INSERT INTO [order] VALUES('2011-11-14', '2011-11-21',1)
INSERT INTO [order] VALUES('2011-03-14', '2011-03-21',1)
INSERT INTO [order] VALUES('2011-05-16', '2011-05-21',2)
INSERT INTO [order] VALUES('2011-07-14', '2011-07-21',1)

INSERT INTO [order] VALUES('2012-01-14','2012-01-16',2)
INSERT INTO [order] VALUES('2012-01-16','2012-01-18',1)

INSERT INTO consistsof VALUES(25,3,31)
INSERT INTO consistsof VALUES(26,2,10)

INSERT INTO [order] VALUES('2012-03-19','2012-03-25',3)
INSERT INTO consistsof VALUES(27,2,21)

INSERT INTO [order] VALUES('2012-02-19','2012-02-25',1)
INSERT INTO [order] VALUES('2012-02-19','2012-02-25',3)

INSERT INTO [order] VALUES('2012-04-19','2012-04-27',2)
INSERT INTO [order] VALUES('2012-04-19','2012-04-25',3)

INSERT INTO [order] VALUES('2012-06-19','2012-06-24',2)
INSERT INTO [order] VALUES('2012-06-19','2012-06-22',1)

INSERT INTO [order] VALUES('2012-08-14','2012-08-22',1)
INSERT INTO [order] VALUES('2012-08-22','2012-08-28',2)

INSERT INTO [order] VALUES('2012-12-11','2012-12-28',1)
INSERT INTO [order] VALUES('2012-12-19','2012-12-22',2)

INSERT INTO consistsof VALUES(28,1,24)
INSERT INTO consistsof VALUES(29,2,14)
INSERT INTO consistsof VALUES(30,3,51)
INSERT INTO consistsof VALUES(31,1,87)
INSERT INTO consistsof VALUES(32,2,10)
INSERT INTO consistsof VALUES(33,3,36)
INSERT INTO consistsof VALUES(34,1,79)
INSERT INTO consistsof VALUES(35,2,52)
INSERT INTO consistsof VALUES(36,3,74)
INSERT INTO consistsof VALUES(37,2,21)













INSERT INTO consistsof VALUES(9,1,6)
INSERT INTO consistsof VALUES(10,3,85)
INSERT INTO consistsof VALUES(11,1,36)
INSERT INTO consistsof VALUES(12,2,78)
INSERT INTO consistsof VALUES(13,3,25)
INSERT INTO consistsof VALUES(14,2,7)
INSERT INTO consistsof VALUES(15,2,63)
INSERT INTO consistsof VALUES(16,3,15)
INSERT INTO consistsof VALUES(17,1,3)
INSERT INTO consistsof VALUES(18,2,5)
INSERT INTO consistsof VALUES(19,2,10)
INSERT INTO consistsof VALUES(20,1,3)
INSERT INTO consistsof VALUES(21,2,60)
INSERT INTO consistsof VALUES(22,1,10)
INSERT INTO consistsof VALUES(23,2,60)
INSERT INTO consistsof VALUES(24,3,23)




INSERT INTO consistsof VALUES(1,1,5)
INSERT INTO consistsof VALUES(2,3,10)
INSERT INTO consistsof VALUES(8,1,3)



INSERT INTO supplier VALUES(78935412014,'�����������',6989321455,'�����','������',19,14899,1)
INSERT INTO supplier VALUES(78952140364,'����������',6958452106,'�����','����',58,14865,1)

INSERT INTO supplier VALUES(41256301478,'����������',6957896548,'�������','����',58,15236,2)

INSERT INTO supply VALUES(4,25,'�������','2020-12-30',1)
INSERT INTO supply VALUES(5,32,'�������','2020-12-07',1)

INSERT INTO supply VALUES(6,32,'�������','2020-12-07',1)
DELETE
FROM supply 
WHERE suppliercode = 6
INSERT INTO supply VALUES(2,32,'��������','2020-12-07',3)
INSERT INTO supply VALUES(6,59,'��������','2020-12-07',3)




INSERT INTO product VALUES('����','�������',15,4.00,1)
INSERT INTO product VALUES('��������','�������',30,2.50,1)

INSERT INTO supply VALUES(4,236,'����','2020-05-30',4)
INSERT INTO supply VALUES(1,100,'����','2020-07-30',4)
INSERT INTO supply VALUES(5,52,'����','2020-08-30',4)

INSERT INTO supply VALUES(5,52,'����','2020-08-30',5)

INSERT INTO [order] VALUES('2012-12-19','2012-12-22',2)
INSERT INTO [order] VALUES('2012-12-19','2012-12-22',3)

INSERT INTO consistsof VALUES(38,1,3)
INSERT INTO consistsof VALUES(38,4,3)
INSERT INTO consistsof VALUES(38,5,3)
INSERT INTO consistsof VALUES(38,2,3)

INSERT INTO consistsof VALUES(39,1,3)
INSERT INTO consistsof VALUES(39,2,3)
INSERT INTO consistsof VALUES(39,3,3)
INSERT INTO consistsof VALUES(39,4,3)
INSERT INTO consistsof VALUES(39,5,3)


INSERT INTO [order] VALUES('2012-12-19','2012-12-22',3)
INSERT INTO consistsof VALUES(40,2,5000)


INSERT INTO [order] VALUES('2013-01-25','2013-01-29',3)
INSERT INTO consistsof VALUES(41,4,5000)

INSERT INTO [order] VALUES('2013-01-27','2013-01-29',2)
INSERT INTO consistsof VALUES(42,3,2500)










SELECT * FROM supplier
SELECT * FROM supply
SELECT * FROM product
SELECT * FROM category
SELECT * FROM geo_area
SELECT * FROM frequent_customer
SELECT * FROM customer
SELECT * FROM product
SELECT * FROM [order]  /*(WHERE (DATEPART(month,orderdate)=6) AND DATEPART(year,orderdate)=2012 */
SELECT * FROM consistsof
SELECT * FROM payment








