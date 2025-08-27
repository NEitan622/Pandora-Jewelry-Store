--הוספת עמודה
Alter table [dbo].[orders]
Add isPay bit not null
--הוספת אילוץ לעמודה  unique email
Alter table  [dbo].[customers]
Add constraint
UK unique ([email])
-- מחיקת עמודה
--ALTER TABLE [order_details]
--DROP column [date]
-- מחיקה עמודה עם אילוץ
--לא עבד
--ALTER TABLE [orders]
--DROP column [company_id]
--alter table [orders]
--alter column [company_id]
--drop  Foreign key 
