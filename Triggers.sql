
--CREATE TRIGGER PreventTaskDeletion
--ON tblTmTasks
--After DELETE 
--AS
--BEGIN
--    IF EXISTS (SELECT 1 FROM tbTmProjects 
--               WHERE prjIdpk = deleted.tsk 
--               AND prjStaIdfk = (SELECT staIdpk FROM tblTmTaskStatuses WHERE staName = 'Active' or staName='In Progress'))
--    BEGIN
--        RAISERROR('Cannot delete tasks assigned to active projects.', 16, 1);
--        ROLLBACK TRANSACTION; -- Cancel the deletion
--    END
--END

ALTER TRIGGER [dbo].[Audit_tblHrEmployees]
ON [dbo].[tblHrEmployees]
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    IF (TRIGGER_NESTLEVEL() > 1) -- Avoid infinite recursion if triggers cascade  
        RETURN;

    DECLARE @Action VARCHAR(10);

    IF EXISTS (SELECT * FROM inserted)
        IF EXISTS (SELECT * FROM deleted) 
            SET @Action = 'UPDATE';   
        ELSE 
            SET @Action = 'INSERT';  
    ELSE 
        SET @Action = 'DELETE';  

	;WITH DiffData AS (
        SELECT * FROM inserted 
        EXCEPT 
        SELECT * FROM deleted 
    )

 /* ... (Code from above) ... */
    INSERT INTO tblAuditLog (audTableName, audRecordId, audActionType, audActionDescription, audUsrIdfk, audActionDate)
     SELECT
        'tblHrEmployees', 
        COALESCE(inserted.empIdpk, deleted.empIdpk), 
        @Action,
        (SELECT * FROM DiffData FOR JSON PATH), -- Change applied here
        1,
        GETDATE() 
    FROM inserted
    JOIN deleted ON inserted.empIdpk = deleted.empIdpk; 
END
