--����� �����
Alter table [dbo].[orders]
Add isPay bit not null
--����� ����� ������  unique email
Alter table  [dbo].[customers]
Add constraint
UK unique ([email])
-- ����� �����
--ALTER TABLE [order_details]
--DROP column [date]
-- ����� ����� �� �����
--�� ���
--ALTER TABLE [orders]
--DROP column [company_id]
--alter table [orders]
--alter column [company_id]
--drop  Foreign key 
