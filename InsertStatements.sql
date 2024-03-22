INSERT INTO [dbo].[tblGenDepartments]
       ([dptName]
       ,[dptShtName]
       ,[dptRmks]
       ,[dptActiveStatus]
       ,[dptCreationDate]
       ,[dptLastEditDate]
       ,[dptCreatedByUserIdfk]
       ,[dptEditedByUserIdfk])
VALUES 
       ('Human Resources', 'HR', 'Manages employee lifecycle', 1, GETDATE(), GETDATE(), 1, 1), 
       ('Finance', 'FIN', 'Handles accounting and budgeting', 1, GETDATE(), GETDATE(), 1, 1),
       ('Marketing', 'MKTG', 'Promotions, outreach, and branding', 1, GETDATE(), GETDATE(), 1, 1),
       ('Information Technology', 'IT', 'Manages technology infrastructure', 1, GETDATE(), GETDATE(), 1, 1),
       ('Operations', 'OPS', 'Handles core business processes', 1, GETDATE(), GETDATE(), 1, 1),
       ('Sales', 'SALES', 'Generates revenue', 1, GETDATE(), GETDATE(), 1, 1),
       ('Customer Support', 'CS', 'Provides post-sales assistance', 1, GETDATE(), GETDATE(), 1, 1),
       ('Research & Development', 'R&D', 'Innovation and new products', 1, GETDATE(), GETDATE(), 1, 1),
       ('Legal', 'LEGAL', null, 1, GETDATE(), GETDATE(), 1, 1),
       ('Executive', 'EXEC', 'Top-level leadership', 1, GETDATE(), GETDATE(), 1, 1);


INSERT INTO [dbo].[tblGenJobTitles]
      ([jbtName]
      ,[jbtShtName]
      ,[jbtRmks]
      ,[jbtActiveStatus]
      ,[jbtCreatedDate]
      ,[jbtLastEditDate]
      ,[jbtCreatedByUserIdfk]
      ,[jbtEditedByUserIdfk]
      ,[jbtDescription])
   VALUES
    ('Software Engineer', 'SWE', NULL, 1, GETDATE(), GETDATE(), 1, 1, 'Designs, develops, and tests software applications'),
    ('Product Manager', 'PM', NULL, 1, GETDATE(), GETDATE(), 1, 1, 'Defines product strategy and roadmaps'),
    ('Marketing Manager', 'MM', NULL, 1, GETDATE(), GETDATE(), 1, 1, 'Oversees marketing campaigns and promotions'), 
    ('Accountant', 'ACCT', NULL, 1, GETDATE(), GETDATE(), 1, 1, 'Handles financial reporting and analysis'),
    ('Sales Representative', 'SR', NULL, 1, GETDATE(), GETDATE(), 1, 1, 'Generates leads and closes deals'),
    ('HR Specialist', 'HRS', NULL, 1, GETDATE(), GETDATE(), 1, 1, 'Supports employee recruitment and onboarding'),
    ('IT Technician', 'ITT', NULL, 1, GETDATE(), GETDATE(), 1, 1, 'Provides technical support and troubleshooting'), 
    ('Customer Service Rep', 'CSR', NULL, 1, GETDATE(), GETDATE(), 1, 1, 'Assists customers with inquiries and issues'),
    ('Data Analyst', 'DA', NULL, 1, GETDATE(), GETDATE(), 1, 1, 'Analyzes data and generates insights'),
    ('Office Manager', 'OM', NULL, 1, GETDATE(), GETDATE(), 1, 1, 'Manages administrative functions');




INSERT INTO [dbo].[tblHrEmployees]
      ([empStaffNo]
      ,[empLastName]
      ,[empOtherName]
      ,[empFirstName]
      ,[empDoB]
      ,[empRecriutmentDate]
      ,[empMobileNo]
      ,[empEmail]
      ,[empIsManager]
      ,[empIsDirector]
      ,[empActiveStatus]
      ,[empRmks]
      ,[empTltIdfk] 
      ,[empGndIdfk]
      ,[empJbtIdfk] 
      ,[empCreationDate]
      ,[empLastEditDate]
      ,[empCreatedByUsrIdfk]
      ,[empEditedByUsrIdfk]
      ,[empDptIdfk]
      ,[empIsDeleted])
   VALUES
    ('EMP101', 'Smith', 'Mark', 'John', '1985-05-20', '2022-12-10', '2021234567', 'john.smith@company.com', 0, 0, 1, NULL, 1, 1, 1, GETDATE(), GETDATE(), 1, 1, 1, 0),
    ('EMP102', 'Johnson', NULL, 'Emily', '1990-01-12', '2021-08-03', '2028765432', 'emily.johnson@company.com', 1, 0, 1, 'Marketing Team Lead', 2, 2, 3, GETDATE(), GETDATE(), 1, 1, 3, 0),
    ('EMP103', 'Patel', 'Raj', 'Aryan', '1982-08-25', '2020-03-15', '2024568790', 'aryan.patel@company.com', 0, 1, 1, NULL, 1, 1, 2, GETDATE(), GETDATE(), 1, 1, 2, 0),
    ('EMP104', 'Williams', 'Olivia', 'Sophia', '1993-11-08', '2023-01-16', '2028546321', 'sophia.williams@company.com', 0, 0, 1, NULL, 2, 2, 5, GETDATE(), GETDATE(), 1, 1, 6, 0)


INSERT INTO [dbo].[tblHrContacts]
      ([ctcMobileNo]
      ,[ctcEmail]
      ,[ctcTelephoneNo]
      ,[ctcOfficeNo]
      ,[ctcNotes]
      ,[ctcBusinessNo]
      ,[ctcHomeNo]
      ,[ctcFaxNo]
      ,[ctcEditeByUsrIdfk]
      ,[ctcActiveStatus]
      ,[ctcRmks]
      ,[ctcCreationDate]
      ,[ctcLastEditDate]
      ,[ctcCreatedByUsrIdfk]
      ,[ctcEmpIdfk])
   VALUES
    ('2023457891', 'john.smith@personal.com', '2026459823', '2024568654', 'Primary Contact', NULL, NULL, NULL, 1, 1, NULL, GETDATE(), GETDATE(), 1, 1), -- Contact for John Smith (EMP101)
    ('2028675416', 'emily.j@gmail.com', NULL, '2029875431', NULL, NULL , '2023214567', NULL, 1, 1, 'Marketing Contact Info', GETDATE(), GETDATE(), 1, 2),
    ('2025671234', 'aryanpatel@company.com', NULL, '2024213456', 'Main Work Contact', NULL, NULL, NULL, 1, 1, NULL, GETDATE(), GETDATE(), 1, 3), -- Contact for Aryan Patel (EMP103)
    ('2024562389', 'olivia.williams22@gmail.com', NULL, NULL, 'Personal Contact', NULL, '2025674981', NULL, 1, 1, NULL, GETDATE(), GETDATE(), 1, 4), -- Contact for Sophia Williams (EMP104)
    ('2021237890', 'raj.smith@company.com', NULL, '2027893456', 'Work Contact - IT Dept', NULL, NULL, '2024325123', 1, 1, 'Old Office Number', GETDATE(), GETDATE(), 1, 1); --  Another contact for John Smith (EMP101)


INSERT INTO [dbo].[tblGenAddressType]
      ([adtName]
      ,[adtShtName]
      ,[adtRmks]
      ,[adtActiveStatus]
      ,[adtCreatedDate]
      ,[adtLastEditDate]
      ,[adtCreatedByUsrIdfk]
      ,[adtEditedByUsrIdfk])
   VALUES
    ('Home', 'HOME', NULL, 1, GETDATE(), GETDATE(), 1, 1),
    ('Work', 'WORK', NULL, 1, GETDATE(), GETDATE(), 1, 1),
    ('Billing', 'BILL', NULL, 1, GETDATE(), GETDATE(), 1, 1),
    ('Mailing', 'MAIL', 'PO Box or other mailing address', 1, GETDATE(), GETDATE(), 1, 1),
    ('Temporary', 'TEMP', 'For short-term residences', 1, GETDATE(), GETDATE(), 1, 1);


USE [dbDevSolutions]
GO

INSERT INTO [dbo].[tblGenAddress]
      ([adrTwnIdfk]
      ,[adrAdtIdfk]
      ,[adrStreet]
      ,[adrZipcode]
      ,[adrDescription]
      ,[adrActiveStatus]
      ,[adrCreatedDate]
      ,[adrLastEditDate]
      ,[adrCreatedByUsrIdfk]
      ,[adrEditedByUsrIdfk]
      ,[adrEmpIdfk])
   VALUES
    (1, 1, '123 Main Street', '90210', 'Home Address', 1, GETDATE(), GETDATE(), 1, 1, 1), -- Assuming Town ID 1 exists, Adr Type 1 is 'Home'
    (2, 2, '456 Oak Avenue', '85719', 'Work Address', 1, GETDATE(), GETDATE(), 1, 1, 2), 
    (3, 1, 'P.O. Box 426', '10012', NULL, 1, GETDATE(), GETDATE(), 1, 1, 3)


INSERT INTO [dbo].[tblHrTraining]
      ([trnName]
      ,[trnDescription]
      ,[trnCreatedDate]
      ,[trnLastEditDate]
      ,[trnCreatedByUsrIdfk]
      ,[trnLastEditedByUsrIdfk])
   VALUES
    ('Workplace Safety & Compliance', 'Annual training on safety regulations', GETDATE(), GETDATE(), 1, 1),
    ('New Employee Orientation', 'Introduction to company policies and procedures', GETDATE(), GETDATE(), 1, 1),
    ('Leadership Development Program', 'Multi-week program for managers', GETDATE(), GETDATE(), 1, 1),
    ('Software Development Fundamentals', 'Technical training for IT employees', GETDATE(), GETDATE(), 1, 1),
    ('Customer Service Excellence', 'Best practices for customer interactions', GETDATE(), GETDATE(), 1, 1);



INSERT INTO [dbo].[tblHrEmployeeTraining]
      ([empIdfk]
      ,[trnIdpk]
      ,[trnStartDate]
      ,[trnCompletionDate])
   VALUES
    (9, 1, '2023-02-01', '2023-02-02'), -- John Smith completed Workplace Safety
    (10, 2, '2023-01-16', '2023-01-16'), -- Emily Johnson completed Orientation
    (11, 3, '2023-03-15', NULL), -- Aryan Patel enrolled in Leadership Program (not yet completed)
    (12, 5, '2022-12-12', '2022-12-15') -- John Smith completed Customer Service in the past
