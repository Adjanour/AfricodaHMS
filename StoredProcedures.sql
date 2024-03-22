CREATE PROCEDURE GetEmployeeAddresses 
    @empIdfk INT = NULL, -- Parameter for employee ID
	@addressTypeIdfk INT = NULL
AS
BEGIN
    SELECT 
        cty.ctyName AS empCountry,
        rgn.rgnName AS empRegion,
        twn.twnName AS empTown,
        adr.adrStreet AS empStreet,
        adr.adrZipcode As empZipcode,
		adr.adrDescription AS empAddressDescription
    FROM tblGenAddress adr
    LEFT JOIN tblGenTowns twn ON adr.adrTwnIdfk = twn.twnIdpk
    LEFT JOIN tblGenRegions rgn ON twn.twnRgnIdfk = rgn.rgnIdpk
    LEFT JOIN tblGenCountries cty ON rgn.rgnCtyIdfk = cty.ctyIdpk
    WHERE (@empIdfk IS NULL OR adr.adrEmpIdfk = @empIdfk) AND
	(@addressTypeIdfk IS NULL OR adr.adrAdtIdfk = @addressTypeIdfk); 
END; 

CREATE PROCEDURE GetEmployees
AS
BEGIN

SELECT dbo.ConcatenateNames(tblHrEmployees.empLastName,dbo.tblHrEmployees.empOtherName,tblHrEmployees.empFirstName,tblGenTitles.tltShtName) as empName, 
                         ISNULL(dbo.tblHrEmployees.empLastName, '') AS empLastName, ISNULL(ISNULL(dbo.tblHrEmployees.empOtherName, ''), '') AS empOtherName, ISNULL(dbo.tblHrEmployees.empFirstName, '') AS empFirstName, 
                         ISNULL(dbo.tblHrContacts.ctcMobileNo, '') AS ctcMobileNo, ISNULL(dbo.tblHrContacts.ctcTelephoneNo, '') AS ctcTelephoneNo, ISNULL(dbo.tblHrContacts.ctcOfficeNo, '') AS ctcOfficeNo, ISNULL(dbo.tblHrContacts.ctcEmail, '') 
                         AS ctcEmail, ISNULL(dbo.tblHrContacts.ctcNotes, '') AS ctcNotes, ISNULL(dbo.tblHrContacts.ctcActiveStatus, 1) AS ctcActiveStatus, ISNULL(dbo.tblHrEmployees.empDoB, '') AS empDoB, ISNULL(dbo.tblHrEmployees.empActiveStatus, 1) 
                         AS empActiveStatus, ISNULL(dbo.tblHrEmployees.empRmks, '') AS empRmks, ISNULL(dbo.tblGenCategories.ctgName, '') AS ctgName, ISNULL(dbo.tblGenJobTitles.jbtName, '') AS jbtName, ISNULL(dbo.tblGenDepartments.dptName, '') 
                         AS dptName, dbo.tblHrContacts.ctcIdpk, dbo.tblHrEmployees.empIDpk, dbo.tblHrEmployees.empGndIdfk, dbo.tblHrEmployees.empTltIdfk, ISNULL(dbo.tblHrContacts.ctcRmks, '') AS ctcRmks, ISNULL(dbo.tblGenGenders.gndName, '') 
                         AS gndName, ISNULL(dbo.tblGenGenders.gndShtName, '') AS gndShtName, dbo.tblGenGenders.gndIDpk, dbo.tblHrContacts.ctcIDpk, dbo.tblGenTitles.tltIDpk, ISNULL(dbo.tblGenTitles.tltName, '') AS tltName, 
                         ISNULL(dbo.tblGenTitles.tltShtName, '') AS tltShtName, dbo.tblGenAddress.adrIdpk, dbo.tblHrEmployees.empCreationDate, dbo.tblHrEmployees.empCreatedByUsrIdfk, dbo.tblHrEmployees.empLastEditDate, 
                         dbo.tblHrEmployees.empEditedByUsrIdfk, dbo.tblGenDepartments.dptIDpk, dbo.tblHrEmployees.empDptIdfk, dbo.tblGenCategories.ctgIDpk, ISNULL(dbo.tblGenCategories.ctgShtName, '') AS ctgShtName, ISNULL(dbo.tblGenJobTitles.jbtIDpk, 0) 
                         AS jbtIDpk, ISNULL(dbo.tblGenJobTitles.jbtShtName, '') AS jbtShtName, ISNULL(dbo.tblGenDepartments.dptShtName, '') AS dptShtName, 
                         ISNULL(dbo.tblHrContacts.ctcBusinessNo, '') AS ctcBusinessNo, ISNULL(dbo.tblHrContacts.ctcHomeNo, '') AS ctcHomeNo, ISNULL(dbo.tblHrContacts.ctcFaxNo, '') AS ctcFaxNo, 
                         dbo.tblGenAddress.adrTwnIdfk, dbo.tblGenAddress.adrAdtIdfk, ISNULL(dbo.tblGenAddress.adrStreet, '') AS adrStreet, ISNULL(dbo.tblGenAddress.adrZipcode, '') AS adrZipcode, 
                         ISNULL(dbo.tblGenCountries.ctyName, '') AS ctyName, ISNULL(dbo.tblGenCountries.ctyShtName, '') AS ctyShtName, ISNULL(dbo.tblGenRegions.rgnName, '') AS rgnName, ISNULL(dbo.tblGenRegions.rgnShtName, '') AS rgnShtName, 
                         ISNULL(dbo.tblGenAddressType.adtName, '') AS adtName, ISNULL(dbo.tblGenAddressType.adtShtName, '') AS adtShtName, ISNULL(dbo.tblGenTowns.twnName, '') AS twnTownName, ISNULL(dbo.tblGenTowns.twnShtName, '') 
                         AS twnShtName, dbo.tblGenAddress.adrIDpk
FROM            dbo.tblHrEmployees LEFT OUTER JOIN
						 dbo.tblGenAddress ON dbo.tblHrEmployees.empIdpk =  dbo.tblGenAddress.adrEmpIdfk   LEFT OUTER JOIN
						  dbo.tblGenTowns ON dbo.tblGenTowns.twnIdpk = dbo.tblGenAddress.adrTwnIdfk LEFT OUTER JOIN
						 dbo.tblGenRegions ON dbo.tblGenRegions.rgnIDpk = dbo.tblGenTowns.twnRgnIdfk  LEFT OUTER JOIN
                         dbo.tblGenCountries ON dbo.tblGenRegions.rgnCtyIdfk = dbo.tblGenCountries.ctyIdpk LEFT OUTER JOIN
                         dbo.tblGenCategories ON dbo.tblHrEmployees.empDptIdfk = dbo.tblGenCategories.ctgIdpk LEFT OUTER JOIN
                         dbo.tblGenDepartments ON dbo.tblHrEmployees.empDptIdfk = dbo.tblGenDepartments.dptIdpk LEFT OUTER JOIN
                         dbo.tblGenGenders ON dbo.tblHrEmployees.empGndIdfk = dbo.tblGenGenders.gndIDpk LEFT OUTER JOIN
                         dbo.tblGenTitles ON dbo.tblHrEmployees.empTltIdfk = dbo.tblGenTitles.tltIDpk LEFT OUTER JOIN
                         dbo.tblHrContacts ON dbo.tblHrEmployees.empIdpk = dbo.tblHrContacts.ctcEmpIdfk LEFT OUTER JOIN
						 dbo.tblGenJobTitles ON dbo.tblGenJobTitles.jbtIDpk = dbo.tblHrEmployees.empJbtIdfk LEFT OUTER JOIN
						 dbo.tblGenAddressType ON dbo.tblGenAddressType.adtIDpk = dbo.tblGenAddress.adrAdtIdfk;
						

END

CREATE   PROCEDURE [dbo].[spAddress]
    @CRUD_ID INT,
    @adrIdpk INT = NULL,
    @adrTownIdfk INT = NULL,
    @adrRegionIdfk INT = NULL,
    @adrCountryIdfk INT = NULL,
    @adrAddressTypeIdfk INT = NULL,
    @adrStreet NVARCHAR(50) = NULL,
    @adrZipcode NVARCHAR(25) = NULL,
    @adrAddressDescription NVARCHAR(55) = NULL,
    @adrActive BIT = 1,
	@Result int out
AS 
BEGIN
    -- Create an output parameter for returning results
   

    IF (@CRUD_ID = 1)
    BEGIN
        -- Read operation
        SELECT
            [adrIDpk],
            [adrTwnIdfk],
            [adrAdtIdfk],
            [adrStreet],
            [adrZipcode],
            [adrDescription],
            [adrActiveStatus],
            [adrCreatedDate],
            [adrLastEditDate]
        FROM [dbo].[tblGenAddress]
        WHERE [adrIDpk] = @adrIDpk;
        -- Optionally, return the result
        -- SET @Result = 0; -- Success
        -- RETURN @Result;
    END  
    ELSE IF (@CRUD_ID = 2)
    BEGIN 
        -- Create operation
        INSERT INTO [dbo].[tblGenAddress]
        (
            [adrTwnIdfk],
            [adrAdtIdfk],
            [adrStreet],
            [adrZipcode],
            [adrDescription],
            [adrActiveStatus]
           
        )
        VALUES
        (
            @adrTownIDfk,
            @adrAddressTypeIDfk,
            @adrStreet,
            @adrZipcode,
            @adrAddressDescription,
            @adrActive
        );

        -- Optionally, return the ID of the newly inserted row
        SET @Result = SCOPE_IDENTITY(); 
       
    END
    ELSE IF (@CRUD_ID = 3)
	BEGIN
				DECLARE @ForeignKeyExists bit = 0;

				SELECT @ForeignKeyExists = CASE WHEN EXISTS (SELECT 1 FROM tblGenAddress WHERE adrIdpk = @adrIDpk) THEN 1 ELSE 0 END;

				IF @ForeignKeyExists = 0
					BEGIN
					 -- Insert operation
						INSERT INTO [dbo].[tblGenAddress]
						(
							 [adrTwnIdfk],
							
							[adrAdtIdfk],
							[adrStreet],
							[adrZipcode],
							[adrDescription],
							[adrActiveStatus]
						)
						VALUES
						(
							@adrTownIDfk,
							@adrAddressTypeIDfk,
							@adrStreet,
							@adrZipcode,
							@adrAddressDescription,
							@adrActive
						);

						-- Optionally, return the ID of the newly inserted row
						SET @Result = SCOPE_IDENTITY(); 
					END
					BEGIN
						-- Update operation
						UPDATE [dbo].[tblGenAddress]
						SET
							[adrTwnIdfk] = @adrTownIDfk,
							[adrAdtIdfk] = @adrAddressTypeIDfk,
							[adrStreet] = @adrStreet,
							[adrZipcode] = @adrZipcode,
							[adrDescription] = @adrAddressDescription,
							[adrActiveStatus] = @adrActive
            
						WHERE
							[adrIDpk] = @adrIDpk;
						-- Optionally, return a success code (e.g., 0 for success)
						-- SET @Result = 0; 
						-- RETURN @Result;
					END
	END
    ELSE IF (@CRUD_ID = 4)
    BEGIN
        -- Delete operation
        DELETE FROM [dbo].[tblGenAddress]
        WHERE
            [adrIDpk] = @adrIDpk;
        -- Optionally, return a success code (e.g., 0 for success)
        -- SET @Result = 0; 
        -- RETURN @Result;
    END

END

CREATE PROCEDURE [dbo].[AddUserAndEmployee]
    @CompanyDomain nvarchar(50), 
    @empLastName NVARCHAR(25),
    @empOtherName NVARCHAR(25)=NULL, 
    @empFirstName NVARCHAR(25),
    @empDoB DATETIME,  
    @empRecriutmentDate DATETIME,
    @empMobileNo NVARCHAR(10),
    @empIsManager BIT,
    @empIsDirector BIT,
    @empTitleId INT,
    @empGenderId INT,
    @empJobTitleId INT , 
    @empDepartmentId INT 
AS
BEGIN
    DECLARE @EmpID int;

    BEGIN TRANSACTION; -- For data integrity

    BEGIN TRY

        INSERT INTO tblHrEmployees (
           empStaffNo, empLastName,  empOtherName, empFirstName, empDoB, 
        empRecriutmentDate, empMobileNo, empEmail, empIsManager, empIsDirector, 
        empTltIdfk, empGndIdfk, empJbtIdfk, empDptIdfk
         )
        VALUES (
             dbo.GenerateStaffNo('EMP-', @EmpID), @empLastName, @empOtherName, @empFirstName, @empDoB, 
        @empRecriutmentDate, @empMobileNo, dbo.GenerateWorkEmail(@empFirstName, @empLastName, @CompanyDomain), @empIsManager, @empIsDirector, 
         @empTitleId, @empGenderId, @empJobTitleId, @empDepartmentId
        );

        SET @EmpID = SCOPE_IDENTITY(); 

        INSERT INTO tblGenUsers (
            usrName,
            usrPassword,
            usrEmpIdfk
        )
        VALUES (
            dbo.GenerateWorkEmail(@empFirstName, @empLastName, @CompanyDomain), -- Using email as username
            dbo.GenerateDefaultPassword(@empFirstName + @empLastName + @empOtherName), 
            @EmpID 
        ); 
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION; 
        THROW; 
    END CATCH;
END 

CREATE PROCEDURE AddEmployee
    @empStaffNo INT,
    @empLastName NVARCHAR(25),
    @empOtherName NVARCHAR(25), 
    @empFirstName NVARCHAR(25),
    @empDoB DATETIME,  
    @empRecriutmentDate DATETIME,
    @empMobileNo NVARCHAR(10),
    @empEmail NVARCHAR(50), 
    @empIsManager BIT,
    @empIsDirector BIT,
    @empActiveStatus BIT,
    @empRmks NVARCHAR(25),
    @empTltIdfk INT,
    @empGndIdfk INT,
    @empJbtIdfk INT, 
    @empDptIdfk INT 
AS
BEGIN
    INSERT INTO tblHrEmployees (
        empStaffNo, empLastName,  empOtherName, empFirstName, empDoB, 
        empRecriutmentDate, empMobileNo, empEmail, empIsManager, empIsDirector, 
        empActiveStatus, empRmks, empTltIdfk, empGndIdfk, empJbtIdfk, empDptIdfk
    ) 
    VALUES (
        @empStaffNo, @empLastName, @empOtherName, @empFirstName, @empDoB, 
        @empRecriutmentDate, @empMobileNo, @empEmail, @empIsManager, @empIsDirector, 
        @empActiveStatus, @empRmks, @empTltIdfk, @empGndIdfk, @empJbtIdfk, @empDptIdfk
    );
END; 


CREATE PROCEDURE SoftDeleteEmployee
    @empIdpk INT 
AS
BEGIN
    UPDATE tblHrEmployees
    SET empIsDeleted = 1
    WHERE empIdpk = @empIdpk; 
END;

CREATE PROCEDURE SearchEmployees
    @empName NVARCHAR(50) = NULL, -- Use a length suitable to your data
    @dptIdfk INT = NULL,
    @jbtIdfk INT = NULL,
    @empIsManager BIT = NULL,
    @empIsDirector BIT = NULL
AS
BEGIN
    SELECT *
    FROM tblHrEmployees 
    WHERE 
        (@empName IS NULL OR (empFirstName + ' ' + empLastName LIKE '%' + @empName + '%' )) AND
        (@dptIdfk IS NULL OR empDptIdfk = @dptIdfk) AND
        (@jbtIdfk IS NULL OR empJbtIdfk = @jbtIdfk) AND
        (@empIsManager IS NULL OR empIsManager = @empIsManager) AND
        (@empIsDirector IS NULL OR empIsDirector = @empIsDirector) AND
        empIsDeleted = 0;
END; 

CREATE PROCEDURE DeleteEmployee
    @empIdpk INT 
AS
BEGIN
    DELETE FROM tblHrEmployees
    WHERE empIdpk = @empIdpk; 
END;

CREATE PROCEDURE AddDepartment 
    @dptName NVARCHAR(25),
    @dptShtName NVARCHAR(25), 
    @dptRmks NVARCHAR(25),
    @dptActiveStatus BIT 
AS
BEGIN
    INSERT INTO tblGenDepartments (dptName, dptShtName, dptRmks, dptActiveStatus)
    VALUES (@dptName, @dptShtName, @dptRmks, @dptActiveStatus);
END; 

CREATE PROCEDURE GetDepartmentDetails
    @dptIdpk INT 
AS
BEGIN
    SELECT * 
    FROM tblGenDepartments
    WHERE dptIdpk = @dptIdpk;
END; 

CREATE PROCEDURE GetAllDepartments 
AS
BEGIN
    SELECT * 
    FROM tblGenDepartments
    WHERE dptActiveStatus = 1; -- Assuming you'll only show active departments
END; 

-- **U - Update**
CREATE PROCEDURE UpdateDepartment 
    @dptIdpk INT,
    @dptName NVARCHAR(25),
    @dptShtName NVARCHAR(25), 
    @dptRmks NVARCHAR(25),
    @dptActiveStatus BIT 
AS
BEGIN
    UPDATE tblGenDepartments
    SET 
        dptName = @dptName, 
        dptShtName = @dptShtName,
        dptRmks = @dptRmks,
        dptActiveStatus = @dptActiveStatus
    WHERE dptIdpk = @dptIdpk;
END;


CREATE PROCEDURE SoftDeleteDepartment
    @dptIdpk INT 
AS
BEGIN
    UPDATE tblGenDepartments
    SET dptActiveStatus = 0 
    WHERE dptIdpk = @dptIdpk; 
END;

CREATE PROCEDURE SearchDepartmentsByName
    @dptNameSearch NVARCHAR(50) = NULL 
AS
BEGIN
    SELECT dptIdpk as departmentId,dptName as departmentName,dptCreationDate departmentCreatedOn,dptLastEditDate departmentLastEditedOn,dptRmks as deptRemarks
    FROM tblGenDepartments
    WHERE 
        (@dptNameSearch IS NULL OR dptName LIKE '%' + @dptNameSearch + '%') AND
        dptActiveStatus = 1; -- Show active departments
END; 

CREATE PROCEDURE GetEmployeeQualifications
    @empIdfk INT
AS
BEGIN
    SELECT 
        qlf.qlfIdpk as qualificationId, qlf.qlfName qualificationName, qlf.qlfDescription as qualificationDescription
    FROM tblHrEmployeeQualifications empQlf
    LEFT OUTER JOIN tblHrQualifications qlf  ON empQlf.qlfIdpk = qlf.qlfIdpk
    WHERE empQlf.empIdfk = @empIdfk; 
END; 

CREATE PROCEDURE AddJobTitle
    @jbtName NVARCHAR(50),
    @jbtDescription NVARCHAR(255) = NULL,  -- Optional job description
    @jbtActiveStatus BIT = 1  
AS
BEGIN
    INSERT INTO tblGenJobTitles (jbtName, jbtDescription, jbtActiveStatus)
    VALUES (@jbtName, @jbtDescription, @jbtActiveStatus);
END;

CREATE PROCEDURE GetJobTitles
AS
BEGIN
    SELECT *
    FROM tblGenJobTitles
    WHERE jbtActiveStatus = 1;  
END;

CREATE PROCEDURE GetJobTitleDetails
    @jbtIdpk INT
AS
BEGIN
    SELECT *
    FROM tblGenJobTitles
    WHERE jbtIdpk = @jbtIdpk;
END;

CREATE PROCEDURE spUpdateJobTitle
    @jbtIdpk INT,
    @jbtName NVARCHAR(50)=NULL,
    @jbtDescription NVARCHAR(255) = NULL,
    @jbtActiveStatus BIT = 1 
AS
BEGIN
    UPDATE tblGenJobTitles
    SET 
        jbtName = Coalesce(@jbtName,jbtName),
        jbtDescription = Coalesce(@jbtDescription,jbtDescription),
        jbtActiveStatus = @jbtActiveStatus
    WHERE jbtIdpk = @jbtIdpk;
END;

CREATE PROCEDURE SoftDeleteJobTitle
    @jbtIdpk INT
AS
BEGIN
    UPDATE tblGenJobTitles
    SET jbtActiveStatus = 0
    WHERE jbtIdpk = @jbtIdpk;
END;

CREATE PROCEDURE AddGender
    @gndName NVARCHAR(20)
AS
BEGIN
    INSERT INTO tblGenGenders (gndName)
    VALUES (@gndName);
END;

CREATE PROCEDURE UpdateGender
    @gndrIdpk INT,
    @gndrName NVARCHAR(20)
AS
BEGIN
    UPDATE tblGenGenders
    SET gndName = @gndrName
    WHERE gndIdpk = @gndrIdpk;
END;


CREATE PROCEDURE GetOrgHierarchy 
    @empIdfk INT = NULL  
AS
BEGIN
    WITH OrgChart (empIdpk, empFirstName, empLastName, IsManager, IsDirector, Level) AS 
    (
        -- Anchor: Get the starting employee or the top level if parameter is null
        SELECT 
            empIdpk, empFirstName, empLastName, empIsManager, empIsDirector, 0 AS Level 
        FROM tblHrEmployees 
        WHERE (@empIdfk IS NULL AND (empIsManager = 1 OR empIsDirector = 1)) 
              OR empIdpk = @empIdfk 

        UNION ALL

        -- Recursive Part: Get subordinates
        SELECT  
            e.empIdpk, e.empFirstName, e.empLastName, e.empIsManager, e.empIsDirector, Level + 1  
        FROM tblHrEmployees e
        JOIN OrgChart m ON (e.empIsManager = 1 OR e.empIsDirector = 1) AND  -- Join if subordinate themselves is a manager/director
                            m.Level = m.Level - 1  -- One level below in hierarchy
    )
    SELECT 
        empIdpk, 
        empFirstName + ' ' + empLastName AS EmployeeName, 
        IsManager,
        IsDirector, 
        Level,
        REPLICATE('----', Level) + empFirstName + ' ' + empLastName AS IndentedName 
    FROM OrgChart
    ORDER BY Level; -- Optional: Order by hierarchy level
END;


CREATE PROCEDURE GetEmployeeHierarchy
AS
BEGIN
    SELECT 
        'Director' AS Role,
        empFirstName + ' ' + empLastName AS EmployeeName, 
        dptName AS Department -- Since directors might not be directly in a department
    FROM tblHrEmployees
	 LEft outer JOIN tblGenDepartments dpt ON empDptIdfk = dpt.dptIdpk
    WHERE empIsDirector = 1

    UNION ALL

    SELECT
        'Department Manager' AS Role,
        empFirstName + ' ' + empLastName AS EmployeeName, 
        dpt.dptName AS Department 
    FROM tblHrEmployees mgr
    left outer JOIN tblGenDepartments dpt ON mgr.empDptIdfk = dpt.dptIdpk
    WHERE mgr.empIsManager = 1 

    UNION ALL

    SELECT 
       'Employee' AS Role,
       emp.empFirstName + ' ' + emp.empLastName AS EmployeeName,
       dpt.dptName AS Department
    FROM tblHrEmployees emp 
   left outer JOIN tblHrEmployees mgr ON emp.empIdpk = mgr.empIdpk
   left outer JOIN tblGenDepartments dpt ON emp.empDptIdfk = dpt.dptIdpk
    WHERE emp.empIsManager = 0 -- Filter out managers as they'll already be listed
END; 

