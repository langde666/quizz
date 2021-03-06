USE [DBQuiz]
GO
ALTER TABLE [dbo].[Questions] DROP CONSTRAINT [FK_Questions_Quiz]
GO
ALTER TABLE [dbo].[Choices] DROP CONSTRAINT [FK_Choices_Questions]
GO
ALTER TABLE [dbo].[Answers] DROP CONSTRAINT [FK_Answers_Questions]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/4/2021 6:39:24 PM ******/
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 1/4/2021 6:39:24 PM ******/
DROP TABLE [dbo].[Quiz]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 1/4/2021 6:39:24 PM ******/
DROP TABLE [dbo].[Questions]
GO
/****** Object:  Table [dbo].[Choices]    Script Date: 1/4/2021 6:39:24 PM ******/
DROP TABLE [dbo].[Choices]
GO
/****** Object:  Table [dbo].[Answers]    Script Date: 1/4/2021 6:39:24 PM ******/
DROP TABLE [dbo].[Answers]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 1/4/2021 6:39:24 PM ******/
DROP TABLE [dbo].[Admins]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 1/4/2021 6:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](20) NULL,
	[Password] [nvarchar](max) NULL,
	[FullName] [nvarchar](100) NULL,
	[ProfilImage] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Answers]    Script Date: 1/4/2021 6:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answers](
	[AnswerID] [int] IDENTITY(1,1) NOT NULL,
	[AnswerText] [nvarchar](max) NULL,
	[QuestionID] [int] NULL,
 CONSTRAINT [PK_Answers] PRIMARY KEY CLUSTERED 
(
	[AnswerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Choices]    Script Date: 1/4/2021 6:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Choices](
	[ChoiceID] [int] IDENTITY(1,1) NOT NULL,
	[ChoiceText] [nvarchar](max) NULL,
	[QuestionID] [int] NULL,
 CONSTRAINT [PK_Choices] PRIMARY KEY CLUSTERED 
(
	[ChoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 1/4/2021 6:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionText] [nvarchar](max) NULL,
	[QuizID] [int] NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 1/4/2021 6:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[QuizID] [int] IDENTITY(1,1) NOT NULL,
	[QuizName] [nvarchar](80) NULL,
 CONSTRAINT [PK_Quiz] PRIMARY KEY CLUSTERED 
(
	[QuizID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/4/2021 6:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[ProfilImage] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admins] ON 

INSERT [dbo].[Admins] ([AdminID], [Username], [Password], [FullName], [ProfilImage]) VALUES (1, N'Admin1', N'gFuYE2Bpl7A=', N'Lang De', N'auto.gif')
INSERT [dbo].[Admins] ([AdminID], [Username], [Password], [FullName], [ProfilImage]) VALUES (2, N'Admin2', N'gFuYE2Bpl7A=', N'Tuan Nhan', N'auto.gif')
INSERT [dbo].[Admins] ([AdminID], [Username], [Password], [FullName], [ProfilImage]) VALUES (3, N'Admin3', N'gFuYE2Bpl7A=', N'Quy Le', N'auto.gif')
INSERT [dbo].[Admins] ([AdminID], [Username], [Password], [FullName], [ProfilImage]) VALUES (4, N'admin4', N'gFuYE2Bpl7A=', N'Nguyen Hue', N'auto.gif')
INSERT [dbo].[Admins] ([AdminID], [Username], [Password], [FullName], [ProfilImage]) VALUES (5, N'admin5', N'gFuYE2Bpl7A=', N'Nghia Dang', N'auto.gif')
SET IDENTITY_INSERT [dbo].[Admins] OFF
SET IDENTITY_INSERT [dbo].[Answers] ON 

INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (2, N'2', 2)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (3, N'4', 3)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (4, N'6', 4)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (5, N'8', 5)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (6, N'10', 6)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (8, N'12', 9)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (9, N'14', 10)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (10, N'16', 11)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (11, N'18', 12)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (18, N'20', 13)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (20, N'Bà Triệu', 15)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (21, N'Hai Bà Trưng', 14)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (22, N'Ngô Quyền', 16)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (23, N'Hưng Đạo Vương Trần quốc Tuấn', 17)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (24, N'Lê Lợi', 18)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (25, N'Quang Trung - Nguyễn Huệ', 19)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (26, N'Chu Văn An', 20)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (27, N'Nguyễn Trãi', 21)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (28, N'Phùng Hưng', 22)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (29, N'Đinh Tiên Hoàng (Đinh Bộ Lĩnh)', 23)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (30, N'13', 24)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (31, N'Đào Hoa Mộng ký', 25)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (32, N'cả 3 ý trên', 26)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (33, N'3254 câu', 27)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (34, N'Kim Vân Kiều truyện - Thanh Tâm Tài Nhấn', 28)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (35, N'21', 29)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (36, N'chắp nhặt những câu thơ trong truyện Kiều thành nhiều bài thơ mới', 30)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (39, N'ngôn ngữ', 31)
SET IDENTITY_INSERT [dbo].[Answers] OFF
SET IDENTITY_INSERT [dbo].[Choices] ON 

INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (5, N'0', 2)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (6, N'1', 2)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (7, N'2', 2)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (8, N'3', 2)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (9, N'1', 3)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (10, N'2', 3)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (11, N'3', 3)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (12, N'4', 3)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (13, N'5', 4)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (14, N'6', 4)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (15, N'7', 4)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (16, N'8', 4)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (17, N'6', 5)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (18, N'7', 5)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (19, N'8', 5)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (20, N'9', 5)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (21, N'7', 6)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (22, N'8', 6)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (23, N'9', 6)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (24, N'10', 6)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (33, N'11', 9)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (34, N'12', 9)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (35, N'13', 9)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (36, N'14', 9)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (37, N'11', 10)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (38, N'12', 10)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (39, N'13', 10)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (40, N'14', 10)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (41, N'15', 11)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (42, N'16', 11)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (43, N'17', 11)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (44, N'18', 11)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (45, N'18', 12)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (46, N'19', 12)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (47, N'20', 12)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (48, N'21', 12)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (49, N'20', 13)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (50, N'22', 13)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (51, N'22', 13)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (52, N'24', 13)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (53, N'Bà Triệu', 14)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (54, N'Hai Bà Trưng', 14)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (55, N'Lê Lợi', 14)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (56, N'Ngô Quyền', 14)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (57, N'Bà Triệu', 15)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (58, N'Hai Bà Trưng', 15)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (59, N'Lê Lợi', 15)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (60, N'Ngô Quyền', 15)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (61, N'Trần Quốc Tuấn', 16)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (62, N'Ngô Quyền', 16)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (63, N'Quang Trung', 16)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (64, N'Lý Thường Kiệt', 16)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (65, N'Quang Trung - Nguyễn Huệ', 17)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (66, N'Hưng Đạo Vương Trần quốc Tuấn', 17)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (67, N'Lý Thường Kiệt', 17)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (68, N'Đinh Bộ Lĩnh', 17)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (69, N'Trần Quang Khải', 18)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (70, N'Lê Lợi', 18)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (71, N'Đinh Lễ', 18)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (72, N'Ngô Quyền', 18)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (73, N'Quang Trung - Nguyễn Huệ', 19)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (74, N'Lê Lợi', 19)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (75, N'Lý Thường Kiệt', 19)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (76, N'Lý Triện', 19)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (77, N'Nguyễn Trãi', 20)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (78, N'Phan Bội Châu', 20)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (79, N'Chu Văn An', 20)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (80, N'Phan Chu Trinh', 20)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (81, N'Nguyễn Trãi', 21)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (82, N'Phan Bội Châu', 21)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (83, N'Chu Văn An', 21)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (84, N'Phan Chu Trinh', 21)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (85, N'Phùng Hưng', 22)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (86, N'Lê Lợi', 22)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (87, N'Lý Thường Kiệt', 22)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (88, N'Ngô Quyền', 22)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (89, N'Trần Thái Tông', 23)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (90, N'Lý Thái Tổ', 23)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (91, N'Mai Hắc Đế (Mai Thúc Loan)', 23)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (92, N'Đinh Tiên Hoàng (Đinh Bộ Lĩnh)', 23)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (93, N'11', 24)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (94, N'12', 24)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (95, N'13', 24)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (96, N'14', 24)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (97, N'Đào Hoa Mộng ký', 25)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (98, N'Đoạn Trường Tân An', 25)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (99, N'Đào Hoa Mộng lệ', 25)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (100, N'Đoạn Trường Tân Thanh (phần kế)', 25)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (101, N'bình Kiều', 26)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (102, N'vịnh Kiều', 26)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (103, N'bói Kiều', 26)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (104, N'cả 3 ý trên', 26)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (105, N'3251 câu', 27)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (106, N'3252 câu', 27)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (107, N'3253 câu', 27)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (108, N'3254 câu', 27)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (109, N'Kim Vân Kiều truyện - Thanh Tâm Tài Nhấn', 28)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (110, N'Hồng Lâu Mộng của Tào Tuyết Cần', 28)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (111, N'Tam Quốc Diễn Nghĩa của La Quán Trung', 28)
GO
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (112, N'Chuyện Tình Giai Nhân của Trương Ái Linh', 28)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (113, N'20', 29)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (114, N'21', 29)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (115, N'22', 29)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (116, N'23', 29)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (117, N'nhiều thi sĩ viết phần tiếp theo cho tác phẩm', 30)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (118, N'chắp nhặt những câu thơ trong truyện Kiều thành nhiều bài thơ mới', 30)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (119, N'lịch Truyện Kiều', 30)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (120, N'hiện tượng làm thơ từ ý tưởng Kiều', 30)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (121, N'thơ lục bác', 31)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (122, N'ngôn ngữ', 31)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (123, N'chất trữ tình', 31)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (124, N'hình ảnh', 31)
SET IDENTITY_INSERT [dbo].[Choices] OFF
SET IDENTITY_INSERT [dbo].[Questions] ON 

INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (2, N'1+1=?', 5)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (3, N'2+2=?', 5)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (4, N'3+3=?', 5)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (5, N'4+4=?', 5)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (6, N'5+5=?', 5)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (9, N'6+6=?', 5)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (10, N'7+7=?', 5)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (11, N'8+8=?', 5)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (12, N'9+9=?', 5)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (13, N'10+10=?', 5)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (14, N'Mê Linh đất cũ còn ghi muôn đời.
Yếm, khăn đội đá vá trời.
Giặc Tô mất vía rụng rời thoát thân?
Là ai?', 3)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (15, N'Đạp luồng sóng dữ đuổi quân giặc thù.
Cửu Chân nức tiếng ngàn thu.
Vì dân quyết phá ngục tù lầm than.
Là ai? ', 3)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (16, N'Làm cho cọc nhọn dọc ngang sáng ngời.
Phá quân Nam Hán tơi bời.
Gươm thần độc lập giữa trời vang lên?
Là ai?', 3)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (17, N'Đã vui Hàm Tử lại mừng Chương Dương.
Vân Đồn cướp sạch binh cường.
Nồi bàng mai phục chặn đường giặc lui?
Là ai?', 3)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (18, N'Chí Linh mấy lượt nếm mùi đắng cay.
Mười năm Bình Định ra tay.
Thành Đông Quan, mất vía bầy Vương Thông?
Là ai?', 3)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (19, N'Nửa đêm trừ tịch quyết lòng tiến binh.
Đống Đa, sông Nhị vươn mình.
Giặc Thanh vỡ mộng cường chinh toi bời?
Là ai?', 3)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (20, N'Tâu vua xin chém bảy đầu mọt dân.
Mũ cao áo rộng không cần.
Lui về ẩn chốn lâm sơn một mình?
Là ai?', 3)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (21, N'Rồi đem nợ nước thù nhà ra cân.
Núi Lam tìm giúp minh quân.
Bình Ngô Đại Cáo, bút thầm ra tay?
Là ai?', 3)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (22, N'Nổi danh Bố Cái Đại vương thuở nào.
Tiếc thay mệnh bạc tài cao.
Giang sơn đàng phải rơi vào ngoại bang?
Là ai?', 3)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (23, N'Trường Yên một ngọn cờ lau tập tành.
Sứ quân dẹp loạn phân tranh.
Dựng nền thống nhất sử xanh còn truyền?
Là ai?', 3)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (24, N'Truyện Kiều - Tác phẩm thơ dài có nhiều bản dịch nhất ra cùng một ngoại ngữ.
Hỏi: Truyện Kiều có bao nhiêu bản dịch Tiếng Pháp?', 4)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (25, N'Truyện Kiều - Thi phẩm có nhiều người viết phần tiếp theo nhất.
Hỏi: Thi phẩm nào sau đây là một trong số phấn tiếp theo của Truyện Kiều?', 4)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (26, N'Truyện Kiều - Thi phẩm duy nhất tạo ra loại hình văn hóa Kiều.
Hỏi: Hình thức nào sau đây thuộc văn hóa Kiều?', 4)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (27, N'Truyện Kiều, được xem là truyện thơ nổi tiếng nhất và xét vào hàng kinh điển trong Văn học Việt Nam, tác phẩm được viết bằng chữ Nôm theo thể lục bát, gồm bao nhiêu câu?', 4)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (28, N'Truyện Kiều được viết dựa theo tiểu thuyết nào?', 4)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (29, N'Truyện Kiều còn là tác phẩm văn chương Việt Nam được dịch sang nhiều ngôn ngữ nhất.
Hỏi: Truyện Kiều đã được dịch sang bao nhiêu ngôn ngữ?', 4)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (30, N'Truyện Kiều đã sinh ra một hiện tường, gọi là "Tập Kiều". Vậy hiện tượng này là gì?', 4)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (31, N'Theo nhiều nhà bình phẩm Văn học, đóng góp lớn nhất của Truyện Kiều là gì?', 4)
SET IDENTITY_INSERT [dbo].[Questions] OFF
SET IDENTITY_INSERT [dbo].[Quiz] ON 

INSERT [dbo].[Quiz] ([QuizID], [QuizName]) VALUES (3, N'Nhân Vật Lịch Sử?')
INSERT [dbo].[Quiz] ([QuizID], [QuizName]) VALUES (4, N'Truyện Kiều của Nguyễn Du')
INSERT [dbo].[Quiz] ([QuizID], [QuizName]) VALUES (5, N'Toán Lớp 1')
SET IDENTITY_INSERT [dbo].[Quiz] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [FullName], [ProfilImage]) VALUES (1, N'Nghia Dang', N'auto1.gif')
INSERT [dbo].[Users] ([UserID], [FullName], [ProfilImage]) VALUES (2, N'Nguyen Hue', N'qtv3.jpg')
INSERT [dbo].[Users] ([UserID], [FullName], [ProfilImage]) VALUES (3, N'Kiu Van Cool', N'6117746324798773286.png')
INSERT [dbo].[Users] ([UserID], [FullName], [ProfilImage]) VALUES (4, N'Kiu Cool', N'6768483-GEQREGKQ-7.jpg')
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Questions] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Questions] ([QuestionID])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Questions]
GO
ALTER TABLE [dbo].[Choices]  WITH CHECK ADD  CONSTRAINT [FK_Choices_Questions] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Questions] ([QuestionID])
GO
ALTER TABLE [dbo].[Choices] CHECK CONSTRAINT [FK_Choices_Questions]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Quiz] FOREIGN KEY([QuizID])
REFERENCES [dbo].[Quiz] ([QuizID])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Quiz]
GO
