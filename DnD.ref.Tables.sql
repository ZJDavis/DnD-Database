
CREATE TABLE ref.Creatures (
  [CreatureID] INT PRIMARY KEY IDENTITY(1, 1),
  [Name] NVARCHAR(255),
  [TypeID] SMALLINT,
  [SubtypeID] SMALLINT,
  [Alignment] NVARCHAR(2),
  [HitPoints] INT,
  [ArmorClass] SMALLINT,
  [ChallengeRating] DECIMAL(4,2)
)
GO

CREATE TABLE ref.Movement (
  [MoveID] INT PRIMARY KEY IDENTITY(1, 1),
  [CreatureID] INT,
  [MoveType] NVARCHAR(50),
  [Speed] INT
)
GO

CREATE TABLE ref.Abilities (
  [AbilityID] INT PRIMARY KEY IDENTITY(1, 1),
  [CreatureID] INT,
  [AbilityName] NVARCHAR(100),
  [Description] NVARCHAR(MAX)
)
GO

CREATE TABLE ref.Actions (
  [ActionID] INT PRIMARY KEY IDENTITY(1, 1),
  [CreatureID] INT,
  [ActionName] NVARCHAR(100),
  [Description] NVARCHAR(MAX)
)
GO

CREATE TABLE ref.LegendaryActions (
  [LegendaryID] INT PRIMARY KEY IDENTITY(1, 1),
  [CreatureID] INT,
  [LegendaryName] NVARCHAR(100),
  [Description] NVARCHAR(MAX)
)
GO

CREATE TABLE ref.CreatureTypes (
  [CTypeID] SMALLINT PRIMARY KEY IDENTITY(1, 1),
  [CType] NVARCHAR(50)
)
GO

CREATE TABLE ref.CreatureSubtypes (
  [CSubtypeID] SMALLINT PRIMARY KEY IDENTITY(1, 1),
  [CSubtype] NVARCHAR(50)
)
GO

CREATE TABLE ref.Sources (
  [SourceID] INT PRIMARY KEY IDENTITY(1, 1),
  [CreatureID] INT,
  [Source] NVARCHAR(100),
  [PageNo] INT,
  [Abbr] NVARCHAR(8),
  [Description] NVARCHAR(MAX),
  [Audience] NVARCHAR(20)
)
GO

ALTER TABLE ref.Movement ADD FOREIGN KEY ([CreatureID]) REFERENCES ref.Creatures ([CreatureID])
GO

ALTER TABLE ref.Abilities ADD FOREIGN KEY ([CreatureID]) REFERENCES ref.Creatures ([CreatureID])
GO

ALTER TABLE ref.Actions ADD FOREIGN KEY ([CreatureID]) REFERENCES ref.Creatures ([CreatureID])
GO

ALTER TABLE ref.LegendaryActions ADD FOREIGN KEY ([CreatureID]) REFERENCES ref.Creatures ([CreatureID])
GO

ALTER TABLE ref.Creatures ADD FOREIGN KEY ([TypeID]) REFERENCES ref.CreatureTypes ([CTypeID])
GO

ALTER TABLE ref.Creatures ADD FOREIGN KEY ([SubtypeID]) REFERENCES ref.CreatureSubtypes ([CSubtypeID])
GO

ALTER TABLE ref.Sources ADD FOREIGN KEY ([CreatureID]) REFERENCES ref.Creatures ([CreatureID])
GO