
CREATE TABLE [dbo].[Estudiantes] (
    [Identificacion]  INT          IDENTITY (1, 1) NOT NULL,
    [Nombre]          VARCHAR (50) NOT NULL,
    [primerApellido]  VARCHAR (50) NOT NULL,
    [segundoApellido] VARCHAR (50) NOT NULL,
    [fechaNacimiento] VARCHAR (50) NOT NULL,
    [fechaIngreso]    VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Identificacion] ASC)
);

CREATE TABLE [dbo].[TemporalRegistration] (
    [Id]                     INT          NOT NULL,
    [idCourse]               VARCHAR (50) NULL,
    [costCourse]             MONEY        NULL,
    [dateRegistrationCourse] VARCHAR (50) NULL,
    [period]                 VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


CREATE TABLE [dbo].[Registration] (
    [Id]               INT          NOT NULL,
    [idStudent]        INT          NOT NULL,
    [idCourses]        VARCHAR (50) NOT NULL,
    [dateRegistration] DATE         NOT NULL,
    [period]           VARCHAR (10) NOT NULL,
    [costRegistration] MONEY        NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[Courses] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [schoolName]  VARCHAR (50)  NOT NULL,
    [courseName]  VARCHAR (50)  NOT NULL,
    [description] VARCHAR (250) NOT NULL,
    [price]       MONEY         NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[Career] (
    [Id]     INT          IDENTITY (1, 1) NOT NULL,
    [Nombre] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);