IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tree]') AND type in (N'U'))
ALTER TABLE [dbo].[tree] DROP CONSTRAINT IF EXISTS [FK_tree_species1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tree]') AND type in (N'U'))
ALTER TABLE [dbo].[tree] DROP CONSTRAINT IF EXISTS [FK_tree_species]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[species]') AND type in (N'U'))
ALTER TABLE [dbo].[species] DROP CONSTRAINT IF EXISTS [FK_species_speciestype]
GO
/****** Object:  Table [dbo].[user]    Script Date: 2023-07-31 1:43:37 PM ******/
DROP TABLE IF EXISTS [dbo].[user]
GO
/****** Object:  Table [dbo].[tree]    Script Date: 2023-07-31 1:43:37 PM ******/
DROP TABLE IF EXISTS [dbo].[tree]
GO
/****** Object:  Table [dbo].[speciestype]    Script Date: 2023-07-31 1:43:37 PM ******/
DROP TABLE IF EXISTS [dbo].[speciestype]
GO
/****** Object:  Table [dbo].[species]    Script Date: 2023-07-31 1:43:37 PM ******/
DROP TABLE IF EXISTS [dbo].[species]
GO
/****** Object:  Table [dbo].[species]    Script Date: 2023-07-31 1:43:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[species](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[englishname] [varchar](250) NOT NULL,
	[scientificname] [varchar](250) NULL,
	[type_ID] [int] NULL,
	[native] [bit] NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_species] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[speciestype]    Script Date: 2023-07-31 1:43:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[speciestype](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[typename] [varchar](20) NOT NULL,
 CONSTRAINT [PK_speciestype] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tree]    Script Date: 2023-07-31 1:43:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tree](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[species_ID] [int] NOT NULL,
	[location] [geography] NULL,
	[description] [text] NULL,
	[createdby] [varchar](50) NULL,
 CONSTRAINT [PK_tree] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 2023-07-31 1:43:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[username] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[firstname] [varchar](50) NULL,
	[lastname] [varchar](50) NULL,
	[location] [varchar](250) NULL,
 CONSTRAINT [PK_user_1] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[species] ON 
GO
INSERT [dbo].[species] ([ID], [englishname], [scientificname], [type_ID], [native], [description]) VALUES (1, N'Sugar maple', N'Acer saccharum', 1, 1, NULL)
GO
INSERT [dbo].[species] ([ID], [englishname], [scientificname], [type_ID], [native], [description]) VALUES (2, N'Black walnut', N'Juglans nigra', 1, 1, NULL)
GO
INSERT [dbo].[species] ([ID], [englishname], [scientificname], [type_ID], [native], [description]) VALUES (3, N'Black cherry', N'Prunus serotina', 1, 1, NULL)
GO
INSERT [dbo].[species] ([ID], [englishname], [scientificname], [type_ID], [native], [description]) VALUES (4, N'White oak', N'Quercus alba', 1, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[species] OFF
GO
SET IDENTITY_INSERT [dbo].[speciestype] ON 
GO
INSERT [dbo].[speciestype] ([ID], [typename]) VALUES (1, N'deciduous')
GO
INSERT [dbo].[speciestype] ([ID], [typename]) VALUES (2, N'conifer')
GO
SET IDENTITY_INSERT [dbo].[speciestype] OFF
GO
ALTER TABLE [dbo].[species]  WITH CHECK ADD  CONSTRAINT [FK_species_speciestype] FOREIGN KEY([type_ID])
REFERENCES [dbo].[speciestype] ([ID])
GO
ALTER TABLE [dbo].[species] CHECK CONSTRAINT [FK_species_speciestype]
GO
ALTER TABLE [dbo].[tree]  WITH CHECK ADD  CONSTRAINT [FK_tree_species] FOREIGN KEY([createdby])
REFERENCES [dbo].[user] ([username])
GO
ALTER TABLE [dbo].[tree] CHECK CONSTRAINT [FK_tree_species]
GO
ALTER TABLE [dbo].[tree]  WITH CHECK ADD  CONSTRAINT [FK_tree_species1] FOREIGN KEY([species_ID])
REFERENCES [dbo].[species] ([ID])
GO
ALTER TABLE [dbo].[tree] CHECK CONSTRAINT [FK_tree_species1]
GO
