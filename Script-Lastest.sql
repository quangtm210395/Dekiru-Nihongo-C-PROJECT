USE [master]
GO
/****** Object:  Database [DekiruNihongo]    Script Date: 03/23/2017 23:32:34 ******/
CREATE DATABASE [DekiruNihongo] ON  PRIMARY 
( NAME = N'DekiruNihongo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\DekiruNihongo.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DekiruNihongo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\DekiruNihongo_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DekiruNihongo] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DekiruNihongo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DekiruNihongo] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [DekiruNihongo] SET ANSI_NULLS OFF
GO
ALTER DATABASE [DekiruNihongo] SET ANSI_PADDING OFF
GO
ALTER DATABASE [DekiruNihongo] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [DekiruNihongo] SET ARITHABORT OFF
GO
ALTER DATABASE [DekiruNihongo] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [DekiruNihongo] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [DekiruNihongo] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [DekiruNihongo] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [DekiruNihongo] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [DekiruNihongo] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [DekiruNihongo] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [DekiruNihongo] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [DekiruNihongo] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [DekiruNihongo] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [DekiruNihongo] SET  DISABLE_BROKER
GO
ALTER DATABASE [DekiruNihongo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [DekiruNihongo] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [DekiruNihongo] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [DekiruNihongo] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [DekiruNihongo] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [DekiruNihongo] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [DekiruNihongo] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [DekiruNihongo] SET  READ_WRITE
GO
ALTER DATABASE [DekiruNihongo] SET RECOVERY SIMPLE
GO
ALTER DATABASE [DekiruNihongo] SET  MULTI_USER
GO
ALTER DATABASE [DekiruNihongo] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [DekiruNihongo] SET DB_CHAINING OFF
GO
USE [DekiruNihongo]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 03/23/2017 23:32:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Book] ON
INSERT [dbo].[Book] ([ID], [Name], [Description]) VALUES (1, N'Dekiru Nihongo ShoKyuu', N'Dekiru Nihongo Shokyuu')
INSERT [dbo].[Book] ([ID], [Name], [Description]) VALUES (2, N'Dekiru Nihongo ShoChyuuKyuu', N'Dekiru Nihongo ShoChyuuKyuu')
INSERT [dbo].[Book] ([ID], [Name], [Description]) VALUES (3, N'Dekiru Nihongo ChyuKyuu', N'Dekiru Nihongo ChyuKyuu')
SET IDENTITY_INSERT [dbo].[Book] OFF
/****** Object:  Table [dbo].[Admin]    Script Date: 03/23/2017 23:32:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_Admin] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON
INSERT [dbo].[Admin] ([ID], [Username], [Password]) VALUES (1, N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[Admin] OFF
/****** Object:  Table [dbo].[User]    Script Date: 03/23/2017 23:32:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ImageLink] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_User] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lesson]    Script Date: 03/23/2017 23:32:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[BookID] [int] NOT NULL,
	[LessonNumber] [int] NOT NULL,
 CONSTRAINT [PK_Lesson] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Lesson] ON
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (1, N'新しい一歩', 1, 1)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (2, N'楽しいショッピング', 1, 2)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (3, N'私の目標', 1, 3)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (4, N'住んでいる町で', 1, 4)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (5, N'大変な一日', 1, 5)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (6, N'旅行に行こう', 1, 6)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (7, N'西川さんの家へ', 1, 7)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (8, N'ありがとう', 1, 8)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (9, N'アルバイト先で', 1, 9)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (10, N'旅行に行って', 1, 10)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (11, N'地域社会の中で', 1, 11)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (12, N'私の健康法', 1, 12)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (13, N'親の気持ち・子の気持ち', 1, 13)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (14, N'イベント・行事', 1, 14)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (15, N'気になるニュース', 1, 15)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (16, N'新しい一歩', 2, 1)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (17, N'楽しいショッピング', 2, 2)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (18, N'私の目標', 2, 3)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (19, N'住んでいる町で', 2, 4)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (20, N'大変な一日', 2, 5)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (21, N'旅行に行こう', 2, 6)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (22, N'西川さんの家へ', 2, 7)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (23, N'ありがとう', 2, 8)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (24, N'アルバイト先で', 2, 9)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (25, N'旅行に行って', 2, 10)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (26, N'地域社会の中で', 2, 11)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (27, N'私の健康法', 2, 12)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (28, N'親の気持ち・子の気持ち', 2, 13)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (29, N'イベント・行事', 2, 14)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (30, N'気になるニュース', 2, 15)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (31, N'新たな出会い', 3, 1)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (32, N'楽しい食事・上手な買い物', 3, 2)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (33, N'時間を生かす', 3, 3)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (34, N'地域を知って生活する', 3, 4)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (35, N'緊急事態', 3, 5)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (36, N'地図を広げる', 3, 6)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (37, N'世代を超えた交流', 3, 7)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (38, N'気持ちを伝える', 3, 8)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (39, N'言葉を楽しむ', 3, 9)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (40, N'日本を旅する', 3, 10)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (41, N'ライフスタイル', 3, 11)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (42, N'心と体の健康', 3, 12)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (43, N'トレンドに乗ってつながる', 3, 13)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (44, N'カレチャーションク', 3, 14)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (45, N'情報会社に生きる', 3, 15)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (46, N'学校生活', 3, 16)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (47, N'働くということ', 3, 17)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (48, N'地峡の生きる', 3, 18)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (49, N'科学の力', 3, 19)
INSERT [dbo].[Lesson] ([ID], [Name], [BookID], [LessonNumber]) VALUES (50, N'豊かさと幸せ', 3, 20)
SET IDENTITY_INSERT [dbo].[Lesson] OFF
/****** Object:  Table [dbo].[Vocabulary]    Script Date: 03/23/2017 23:32:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vocabulary](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LessonID] [int] NOT NULL,
	[Term] [ntext] NOT NULL,
	[Definition] [ntext] NOT NULL,
 CONSTRAINT [PK_Vocabulary] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Vocabulary] ON
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (1, 1, N'わたし', N'Tôi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (2, 1, N'なまえ', N'Tên')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (3, 1, N'くに', N'Đất nước')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (4, 1, N'にほん', N'Nhật Bản')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (5, 1, N'かんこく', N'Hàn Quốc')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (6, 1, N'ちゅうごく', N'Trung Quốc')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (7, 1, N'アメリカ', N'Mỹ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (8, 1, N'イタリア', N'Ý')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (9, 1, N'オーストラリア', N'Úc')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (10, 1, N'ロシア', N'Nga')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (11, 1, N'タイ', N'Thái Lan')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (12, 1, N'こうこう', N'Trường trung học phổ thông')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (13, 1, N'だいがく', N'Trường đại học')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (14, 1, N'にほんごがっこう', N'Trường tiếng Nhật')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (15, 1, N'しごと', N'Công việc')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (16, 1, N'がくせい', N'Học sinh')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (17, 1, N'せんせい', N'Thầy ／ Cô giáo ( Thường dùng trong xưng hô , giao tiếp )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (18, 1, N'きょうし', N'Giáo viên')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (19, 1, N'かいしゃいん', N'Nhân viên văn phòng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (20, 1, N'しゃいん', N'Nhân viên ( của công ty nào đó )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (21, 1, N'さん', N'Anh ／ Chị ／ Ông ／ Bà ／ Bạn ~')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (22, 1, N'じん', N'Người nước ~')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (23, 1, N'ご', N'Tiếng nước ~')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (24, 1, N'どちら', N'Ở đâu ／ Phía nào')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (25, 1, N'おくにはどちらですか', N'Đất nước của bạn là nước nào ?')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (26, 1, N'はじめまして', N'Xin chào ( lần đầu tiên gặp mặt )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (27, 1, N'どうぞよろしくおねがいします', N'Rất mong nhận được sự giúp đỡ của bạn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (28, 1, N'こちらこそ', N'Tôi cũng vậy !')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (29, 1, N'あのう', N'Anh ／ Chị ơi !')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (30, 1, N'すみません', N'Xin lỗi, cho tôi hỏi ...')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (31, 1, N'あのう、すみません', N'Anh ／ Chị ơi, xin lỗi cho tôi hỏi ...')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (32, 1, N'そうですか', N'Thế à !')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (33, 1, N'たんじょうび', N'Ngày sinh ／ Sinh nhật')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (34, 1, N'ブラジル', N'Brazil')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (35, 1, N'がつ', N'Tháng ~')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (36, 1, N'にち／か', N'Ngày ( mùng ) ~')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (37, 1, N'さい', N'~ tuổi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (38, 1, N'いつ', N'Lúc nào ／ Khi nào')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (39, 1, N'しゅみ', N'Sở thích')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (40, 1, N'スポーツ', N'Thể thao')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (41, 1, N'サッカー', N'Bóng đá')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (42, 1, N'テニス', N'Tennis')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (43, 1, N'すいえい', N'Bơi lội')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (44, 1, N'おんがく', N'Âm nhạc')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (45, 1, N'どくしょ', N'Đọc sách')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (46, 1, N'りょこう', N'Du Lịch')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (47, 1, N'りょうり', N'Nấu ăn ／ Món ăn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (48, 1, N'なん', N'Cái gì')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (49, 1, N'あ', N'A! ／ Á!')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (50, 1, N'あのひと', N'Người kia')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (51, 1, N'えきいん', N'Nhân viên nhà ga')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (52, 1, N'こうむいん', N'Công chức')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (53, 1, N'ぎんこういん', N'Nhân viên ngân hàng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (54, 1, N'かしゅ', N'Ca sĩ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (55, 1, N'べんごし', N'Luật sư')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (56, 1, N'サッカーせんしゅ', N'Cầu thủ bóng đá')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (57, 1, N'やきゅう', N'Bóng chày')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (58, 1, N'バスケットボール', N'Bóng rổ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (59, 1, N'ピンポン（たっきゅう）', N'Bóng bàn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (60, 1, N'バドミントン', N'Cầu lông')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (61, 2, N'ここ／こちら', N'Đây, chỗ này ／ Phía này')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (62, 2, N'そこ／そちら', N'Đó, chỗ đó ／ Phía đó')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (63, 2, N'あそこ／あちら', N'Kia, chỗ kia ／ Phía kia')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (64, 2, N'インフォメーション', N'Quầy thông tin')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (65, 2, N'エスカレーター', N'Thang cuốn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (66, 2, N'エレベーター', N'Thang máy')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (67, 2, N'きつえんじょ', N'Nơi hút thuốc')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (68, 2, N'トイレ', N'Nhà vệ sinh')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (69, 2, N'レジ', N'Quầy thu ngân')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (70, 2, N'きっさてん', N'Quán giải khát')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (71, 2, N'１００えんショップ', N'Cửa hàng 100 Yên')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (72, 2, N'レストラン', N'Nhà hàng, quán ăn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (73, 2, N'ちか', N'Ngầm, dưới lòng đất')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (74, 2, N'カメラ', N'Máy ảnh')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (75, 2, N'けいたいでんわ', N'Điện thoại di động')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (76, 2, N'でんしじしょ', N'Kim từ điển')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (77, 2, N'パソコン', N'Máy tính cá nhân')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (78, 2, N'くつ', N'Giầy')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (79, 2, N'ケシごむ', N'Tẩy')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (80, 2, N'ペン', N'Bút')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (81, 2, N'トイレットペーパー', N'Giấy vệ sinh')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (82, 2, N'ほん', N'Sách')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (83, 2, N'あぶら', N'Dầu')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (84, 2, N'ケーキ', N'Bánh ngọt')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (85, 2, N'こめ', N'Gạo')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (86, 2, N'たまご', N'Trứng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (87, 2, N'パン', N'Bánh mỳ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (88, 2, N'みず', N'Nước')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (89, 2, N'てんいん', N'Nhân viên bán hàng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (90, 2, N'かい', N'Tầng ~')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (91, 2, N'や', N'Cửa hàng ~,Hiệu ~')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (92, 2, N'いらっしゃいませ', N'Kính chào quý khách')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (93, 2, N'これ', N'Cái này')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (94, 2, N'それ', N'Cái đó')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (95, 2, N'あれ', N'Cái kia')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (96, 2, N'どれ', N'Cái nào')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (97, 2, N'この', N'Cái ~ này')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (98, 2, N'その', N'Cái ~ đó')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (99, 2, N'あの', N'Cái ~ kia')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (100, 2, N'どの', N'Cái ~ nào')
GO
print 'Processed 100 total records'
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (101, 2, N'かばん', N'Cặp, túi sách')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (102, 2, N'ズボン', N'Quần dài')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (103, 2, N'Tシャツ', N'Áo phông')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (104, 2, N'とけい', N'Đồng hồ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (105, 2, N'えん', N'~ Yên')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (106, 2, N'いくら', N'Bao nhiêu')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (107, 2, N'じゃ', N'Thế thì ／ Thôi thì')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (108, 2, N'さかな', N'Cá')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (109, 2, N'にく', N'Thịt')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (110, 2, N'ぎゅうにく', N'Thịt bò')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (111, 2, N'ぶたにく', N'Thịt lợn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (112, 2, N'やさい', N'Rau')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (113, 2, N'イチゴ', N'Quả dâu')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (114, 2, N'りんご', N'Quả táo')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (115, 2, N'これはさかなのりょうりです', N'Đây là món cá')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (116, 2, N'カレー', N'Món cà-ri')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (117, 2, N'スープ', N'Canh, súp')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (118, 2, N'とんかつ', N'Món thịt lợn chiên xù')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (119, 2, N'ハンバーグ', N'Món thịt băm viên')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (120, 2, N'ごはん', N'Cơm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (121, 2, N'ごはんを２つください', N'Cho tôi 2 bát／xuất cơm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (122, 2, N'ライス', N'Cơm, gạo ( phiên âm KATA )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (123, 2, N'ジュース', N'Nước ngọt, nước trái cây')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (124, 2, N'コーヒー', N'Cà phê')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (125, 2, N'こうちゃ', N'Trà đen')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (126, 2, N'おちゃ', N'Trà, nước chè')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (127, 2, N'ビール', N'Bia')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (128, 2, N'ワイン', N'Rượu vang')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (129, 2, N'インド', N'Ấn Độ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (130, 2, N'ドイツ', N'Đức')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (131, 2, N'フランス', N'Pháp')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (132, 2, N'さいふ', N'Ví tiền')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (133, 2, N'えいご', N'Tiếng Anh')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (134, 2, N'つ', N'~ cái ／ ~ chiếc')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (135, 2, N'だれ', N'Ai')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (136, 2, N'ちゅうもんをおねがいします', N'Cho tôi gọi đồ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (137, 2, N'どうぞ', N'Xin mời')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (138, 2, N'ふく', N'quần áo')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (139, 2, N'ぼうし', N'mũ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (140, 2, N'えんぴつ', N'bút chì')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (141, 2, N'シャープペンシル', N'bút chì kim')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (142, 2, N'ボールペン', N'bút bi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (143, 2, N'にんじん', N'Cà rốt')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (144, 2, N'たまねぎ', N'Hành tây')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (145, 2, N'じゃがいも', N'khoai tây')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (146, 3, N'いま', N'Bây giờ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (147, 3, N'ごぜん', N'Buổi sáng ／ AM')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (148, 3, N'ごご', N'Buổi chiều ／ PM')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (149, 3, N'ひる', N'Buổi trưa')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (150, 3, N'ぎんこう', N'Ngân hàng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (151, 3, N'たいいくかん', N'Nhà thi đấu , nhà tập thể dục')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (152, 3, N'としょかん', N'Thư viện')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (153, 3, N'びょういん', N'Bệnh viện')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (154, 3, N'ゆうびんきょく', N'Bưu điện')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (155, 3, N'じゅぎょう', N'Giờ học')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (156, 3, N'テスト', N'Bài kiểm tra')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (157, 3, N'やすみ', N'Nghỉ ／ Ngày nghỉ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (158, 3, N'じかん', N'Thời gian')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (159, 3, N'じ', N'~ giờ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (160, 3, N'ふん', N'~ phút')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (161, 3, N'９じ２０ぷんです', N'9 giờ 20 phút')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (162, 3, N'じはん', N'~ giờ rưỡi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (163, 3, N'ようび', N'Thứ ~')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (164, 3, N'スケジュール', N'Kế hoạch , lịch')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (165, 3, N'アルバイト', N'Việc làm thêm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (166, 3, N'スキー', N'Trượt tuyết')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (167, 3, N'パーティー', N'Bữa tiệc')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (168, 3, N'バーベキュー', N'Tiệc nướng ngoài trời')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (169, 3, N'はなび', N'Pháo hoa')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (170, 3, N'はなみ', N'Ngắm hoa')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (171, 3, N'ホームステイ', N'Ở cùng gia đình bản địa')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (172, 3, N'まつり', N'Lễ hội')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (173, 3, N'うみ', N'Biển')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (174, 3, N'こうえん', N'Công viên')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (175, 3, N'さくら', N'Hoa anh đào')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (176, 3, N'さけ', N'Rượu')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (177, 3, N'すし', N'Món sushi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (178, 3, N'バス', N'Xe buýt')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (179, 3, N'べんとう', N'Cơm hộp')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (180, 3, N'いちねん', N'1 năm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (181, 3, N'はる', N'Mùa xuân')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (182, 3, N'なつ', N'Mùa hè')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (183, 3, N'あき', N'Mùa thu')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (184, 3, N'ふゆ', N'Mùa đông')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (185, 3, N'ゴールデンウイーク', N'Tuần lễ vàng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (186, 3, N'なに', N'Cái gì')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (187, 3, N'いきます', N'Đi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (188, 3, N'きます', N'Đến')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (189, 3, N'かえります', N'Về, trở về')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (190, 3, N'のみます', N'Uống')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (191, 3, N'たべます', N'Ăn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (192, 3, N'みます', N'Xem, nhìn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (193, 3, N'します', N'Làm, chơi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (194, 3, N'スキーをします', N'Chơi trượt tuyết')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (195, 3, N'いいですね', N'Hay quá nhỉ !')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (196, 3, N'あさ', N'Buổi sáng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (197, 3, N'よる', N'Buổi tối , đêm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (198, 3, N'まいにち', N'Hàng ngày')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (199, 3, N'まいあさ', N'Hàng sáng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (200, 3, N'まいばん', N'Hàng tối')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (201, 3, N'あさごはん', N'Bữa sáng')
GO
print 'Processed 200 total records'
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (202, 3, N'ひるごはん', N'Bữa trưa')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (203, 3, N'うち', N'Nhà')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (204, 3, N'かいしゃ', N'Công ty')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (205, 3, N'コンビニ', N'Cửa hàng tiện lợi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (206, 3, N'ぎゅうにゅう', N'Sữa bò')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (207, 3, N'くだもの', N'Hoa quả')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (208, 3, N'サラダ', N'Món Salad')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (209, 3, N'チーズ', N'Pho-mat')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (210, 3, N'インターネット', N'Internet')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (211, 3, N'しんぶん', N'Báo, tờ báo')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (212, 3, N'テレビ', N'Tivi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (213, 3, N'シーディー', N'CD')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (214, 3, N'ディーブイディー', N'DVD')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (215, 3, N'なにも', N'Cái gì cũng...')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (216, 3, N'どこも', N'Đâu cũng...')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (217, 3, N'かいます', N'Mua')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (218, 3, N'ききます', N'Nghe ( còn có 1 nghĩa nữa là Hỏi )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (219, 3, N'はたらきます', N'Làm việc, lao động')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (220, 3, N'よみます', N'Đọc')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (221, 3, N'おきます', N'Thức dậy')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (222, 3, N'ねます', N'Ngủ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (223, 3, N'べんきょうします', N'Học')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (224, 3, N'えっ', N'Ơ! ／ Hả')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (225, 3, N'へえ', N'Chà ／ Wow')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (226, 4, N'きた', N'Phía bắc')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (227, 4, N'みなみ', N'Phía nam')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (228, 4, N'ひがし', N'Phía đông')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (229, 4, N'にし', N'Phía tây')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (230, 4, N'まんなか', N'Chính giữa')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (231, 4, N'くるま', N'Ô tô')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (232, 4, N'しんかんせん', N'Tàu cao tốc Shinkansen')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (233, 4, N'でんしゃ', N'Tàu điện')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (234, 4, N'ひこうき', N'Máy bay')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (235, 4, N'えき', N'Nhà ga')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (236, 4, N'まち', N'Thành phố, thị trấn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (237, 4, N'じかん', N'~ tiếng ( khoảng thời gian )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (238, 4, N'じかんはん', N'~ tiếng rưỡi ( khoảng thời gian )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (239, 4, N'ふん', N'~ phút ( khoảng thời gian )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (240, 4, N'うちからがっこうまで２０ぷんです', N'Từ nhà đến trường mất 20 phút')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (241, 4, N'あるいて', N'Đi bộ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (242, 4, N'くらい', N'Khoảng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (243, 4, N'どのくらい', N'Bao lâu')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (244, 4, N'おんせん', N'Suối nước nóng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (245, 4, N'かわ', N'Sông')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (246, 4, N'やま', N'Núi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (247, 4, N'きょうかい', N'Nhà thờ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (248, 4, N'おしろ', N'Lâu đài')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (249, 4, N'じんじゃ', N'Ngôi đền')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (250, 4, N'おてら', N'Chùa')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (251, 4, N'ビル', N'Tòa nhà')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (252, 4, N'ところ', N'Nơi, chỗ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (253, 4, N'ひと', N'Người')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (254, 4, N'みどり', N'Màu xanh lá, cây xanh')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (255, 4, N'あります', N'Có ( Chỉ sự tồn tại của sự vật viện tượng )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (256, 4, N'あたらしい', N'Mới')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (257, 4, N'ふるい', N'Cũ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (258, 4, N'いい', N'Tốt')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (259, 4, N'わるい', N'Xấu')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (260, 4, N'おおい', N'Nhiều , đông')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (261, 4, N'すくない', N'Ít')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (262, 4, N'おおきい', N'To, lớn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (263, 4, N'ちいさい', N'Nhỏ, bé')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (264, 4, N'たかい', N'Cao, đắt')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (265, 4, N'ふじさん', N'Núi Phú Sĩ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (266, 4, N'ふじさんはたかいです', N'Núi Phú Sĩ cao')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (267, 4, N'ひくい', N'Thấp')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (268, 4, N'きれい', N'Đẹp, sạch sẽ ( な )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (269, 4, N'しずか', N'Yên tĩnh ( な )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (270, 4, N'にぎやか', N'Náo nhiệt, nhộn nhịp ( な )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (271, 4, N'ゆうめい', N'Nổi tiếng ( な )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (272, 4, N'どんな', N'Như thế nào')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (273, 4, N'そして', N'Và')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (274, 4, N'あめ', N'Mưa')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (275, 4, N'ゆき', N'Tuyết')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (276, 4, N'ひ', N'Ngày ／ Mặt trời')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (277, 4, N'メロン', N'Dưa gang')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (278, 4, N'あたたかい', N'Ấm áp')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (279, 4, N'すずしい', N'Mát mẻ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (280, 4, N'あつい', N'Nóng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (281, 4, N'さむい', N'Lạnh ( thời tiết )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (282, 4, N'つめたい', N'Lạnh ( nhiệt độ , cảm giác )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (283, 4, N'てんき', N'Thời tiết, trời')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (284, 4, N'てんきがいい', N'Thời tiết đẹp')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (285, 4, N'てんきがわるい', N'Thời tiết xấu')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (286, 4, N'おいしい', N'Ngon')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (287, 4, N'あまい', N'Ngọt')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (288, 4, N'からい', N'Cay')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (289, 4, N'にがい', N'Đắng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (290, 4, N'すっぱい', N'Chua')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (291, 4, N'いちねんじゅう', N'Suốt 1 năm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (292, 4, N'あまり', N'Không ~ lắm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (293, 4, N'すこし', N'Một chút, ít')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (294, 4, N'とても', N'Rất')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (295, 4, N'どう', N'Thế nào')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (296, 4, N'そうですね', N'Câu nói thể hiện sự đồng tình với ý kiến người khác hoặc thể hiện đang suy nghĩ chuẩn bị nói tiếp')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (297, 5, N'きょう', N'Hôm nay')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (298, 5, N'あした', N'Ngày mai')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (299, 5, N'あさって', N'Ngày kia')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (300, 5, N'きのう', N'Hôm qua')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (301, 5, N'おととい', N'Hôm kia')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (302, 5, N'せんしゅう', N'Tuần trước')
GO
print 'Processed 300 total records'
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (303, 5, N'しゅうまつ', N'Cuối tuần')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (304, 5, N'いえ', N'Nhà')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (305, 5, N'へや', N'Phòng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (306, 5, N'デパート', N'Trung tâm thương mại')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (307, 5, N'びじゅつかん', N'Viện bảo tàng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (308, 5, N'ゲーム', N'Trò chơi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (309, 5, N'かぞく', N'Gia đình')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (310, 5, N'こいびと', N'Người yêu')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (311, 5, N'ともだち', N'Bạn bè')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (312, 5, N'ルームメイト', N'Bạn cùng phòng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (313, 5, N'どこか', N'Nơi nào đó')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (314, 5, N'あいます', N'Gặp gỡ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (315, 5, N'つくります', N'Làm, chế tạo')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (316, 5, N'かいものします', N'Mua sắm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (317, 5, N'しょくじします', N'Dùng bữa, ăn uống')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (318, 5, N'せんたくします', N'Giặt giũ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (319, 5, N'そうじします', N'Hút bui, lau dọn nhà cửa')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (320, 5, N'それから', N'Sau đó')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (321, 5, N'ひとりで', N'Một mình')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (322, 5, N'けさ', N'Sáng nay')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (323, 5, N'せんげつ', N'Tháng trước')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (324, 5, N'きょねん', N'Năm ngoái')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (325, 5, N'かぜ', N'Cảm cúm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (326, 5, N'てんき', N'Thời tiết, trời')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (327, 5, N'ばんごはん', N'Cơm tối')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (328, 5, N'ふく', N'Quần áo')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (329, 5, N'のぼります', N'Leo, trèo')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (330, 5, N'はいります', N'Vào ／ Bước vào')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (331, 5, N'おんせんにはいります', N'Tắm suối nước nóng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (332, 5, N'いそがしい', N'Bận')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (333, 5, N'おもしろい', N'Thú vị, hay, hấp dẫn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (334, 5, N'きもちがいい', N'Cảm thấy thoải mái')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (335, 5, N'パソコンはたかかったです', N'Máy tính đắt ( đã )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (336, 5, N'やすい', N'Rẻ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (337, 5, N'たのしい', N'Vui vẻ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (338, 5, N'むずかしい', N'Khó')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (339, 5, N'かんたん', N'Dễ, đơn giản')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (340, 5, N'たいへん', N'Vất vả')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (341, 5, N'ひま', N'Rảnh rỗi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (342, 5, N'どうして', N'Tại sao')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (343, 5, N'こんど', N'Lần tới')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (344, 5, N'こんばん', N'Tối nay')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (345, 5, N'ことし', N'Năm nay')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (346, 5, N'らいねん', N'Năm sau')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (347, 5, N'アニメ', N'Hoạt hình')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (348, 5, N'え', N'Tranh')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (349, 5, N'けしき', N'Phong cảnh')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (350, 5, N'じてんしゃ', N'Xe đạp')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (351, 5, N'しゃしん', N'Ảnh')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (352, 5, N'とります', N'Chụp')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (353, 5, N'かります', N'Vay, mượn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (354, 5, N'ほしい', N'Muốn có')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (355, 5, N'すき', N'Thích')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (356, 5, N'きらい', N'Ghét')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (357, 6, N'こんしゅう', N'Tuần này')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (358, 6, N'らいしゅう', N'Tuần sau')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (359, 6, N'こんげつ', N'Tháng này')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (360, 6, N'らいげつ', N'Tháng sau')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (361, 6, N'カラオケ', N'Karaoke')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (362, 6, N'コンサート', N'Hòa nhạc')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (363, 6, N'しあい', N'Trận đấy')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (364, 6, N'セール', N'Giảm giá')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (365, 6, N'チケット', N'Vé')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (366, 6, N'ちず', N'Bản đồ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (367, 6, N'ドライブ', N'Lái xe')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (368, 6, N'みずぎ', N'Đồ bơi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (369, 6, N'やきゅう', N'Bóng chày')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (370, 6, N'やくそく', N'Hứa, hẹn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (371, 6, N'ようじ', N'Việc bận')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (372, 6, N'あります', N'Có ( Dùng cho sự vật, hiện tượng )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (373, 6, N'チケットが２まいあります', N'Có 2 tờ vé')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (374, 6, N'ざんねん', N'Tiếc')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (375, 6, N'いっしょに', N'Cùng nhau, cùng với')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (376, 6, N'いいですね', N'Hay đấy, được đấy !')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (377, 6, N'いっしょにえいがをみにいきませんか', N'Đi xem phim với tôi đi ?')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (378, 6, N'いきましょう', N'Đi nào !')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (379, 6, N'ああ、 にちようびはちょっと。。。', N'A, chủ nhật thì ... ( ý từ chối )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (380, 6, N'またこんど', N'Hẹn bạn lần sau')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (381, 6, N'わお', N'Oa ... ( thể hiện sự ngạc nhiên )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (382, 6, N'たべもの', N'Đồ ăn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (383, 6, N'のみもの', N'Đồ uống')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (384, 6, N'やきにく', N'Thịt nướng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (385, 6, N'ラーメン', N'Mỳ Nhật')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (386, 6, N'たべほうだい', N'Ăn buffe')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (387, 6, N'コース', N'Xuất ăn ／ Khóa học')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (388, 6, N'いざかや', N'Quán rượu')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (389, 6, N'えいがかん', N'Rạp chiếu phim')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (390, 6, N'ちかてつ', N'Tàu điện ngầm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (391, 6, N'かしゅ', N'Ca sĩ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (392, 6, N'きせつ', N'Mùa')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (393, 6, N'コメディー', N'Hài kịch')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (394, 6, N'ジャズ', N'Nhạc jazz')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (395, 6, N'ツアー', N'Tour du lịch')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (396, 6, N'どちら', N'Bên nào, phương nào')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (397, 6, N'どちらも', N'Bên nào cũng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (398, 6, N'ちかい', N'Gần')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (399, 6, N'とおい', N'Xa')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (400, 6, N'はやい', N'Nhanh, sớm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (401, 6, N'おそい', N'Chậm, muộn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (402, 6, N'ひろい', N'Rộng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (403, 6, N'せまい', N'Hẹp')
GO
print 'Processed 400 total records'
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (404, 6, N'いちばん', N'Nhất')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (405, 6, N'ぜんぶ', N'Toàn bộ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (406, 6, N'おこのみやき', N'Món bánh xèo Nhật')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (407, 6, N'すきやき', N'Món nhúng có thịt bò và rau')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (408, 6, N'あそびます', N'Chơi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (409, 6, N'ぜひ', N'Nhất định')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (410, 6, N'まだ', N'Vẫn, chưa')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (411, 6, N'もう', N'Đã, rồi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (412, 6, N'そうしましょう', N'Làm như thế đi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (413, 6, N'わかりました', N'Tôi đã hiểu rồi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (414, 7, N'かいさつ', N'Soát vé')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (415, 7, N'き', N'Cây ／ gỗ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (416, 7, N'こうばん', N'Đồn cảnh sát')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (417, 7, N'じどうはんばいき', N'Máy bán hàng tự động')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (418, 7, N'ポスト', N'Thùng thư')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (419, 7, N'はな', N'Hoa')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (420, 7, N'いぬ', N'Con chó')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (421, 7, N'あいだ', N'Giữa, ở giữa')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (422, 7, N'うえ', N'Trên, bên trên')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (423, 7, N'した', N'Dưới, phía dưới')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (424, 7, N'ちかく', N'Gần ( ở vị trí gần )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (425, 7, N'となり', N'Bên cạnh ( cạnh sát )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (426, 7, N'そば', N'Bên cạnh ( gần cạnh )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (427, 7, N'なか', N'Trong, bên trong')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (428, 7, N'そと', N'Ngoài, bên ngoài')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (429, 7, N'まえ', N'Trước, phía trước')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (430, 7, N'うしろ', N'Sau, phía sau')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (431, 7, N'よこ', N'Bên cạnh ( chiều ngang )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (432, 7, N'むかえます', N'Chào đón')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (433, 7, N'います', N'Có ( chỉ sự tồn tại của người, động vật )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (434, 7, N'わたしはほんやのなかにいます', N'Tôi ở trong hiệu sách')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (435, 7, N'もしもし', N'Alo Alo')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (436, 7, N'いす', N'Cái ghế')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (437, 7, N'テーブル', N'Cái bàn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (438, 7, N'でんしれんじ', N'Lò vi sóng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (439, 7, N'れいぞうこ', N'Tủ lạnh')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (440, 7, N'さとう', N'Đường ăn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (441, 7, N'しお', N'Muối')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (442, 7, N'しょうゆ', N'Xì dầu')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (443, 7, N'コップ', N'Cái cốc')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (444, 7, N'さら', N'Cái đĩa')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (445, 7, N'スプーン', N'Thìa, muỗng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (446, 7, N'ナイフ', N'Con dao')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (447, 7, N'はし', N'Đũa')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (448, 7, N'かんじ', N'Chữ Hán')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (449, 7, N'あらいます', N'Giặt, rửa, tắm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (450, 7, N'おきます', N'Đặt, để')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (451, 7, N'かきます', N'Viết')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (452, 7, N'かします', N'Cho vay, cho mượn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (453, 7, N'ききます', N'Nghe, hỏi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (454, 7, N'Aさんにでんわばんごうをききます', N'Hỏi anh A số điện thoại')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (455, 7, N'きります', N'Cắt, gọt')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (456, 7, N'つかいます', N'Dùng, sử dụng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (457, 7, N'てつだいます', N'Giúp đỡ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (458, 7, N'とります', N'Cầm, lấy, chụp')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (459, 7, N'もっていきます', N'Mang đi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (460, 7, N'もってきます', N'Mang đến')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (461, 7, N'わかります', N'Hiểu, biết')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (462, 7, N'だします', N'Nộp, lấy ra')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (463, 7, N'れいぞうこからジュースをだします', N'Lấy nước trái cây từ tủ lạnh')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (464, 7, N'いれます', N'Cho vào, bỏ vào')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (465, 7, N'おしえます', N'Dạy, chỉ bảo')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (466, 7, N'たくさん', N'Nhiều')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (467, 7, N'すみませんが', N'Xin lỗi ( Có が )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (468, 7, N'これですね', N'Là cái này nhỉ !')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (469, 7, N'いいですよ', N'Được đấy !')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (470, 7, N'うた', N'Bài hát')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (471, 7, N'ギター', N'Đàn ghita')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (472, 7, N'だいどころ', N'Nhà bếp')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (473, 7, N'たばこ', N'Thuốc lá')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (474, 7, N'でんわ', N'Điện thoại')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (475, 7, N'ピザ', N'Bánh pizza')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (476, 7, N'まど', N'Của sổ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (477, 7, N'うたいます', N'Hát')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (478, 7, N'すいます', N'Hút')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (479, 7, N'はなします', N'Nói chuyện')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (480, 7, N'ひきます', N'Chơi, đánh, gảy ( nhạc cụ )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (481, 7, N'もちます', N'Cầm, mang')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (482, 7, N'あけます', N'Mở')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (483, 7, N'しめます', N'Đóng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (484, 7, N'でんわをかけます', N'Gọi điện')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (485, 7, N'ともだちにでんわをかけます', N'Gọi điện cho bạn bè')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (486, 8, N'りょうしん', N'Bố mẹ ( mình )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (487, 8, N'ごりょうしん', N'Bố mẹ ( người khác )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (488, 8, N'ちち', N'Bố ( mình )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (489, 8, N'おとうさん', N'Bố ( người khác )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (490, 8, N'はは', N'Mẹ ( mình )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (491, 8, N'おかあさん', N'Mẹ ( người khác )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (492, 8, N'そぼ', N'Bà ( mình )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (493, 8, N'きょうだい', N'Anh chị em ruột')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (494, 8, N'あに', N'Anh trai ( mình )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (495, 8, N'おにいさん', N'Anh trai ( người khác )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (496, 8, N'あね', N'Chị gái ( mình )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (497, 8, N'おねえさん', N'Chị gái ( người khác )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (498, 8, N'おとうと', N'Em trai ( mình )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (499, 8, N'おとうとさん', N'Em trai ( người khác )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (500, 8, N'いもうと', N'Em gái ( mình )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (501, 8, N'いもうとさん', N'Em gái ( người khác )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (502, 8, N'おっと ／ しゅじん', N'Chồng ( mình )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (503, 8, N'ごしゅじん', N'Chồng ( người khác )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (504, 8, N'つま ／ かない', N'Vợ ( mình )')
GO
print 'Processed 500 total records'
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (505, 8, N'おくさん', N'Vợ ( người khác )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (506, 8, N'こども', N'Con ( mình )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (507, 8, N'おこさん', N'Con ( người khác )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (508, 8, N'むすこ', N'Con trai ( mình )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (509, 8, N'むすこさん', N'Con trai ( người khác )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (510, 8, N'むすめ', N'Con gái ( mình )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (511, 8, N'むすめさん', N'Con gái ( người khác )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (512, 8, N'ペット', N'Thú nuôi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (513, 8, N'ねこ', N'Con mèo')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (514, 8, N'ピアノ', N'Piano')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (515, 8, N'いしゃ', N'Bác sĩ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (516, 8, N'こうこうせい', N'Học sinh cấp 3')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (517, 8, N'だいがくせい', N'Sinh viên đại học')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (518, 8, N'～ ひき', N'~ con ( đơn vị đếm các con vật nhỏ )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (519, 8, N'すみます', N'Sinh sống')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (520, 8, N'わたしはおとうとがいます', N'Tôi có em trai')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (521, 8, N'せんぱい', N'Tiền bối , đàn anh, đàn chị')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (522, 8, N'こうはい', N'Hậu bối, đàn em')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (523, 8, N'うさぎ', N'Con thỏ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (524, 8, N'からだ', N'Thân thể')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (525, 8, N'あし', N'Chân')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (526, 8, N'かお', N'Mặt, khuôn mặt')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (527, 8, N'かみ', N'Tóc')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (528, 8, N'くち', N'Miệng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (529, 8, N'はな', N'Mũi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (530, 8, N'め', N'Mắt')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (531, 8, N'みみ', N'Tai')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (532, 8, N'あたまがいい', N'Thông minh')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (533, 8, N'かっこいい', N'Bảnh bao, đẹp trai')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (534, 8, N'かわいい', N'Đáng yêu, dễ thương')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (535, 8, N'せがたかい', N'Cao ( dáng người )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (536, 8, N'ながい', N'Dài')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (537, 8, N'みじかい', N'Ngắn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (538, 8, N'やさしい', N'Dễ tính, hiền lành')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (539, 8, N'くろい', N'Màu đen')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (540, 8, N'しろい', N'Màu trắng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (541, 8, N'ちゃいろい', N'Màu nâu')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (542, 8, N'げんき', N'Khỏe mạnh')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (543, 8, N'しんせつ', N'Tử tế, tốt bụng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (544, 8, N'まじめ', N'Ngoan, chăm chỉ, trung thưc... ( các đức tính tốt )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (545, 8, N'じょうず', N'Giỏi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (546, 8, N'へた', N'Kém, vụng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (547, 8, N'カード', N'Thẻ ／ Thiệp')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (548, 8, N'ともだちのたんじょうびにカードをおくります', N'Tôi gửi thiệp mừng vào ngày sinh nhật bạn tôi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (549, 8, N'かさ', N'Cái ô')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (550, 8, N'くつした', N'Đôi tất')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (551, 8, N'じしょ', N'Từ điển')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (552, 8, N'チョコレート', N'Sô cô la')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (553, 8, N'てがみ', N'Thư')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (554, 8, N'ネックレス', N'Vòng cổ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (555, 8, N'ノート', N'Quyển vở')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (556, 8, N'プレゼント', N'Quà, món quà')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (557, 8, N'メール', N'Thư điện tử')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (558, 8, N'クリスマス', N'Giáng sinh')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (559, 8, N'けっこんしき', N'Lễ kết hôn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (560, 8, N'バレンタインデー', N'Ngày lễ tình nhân')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (561, 8, N'なにか', N'Cái gì đó')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (562, 8, N'おくります', N'Gửi ／ Tiễn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (563, 8, N'もらいます', N'Nhận')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (564, 8, N'あげます', N'Tặng , biếu ( mình tặng biếu người khác )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (565, 8, N'くれます', N'Cho ( người khác cho mình )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (566, 8, N'でんわします', N'Gọi điện')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (567, 8, N'もうすぐ', N'Sắp, sắp sửa')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (568, 8, N'よかったですね', N'Tốt quá nhỉ !')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (569, 9, N'アクション', N'Hành động')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (570, 9, N'おかし', N'Bánh kẹo')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (571, 9, N'きって', N'Tem')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (572, 9, N'クラシック', N'Nhạc cổ điển')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (573, 9, N'ポップス', N'Nhạc Pop')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (574, 9, N'しょうせつ', N'Tiểu thuyết')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (575, 9, N'まんが', N'Truyện tranh')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (576, 9, N'つり', N'Câu cá')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (577, 9, N'ドラマ', N'Phim truyền hình')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (578, 9, N'プール', N'Bể bơi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (579, 9, N'さいきん', N'Gần đây ( về tgian )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (580, 9, N'～ にち', N'~ ngày')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (581, 9, N'～ しゅうかん', N'~ tuần')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (582, 9, N'～ かげつ', N'~ tháng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (583, 9, N'～ ねん', N'~ năm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (584, 9, N'～ かい', N'~ lần')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (585, 9, N'～ はい', N'~ cốc , ly')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (586, 9, N'およぎます', N'Bơi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (587, 9, N'かきます', N'Vẽ , tả')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (588, 9, N'あつめます', N'Thu thập , tập hợp')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (589, 9, N'うんてんします', N'Lái ( xe )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (590, 9, N'とくに', N'Đặc biệt')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (591, 9, N'いつも', N'Luôn luôn , thường xuyên')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (592, 9, N'よく', N'Hay , thường')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (593, 9, N'わたしはよくえいがをみます', N'Tôi thường xem phim')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (594, 9, N'ときどき', N'Thỉnh thoảng , đôi khi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (595, 9, N'あまりテレビをみません', N'Tôi không xem ti vi nhiều lắm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (596, 9, N'でも', N'Nhưng , tuy nhiên')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (597, 9, N'だけ', N'Chỉ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (598, 9, N'イベント', N'Sự kiện')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (599, 9, N'コンテスト', N'Cuộc thi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (600, 9, N'しょくどう', N'Nhà ăn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (601, 9, N'ダイビング', N'Lặn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (602, 9, N'ダンス', N'Khiêu vũ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (603, 9, N'クラブ', N'Câu lạc bộ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (604, 9, N'きょうしつ', N'Phòng học')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (605, 9, N'しょどうきょうしつ', N'Lớp học thư pháp')
GO
print 'Processed 600 total records'
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (606, 9, N'ならいます', N'Học ( có sự truyền dạy )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (607, 9, N'のります', N'Lên ( tàu xe )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (608, 9, N'はいります', N'Vào , đi vào , gia nhập')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (609, 9, N'ダンスクラブにはいります', N'Gia nhập câu lạc bộ khiêu vũ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (610, 9, N'もうしこみます', N'Xin , thỉnh cầu , đăng ký')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (611, 9, N'できます', N'Có thể')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (612, 9, N'スキーができます', N'Có thể trượt tuyết')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (613, 9, N'さんかします', N'Tham gia')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (614, 9, N'すごい', N'Tuyệt vời ／ Kinh khủng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (615, 9, N'いろいろ', N'Nhiều ( ý đa dạng về mặt chủng loại )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (616, 9, N'うけつけ', N'Quầy lễ tân')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (617, 9, N'カード', N'Thẻ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (618, 9, N'としょかんのカードをつくります', N'Tôi sẽ làm thẻ thư viện')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (619, 9, N'がいこくじんとうろくしょう', N'Chứng nhận đăng ký người nước ngoài')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (620, 9, N'じゅうしょ', N'Địa chỉ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (621, 9, N'しゅくだい', N'Bài tập về nhà')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (622, 9, N'でんわばんごう', N'Số điện thoại')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (623, 9, N'～ ばん', N'Số ~')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (624, 9, N'いいます', N'Nói')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (625, 9, N'はらいます', N'Thanh toán , chi trả')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (626, 9, N'おります', N'Xuống ( tàu xe )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (627, 9, N'みせます', N'Cho xem')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (628, 9, N'よやくします', N'Đặt trước')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (629, 9, N'どうやって', N'Làm thế nào')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (630, 10, N'おと', N'Âm thanh , tiếng động')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (631, 10, N'こえ', N'Giọng nói')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (632, 10, N'くすり', N'Thuốc')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (633, 10, N'みぎ', N'Bên phải')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (634, 10, N'ひだり', N'Bên trái')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (635, 10, N'かど', N'Góc đường')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (636, 10, N'こうさてん', N'Ngã tư')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (637, 10, N'しんごう', N'Tín hiệu ／ Đèn giao thông')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (638, 10, N'はし', N'Cầu')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (639, 10, N'みち', N'Đường')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (640, 10, N'～ つめ ／ ～ ばんめ', N'Thứ ~ ( Đếm thứ tự )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (641, 10, N'さがします', N'Tìm kiếm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (642, 10, N'まがります', N'Rẽ , quẹo')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (643, 10, N'わたります', N'Băng qua')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (644, 10, N'きこえます', N'Nghe thấy ／ Nghe được')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (645, 10, N'みえます', N'Nhìn thấy ／ nhìn được')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (646, 10, N'まっすぐ', N'Thẳng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (647, 10, N'よく', N'Rõ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (648, 10, N'よくわかりません', N'Không hiểu rõ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (649, 10, N'ちょっと', N'Một chút')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (650, 10, N'ええと', N'À , ờ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (651, 10, N'カーテン', N'Rèm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (652, 10, N'おきゃくさん', N'Khách')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (653, 10, N'ごみ', N'Rác')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (654, 10, N'ごみばこ', N'Thùng rác')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (655, 10, N'て', N'Tay')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (656, 10, N'てぶくろ', N'Găng tay')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (657, 10, N'にもつ', N'Hành lý ／ Bưu phẩm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (658, 10, N'パンフレット', N'Tờ rơi ／ tờ quảng cáo')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (659, 10, N'ほか', N'Khác')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (660, 10, N'みなさん', N'Mọi người')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (661, 10, N'おみやげ', N'Quà lưu niệm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (662, 10, N'おします', N'Ấn , đẩy')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (663, 10, N'すわります', N'Ngồi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (664, 10, N'たちます', N'Đứng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (665, 10, N'はいります', N'Vào')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (666, 10, N'なくします', N'Làm mất')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (667, 10, N'なくなります', N'Tự mất')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (668, 10, N'もってかえります', N'Mang về')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (669, 10, N'おくれます', N'Muộn , chậm chễ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (670, 10, N'すてます', N'Vứt bỏ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (671, 10, N'しゅうごうします', N'Tập hợp , tụ họp')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (672, 10, N'しゅうちゅうします', N'Tập trung , chú trọng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (673, 10, N'あぶない', N'Nguy hiểm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (674, 10, N'たいせつ', N'Quan trọng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (675, 10, N'めいわく', N'Phiền phức')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (676, 10, N'どうぶつえん', N'Vườn bách thú')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (677, 10, N'くま', N'Gấu')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (678, 10, N'コアラ', N'Gấu Kao-la')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (679, 10, N'さる', N'Khỉ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (680, 10, N'ぞう', N'Voi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (681, 10, N'とり', N'Chim')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (682, 10, N'パンダ', N'Gấu trúc')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (683, 10, N'ペンギン', N'Chim cánh cụt')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (684, 10, N'いりぐち', N'Cửa vào ／ Lối vào')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (685, 10, N'でぐち', N'Cửa ra ／ Lối ra')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (686, 10, N'えさ', N'Mồi ／ Thức ăn cho động vật')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (687, 10, N'おなか', N'Bụng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (688, 10, N'かんらんしゃ', N'Xe tham quan')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (689, 10, N'バナナ', N'Chuối')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (690, 10, N'ボール', N'Bóng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (691, 10, N'～ たち', N'Các ~ ／ Bọn ~ ／ Chúng ~ ( Số nhiều )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (692, 10, N'あるきます', N'Đi bộ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (693, 10, N'とびます', N'Bay')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (694, 10, N'なります', N'Trở lên ／ Trở thành')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (695, 10, N'やすみます', N'Nghỉ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (696, 10, N'ベンチ', N'Ghế băng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (697, 10, N'やります', N'Cho ／ Làm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (698, 10, N'おなかがすきます', N'Đói')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (699, 10, N'のどがかわきます', N'Khát')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (700, 10, N'つかれます', N'Mệt')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (701, 10, N'かぜをひきます', N'Bị cảm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (702, 10, N'いたい', N'Đau')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (703, 10, N'くらい', N'Tối')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (704, 10, N'あかるい', N'Sáng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (705, 10, N'そろそろ', N'Sắp sửa ~ ／ Đến lúc phải ~')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (706, 10, N'ほんとうだ', N'Thật ( thể thường )')
GO
print 'Processed 700 total records'
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (707, 11, N'あたま', N'Đầu')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (708, 11, N'かいわ', N'Hội thoại')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (709, 11, N'さくぶん', N'Viết văn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (710, 11, N'クラスメイト', N'Bạn cùng lớp')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (711, 11, N'ざっし', N'Tạp chí')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (712, 11, N'ジョギング', N'Chạy bộ ( tập thể dục )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (713, 11, N'せいかつ', N'Sinh hoạt , cuộc sống')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (714, 11, N'てんちょう', N'Chủ cửa hàng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (715, 11, N'にっき', N'Nhật ký')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (716, 11, N'はじめ', N'Lúc đầu , ban đầu')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (717, 11, N'ひとりぐらし', N'Sống 1 mình')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (718, 11, N'へいじつ', N'Ngày thường')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (719, 11, N'まいしゅう', N'Hàng tuần')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (720, 11, N'おわります', N'Kết thúc')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (721, 11, N'かよいます', N'Đi làm ( nghề nghiệp )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (722, 11, N'ひきます', N'Đánh , gảy , chơi ( nhạc cụ )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (723, 11, N'なれます', N'Quen')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (724, 11, N'わすれます', N'Quên')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (725, 11, N'さんぽします', N'Đi dạo')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (726, 11, N'きびしい', N'Nghiêm khắc')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (727, 11, N'ねむい', N'Buồn ngủ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (728, 11, N'たいてい', N'Đại để ／ Đại khái')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (729, 11, N'なかなか', N'Mãi mà ~')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (730, 11, N'ええ', N'Ừ ／ Vâng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (731, 11, N'さびしい', N'Buồn ( cô đơn , lẻ loi )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (732, 11, N'オリンピック', N'Đại hội thể thao Olympic')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (733, 11, N'がいこく', N'Nước ngoài')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (734, 11, N'しょうがくせい', N'Học sinh tiểu học')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (735, 11, N'ちゅうがくせい', N'Học sinh trung học')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (736, 11, N'せんしゅ', N'Tuyển thủ ／ Vận động viên')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (737, 11, N'そふ', N'Ông')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (738, 11, N'はじめます', N'Bắt đầu')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (739, 11, N'わかれます', N'Chia tay')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (740, 11, N'そつぎょうします', N'Tốt nghiệp')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (741, 11, N'にゅうがくします', N'Nhập học')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (742, 11, N'だんだん', N'Dần dần')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (743, 11, N'はじめて', N'Lần đầu tiên')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (744, 11, N'それで', N'Vì thế ／ Vì vậy')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (745, 11, N'エアコン', N'Điều hòa')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (746, 11, N'ニュース', N'Tin tức')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (747, 11, N'つけます', N'Bật')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (748, 11, N'けします', N'Tắt')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (749, 11, N'ひっこしします', N'Chuyển nhà')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (750, 11, N'うん', N'Vâng ( thân mật )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (751, 11, N'ううん', N'Không ( thân mật )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (752, 11, N'ごめん', N'Xin lỗi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (753, 11, N'そっか', N'Thế à !')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (754, 11, N'また', N'Lại')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (755, 12, N'けが', N'Vết thương')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (756, 12, N'しょくよく', N'Sự thèm ăn ／ Sự ngon miệng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (757, 12, N'ちょうし', N'Tình trạng ( sức khỏe , máy móc )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (758, 12, N'ねつ', N'Nhiệt độ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (759, 12, N'ねつがあります', N'Bị sốt')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (760, 12, N'びょうき', N'Bệnh ／ Ốm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (761, 12, N'のど', N'Họng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (762, 12, N'は', N'Răng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (763, 12, N'のみかい', N'Bữa nhậu')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (764, 12, N'～ ど', N'~ độ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (765, 12, N'なおります', N'Khỏi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (766, 12, N'わるい', N'Xấu , tồi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (767, 12, N'きもちがわるい', N'Khó chịu ( tâm trạng xấu )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (768, 12, N'だいじょうぶ', N'Ổn , không sao')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (769, 12, N'はやく', N'Sớm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (770, 12, N'おかげさまで', N'Ơn trời ／ Nhờ trời')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (771, 12, N'おだいじに', N'Mau khỏe nhé ! ( nói với người ốm )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (772, 12, N'それはいけませんね', N'Thế thì gay go vất vả quá nhỉ ! ( ý chia sẻ )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (773, 12, N'シャワー', N'Vòi hoa sen')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (774, 12, N'すいみん', N'Giấc ngủ ／ việc ngủ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (775, 12, N'はいしゃ', N'Nha sĩ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (776, 12, N'やけど', N'Bỏng ／ Vết bỏng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (777, 12, N'こと', N'Việc')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (778, 12, N'もの', N'Vật ／ Đồ vật')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (779, 12, N'いじょう', N'Trên ／ Hơn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (780, 12, N'だします', N'Lấy ra ／ Đưa ra ／ Nộp')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (781, 12, N'こえをだします', N'Lên tiếng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (782, 12, N'ぬります', N'Sơn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (783, 12, N'あびます', N'Tắm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (784, 12, N'でかけます', N'Đi ra ngoài')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (785, 12, N'うんどうします', N'Tập thể dục')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (786, 12, N'かたい', N'Cứng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (787, 12, N'やわらかい', N'Mềm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (788, 12, N'からだにいい', N'Tốt cho cơ thể')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (789, 12, N'じぶんで', N'Tự mình')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (790, 12, N'できるだけ', N'Cố gắng hết sức')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (791, 12, N'ゆっくり', N'Thong thả ／ Từ từ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (792, 12, N'やくざいし', N'Dược sĩ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (793, 12, N'うわぎ', N'Áo khoác')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (794, 12, N'コンタクトレンズ', N'Kính áp tròng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (795, 12, N'せつめいしょ', N'Sách hướng dẫn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (796, 12, N'おふろ', N'Bồn tắm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (797, 12, N'ほけんしょう', N'Thẻ bảo hiểm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (798, 12, N'まちあいしつ', N'Phòng chờ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (799, 12, N'やっきょく', N'Hiệu thuốc')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (800, 12, N'ぬぎます', N'Cởi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (801, 12, N'はしります', N'Chạy')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (802, 12, N'まちます', N'Đợi ／ chờ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (803, 12, N'みがきます', N'Đánh ( răng )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (804, 12, N'よこになります', N'Nằm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (805, 12, N'じゅんびします', N'Chuẩn bị')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (806, 12, N'かゆい', N'Ngứa')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (807, 13, N'けいけん', N'Kinh nghiệm')
GO
print 'Processed 800 total records'
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (808, 13, N'こうよう', N'Lá đỏ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (809, 13, N'サービス', N'Dịch vụ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (810, 13, N'すもう', N'Vật Sumo')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (811, 13, N'ホテル', N'Khách sạn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (812, 13, N'しります', N'Biết')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (813, 13, N'デートします', N'Hẹn hò')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (814, 13, N'いっかいも ／ いちども', N'1 lần cũng ( không )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (815, 13, N'なんかいも ／ なんども', N'Rất nhiều lần')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (816, 13, N'おとこのひと', N'Đàn ông')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (817, 13, N'おんなのひと', N'Phụ nữ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (818, 13, N'みせ', N'Cửa hàng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (819, 13, N'ゆうえんち', N'Khu vui chơi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (820, 13, N'ジェットコースター', N'Tàu lượn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (821, 13, N'でんきせいひん', N'Đồ điện')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (822, 13, N'サングラス', N'Kính mát')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (823, 13, N'めがね', N'Kính')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (824, 13, N'シャツ', N'Áo sơ mi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (825, 13, N'スカート', N'Váy ngắn , juyp')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (826, 13, N'ネクタイ', N'Cà vạt')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (827, 13, N'ぼうし', N'Mũ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (828, 13, N'にんき', N'Sự được yêu thích , sự được mễn mộ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (829, 13, N'うります', N'Bán')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (830, 13, N'かぶります', N'Đội ( mũ )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (831, 13, N'とまります', N'Trọ lại , nghỉ lại')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (832, 13, N'はきます', N'Đi , xỏ ( quần , tất , giầy , váy ... )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (833, 13, N'かけます', N'Đeo , treo')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (834, 13, N'きます', N'Mặc')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (835, 13, N'ネクタイをします', N'Thắt cà vạt')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (836, 13, N'あおい', N'Xanh')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (837, 13, N'あかい', N'Đỏ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (838, 13, N'きいろい', N'Vàng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (839, 13, N'わかい', N'Trẻ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (840, 13, N'しんせん', N'Tươi , mới')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (841, 13, N'ざいりょう', N'Tài liệu , vật liệu')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (842, 13, N'ばしょ', N'Địa điểm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (843, 13, N'バスケットボール', N'Bóng rổ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (844, 13, N'ゆかた', N'Trang phục Yukata ( kimono mùa hè )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (845, 13, N'どこか', N'Chỗ nào đó')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (846, 13, N'れんしゅうします', N'Luyện tập')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (847, 13, N'みんなで', N'Tất cả mọi người')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (848, 13, N'じっしゅう', N'Thực tập')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (849, 13, N'こうじょう', N'Nhà máy')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (850, 14, N'うどん', N'Món mỳ udon')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (851, 14, N'そば', N'Món mỳ soba')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (852, 14, N'カイロ', N'Kairo ( vật bỏ túi để làm ấm cơ thể )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (853, 14, N'こたつ', N'Bàn có lò sưởi, lò than được đặt dưới bàn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (854, 14, N'じ', N'Chữ, ký tự')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (855, 14, N'しょっけん', N'Phiếu ăn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (856, 14, N'おつり', N'Tiên thừa, tiền trả lại')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (857, 14, N'でんき', N'Điện, đèn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (858, 14, N'ドア', N'Cửa ra vào')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (859, 14, N'とうがらし', N'Ớt')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (860, 14, N'ふうりん', N'Chuông gió')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (861, 14, N'ふとん', N'Chăn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (862, 14, N'ポケット', N'Túi quần, túi áo')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (863, 14, N'ボタン', N'Nút bấm ／ Khuy áo')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (864, 14, N'おゆ', N'Nước nóng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (865, 14, N'ゆたんぽ', N'Túi chườm ( ấm )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (866, 14, N'レバー', N'Cần gạt, đòn bẩy')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (867, 14, N'あきます', N'( cửa ) mở')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (868, 14, N'さわります', N'Chạm, sờ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (869, 14, N'つきます', N'( Đèn , thiết bị ) Bật ／ Sáng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (870, 14, N'まわします', N'Xoay, quay')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (871, 14, N'でます', N'( Nước , t iền ) Chảy ra ／ chạy ra ／ chui ra')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (872, 14, N'おつりがでます', N'Tiền thừa chui ra')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (873, 14, N'あれ', N'Ơ ? Gì vậy nhỉ ?')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (874, 14, N'いただきます', N'( Câu nói trước khi ăn uống )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (875, 14, N'おなかがいっぱいです', N'No bụng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (876, 14, N'ごちそうさまでした', N'( Câu nói sau khi ăn uống )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (877, 14, N'いか', N'Dưới đây, sau đây')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (878, 14, N'げんかん', N'Hiên nhà, sảnh trong nhà')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (879, 14, N'シートベルト', N'Seat belt, dây an toàn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (880, 14, N'ヘルメット', N'Mũ bảo hiểm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (881, 14, N'パスポート', N'Hộ chiếu')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (882, 14, N'みぶんしょう', N'Chứng minh thư, thẻ căn cước')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (883, 14, N'りょうきん', N'Phí, cước')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (884, 14, N'にゅうじょうりょう', N'Phí vào cửa')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (885, 14, N'ならびます', N'Xếp hàng, được xếp')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (886, 14, N'とめます', N'Dừng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (887, 14, N'わけます', N'Chia')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (888, 14, N'きちんと', N'Chỉn chu, cẩn thận')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (889, 14, N'そうなんですか', N'Vậy à ?')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (890, 14, N'ほら', N'Này này ! Nhìn này !')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (891, 14, N'いなか', N'Quê, nông thôn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (892, 14, N'とかい', N'Thành thị')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (893, 14, N'くうき', N'Không khí')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (894, 14, N'こうつう', N'Giao thông')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (895, 14, N'じきゅう', N'Lương theo giờ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (896, 14, N'じゆう', N'Tự do')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (897, 14, N'デザイン', N'Thiết kế')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (898, 14, N'ばんぐみ', N'Chương trình')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (899, 14, N'ファストフード', N'Đồ ăn nhanh')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (900, 14, N'ファッション', N'Thời trang')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (901, 14, N'フリープラン', N'Tour du lich ( chỉ có vé đi lại và chỗ ở )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (902, 14, N'おもいます', N'Nghĩ rằng ／ Cho rằng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (903, 14, N'けしょうします', N'Trang điểm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (904, 14, N'けいけんします', N'Trải nghiệm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (905, 14, N'うるさい', N'Ầm ĩ, ồn ào')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (906, 14, N'おしゃれ', N'Ăn diện , hợp thời trang ( ý chê bai thì thành Diêm dúa )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (907, 14, N'ふくざつ', N'Phức tạp')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (908, 14, N'べんり', N'Thuận tiện')
GO
print 'Processed 900 total records'
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (909, 14, N'ふべん', N'Bất tiện')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (910, 14, N'いつでも', N'Bất cứ khi nào')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (911, 14, N'いつまでも', N'Đến bất kỳ lúc nào ( MÃI MÃI )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (912, 14, N'～ について', N'Về ~')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (913, 14, N'わたしもそうおもいます', N'Tôi cũng nghĩ vậy .')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (914, 14, N'せいふく', N'Đồng phục')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (915, 14, N'バイク', N'Xe máy')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (916, 15, N'ガラス', N'Kính ／ Cốc thủy tinh')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (917, 15, N'くもり', N'Trời nhiều mây')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (918, 15, N'たいふう', N'Bão')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (919, 15, N'じしん', N'Động đất')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (920, 15, N'じこ', N'Sự cố, tai nạn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (921, 15, N'たいかい', N'Đại hội, lễ hội')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (922, 15, N'はなびたいかい', N'Lễ hội pháo hoa')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (923, 15, N'チーム', N'Đội, nhóm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (924, 15, N'ちゅうし', N'Hoãn, tạm dừng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (925, 15, N'フリーマーケット', N'Chợ trời')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (926, 15, N'ほんとう', N'Sự thật')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (927, 15, N'むかし', N'Ngày xưa')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (928, 15, N'むりょう', N'Miễn phí')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (929, 15, N'ゆうがた', N'Chiều tối, hoàng hôn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (930, 15, N'しにます', N'Chết')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (931, 15, N'なくなります', N'Mất, hết')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (932, 15, N'とまります', N'( máy )Dừng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (933, 15, N'はじまります', N'Bắt đầu ( tự bắt đầu )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (934, 15, N'ふります', N'Rơi ( mưa , tuyết )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (935, 15, N'かちます', N'Thắng, chiến thắng ( V )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (936, 15, N'まけます', N'Thua, thất bại ( V )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (937, 15, N'たおれます', N'Đổ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (938, 15, N'できます', N'Được hoàn thành, xong')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (939, 15, N'あたらしいみせができます', N'Cửa hàng mới được hoàn thành')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (940, 15, N'われます', N'Vỡ ( V )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (941, 15, N'けっこんします', N'Cưới, kết hôn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (942, 15, N'にゅういんします', N'Nhập viện')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (943, 15, N'こわい', N'Sợ ／ Đáng sợ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (944, 15, N'しんぱい', N'Lo lắng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (945, 15, N'かぜ', N'Gió')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (946, 15, N'ストラップ', N'Dây đeo vào điện thoại, máy ảnh')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (947, 15, N'せき', N'Chỗ ngồi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (948, 15, N'いそぎます', N'Vội vàng ( V )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (949, 15, N'こみます', N'Đông ( V )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (950, 15, N'まにあいます', N'Kịp')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (951, 15, N'やみます', N'Tạnh ( mưa )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (952, 15, N'はれます', N'Trời có nắng , trời đẹp ( V )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (953, 15, N'～ パーセント', N'~ Phần trăm')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (954, 15, N'びき', N'Giảm giá')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (955, 15, N'１０パーセントびき', N'Giảm giá 10%')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (956, 15, N'つよい', N'Mạnh')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (957, 15, N'きっと', N'Chắc chắn')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (958, 15, N'たぶん', N'Có lẽ')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (959, 15, N'もし', N'Nếu')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (960, 15, N'あつまります', N'Tập trung, tụ họp lại')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (961, 15, N'しまります', N'( cửa ) Đóng')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (962, 15, N'すきます', N'Vắng ／ Rỗng ( V )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (963, 15, N'おちます', N'Rơi')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (964, 15, N'きえます', N'( đèn ) Tắt ／ Biến mất')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (965, 15, N'こわれます', N'Hỏng ( V )')
INSERT [dbo].[Vocabulary] ([ID], [LessonID], [Term], [Definition]) VALUES (966, 15, N'よごれます', N'Bẩn, vấy bẩn ( V )')
SET IDENTITY_INSERT [dbo].[Vocabulary] OFF
/****** Object:  Table [dbo].[Quiz]    Script Date: 03/23/2017 23:32:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LessonID] [int] NOT NULL,
	[Question] [ntext] NOT NULL,
	[Answer1] [nvarchar](100) NOT NULL,
	[Answer2] [nvarchar](100) NOT NULL,
	[Answer3] [nvarchar](100) NOT NULL,
	[CorrectAnswer] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Quiz] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Quiz] ON
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (1, 1, N'あなたのたんじょうびは　＿ですか。
・・・くがつよっかです。', N'だれ', N'なん', N'どちら', N'いつ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (2, 1, N'いけだ＿　のしごとは　＿です。', N'きょうし、せんせい', N'せんせい、せんせい', N'きょうし、きょうし', N'せんせい、きょうし')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (3, 1, N'これは　＿ですか。', N'いつ', N'だれ', N'どちら', N'なん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (4, 1, N'ナムさんの　おくには　＿ですか。', N'いつ', N'だれ', N'なん', N'どちら')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (5, 1, N'クァンさんは　ハンサムです。ハイさん＿　ハンサムです。', N'は', N'の', N'と', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (6, 1, N'クィンちゃんの　いぬ＿　かわいいです。', N'も', N'の', N'と', N'は')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (7, 1, N'キェンさんは　ベトナムの　＿です。', N'いぬ', N'ねこ', N'ハノイ', N'がくせい')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (8, 1, N'タインさんは　FPTの　＿ですか。
・・・いいえ、しゃいんではありません。', N'がくせい', N'せんせい', N'こうむいん', N'しゃいん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (9, 1, N'にほんの　こどものひは　いつですか。
・・・＿です。', N'６がつ１日', N'７がつ７日', N'３月３日', N'５月５日')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (10, 1, N'ハーさんの　しゅみは　なんですか。
・・・どくしょ＿　サッカーです。', N'の', N'も', N'は', N'と')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (11, 1, N'いけださんは　がくせいですか。
・・・いいえ、＿です。', N'そうです', N'がくせいです', N'せんせいではありません', N'ちがいます')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (12, 1, N'ハイさんは　＿ですか。
・・・１５です。', N'なんかい', N'なんがつ', N'なんにち', N'なんさい')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (13, 1, N'すみません、＿ほんは　いくらですか。
・・・１００えんです。', N'これ', N'こちら', N'ここ', N'この')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (14, 1, N'ハーさん、＿は　なんですか。
・・・かいしゃいんです。', N'おくに', N'おかね', N'おすし', N'おしごと')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (15, 1, N'すみません、トイレは　＿ですか。
・・・あちらです。', N'どちら', N'いつ', N'だれ', N'どこ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (16, 1, N'あれは　＿ですか。
・・・あ、かばんです。', N'だれ', N'どこ', N'いつ', N'なん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (17, 1, N'あのほんは　＿ですか。
・・・ミンさんのです。', N'どこの', N'なんの', N'いくら', N'だれの')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (18, 1, N'「にほんご」は　＿で　なんですか。
・・・「Japanese」です。', N'アメリカご', N'フランスご', N'ベトナムご', N'えいご')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (19, 1, N'カレー＿　ふたつと　すし＿　みっつ＿　ください。', N'を、を、を', N'を、を、は', N'は、は、を', N'を、を、X')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (20, 1, N'そのほんは　＿ほんですか。
・・・まんがです。', N'どこの', N'だれの', N'なにの', N'なんの')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (21, 1, N'ハイさん、まいにち　＿　おきますか。
・・・ろくじに　おきます。', N'なんじ', N'なんじで', N'なんふん', N'なんじに')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (22, 1, N'としょかんは　＿から　＿まで　やすみます。', N'げつようび、きんようび', N'ハノイ、ホーチミン', N'きょう、きのう', N'どようび、にちようび')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (23, 1, N'ミンさんは　ハノイ＿　いきますか。
・・・はい、いきます。', N'を', N'で', N'は', N'へ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (24, 1, N'きのう、こうえん＿　あそびましたか。
・・・いいえ、あそびませんでした。', N'へ', N'を', N'は', N'で')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (25, 1, N'わたしのしゅみは　どくしょ＿　すいえい＿です。', N'と、と', N'や、など', N'と、を', N'と、X')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (26, 1, N'わたしは　サッカー＿　テニス＿を　します。', N'と、と', N'と、は', N'は、と', N'や、など')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (27, 1, N'きのう、わたしは　どこ＿　いきませんでした。', N'へ', N'に', N'を', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (28, 1, N'あした　やすみです。わたしは　なに＿　しません。うちに　います。', N'を', N'をも', N'が', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (29, 1, N'みなさん　あした　＿　あそびに　いきますか。', N'で', N'に', N'は', N'へ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (30, 1, N'あそこ＿　うたを　うたいましたか。', N'に', N'へ', N'は', N'で')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (31, 2, N'あなたのたんじょうびは　＿ですか。
・・・くがつよっかです。', N'だれ', N'なん', N'どちら', N'いつ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (32, 2, N'いけだ＿　のしごとは　＿です。', N'きょうし、せんせい', N'せんせい、せんせい', N'きょうし、きょうし', N'せんせい、きょうし')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (33, 2, N'これは　＿ですか。', N'いつ', N'だれ', N'どちら', N'なん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (34, 2, N'ナムさんの　おくには　＿ですか。', N'いつ', N'だれ', N'なん', N'どちら')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (35, 2, N'クァンさんは　ハンサムです。ハイさん＿　ハンサムです。', N'は', N'の', N'と', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (36, 2, N'クィンちゃんの　いぬ＿　かわいいです。', N'も', N'の', N'と', N'は')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (37, 2, N'キェンさんは　ベトナムの　＿です。', N'いぬ', N'ねこ', N'ハノイ', N'がくせい')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (38, 2, N'タインさんは　FPTの　＿ですか。
・・・いいえ、しゃいんではありません。', N'がくせい', N'せんせい', N'こうむいん', N'しゃいん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (39, 2, N'にほんの　こどものひは　いつですか。
・・・＿です。', N'６がつ１日', N'７がつ７日', N'３月３日', N'５月５日')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (40, 2, N'ハーさんの　しゅみは　なんですか。
・・・どくしょ＿　サッカーです。', N'の', N'も', N'は', N'と')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (41, 2, N'いけださんは　がくせいですか。
・・・いいえ、＿です。', N'そうです', N'がくせいです', N'せんせいではありません', N'ちがいます')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (42, 2, N'ハイさんは　＿ですか。
・・・１５です。', N'なんかい', N'なんがつ', N'なんにち', N'なんさい')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (43, 2, N'すみません、＿ほんは　いくらですか。
・・・１００えんです。', N'これ', N'こちら', N'ここ', N'この')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (44, 2, N'ハーさん、＿は　なんですか。
・・・かいしゃいんです。', N'おくに', N'おかね', N'おすし', N'おしごと')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (45, 2, N'すみません、トイレは　＿ですか。
・・・あちらです。', N'どちら', N'いつ', N'だれ', N'どこ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (46, 2, N'あれは　＿ですか。
・・・あ、かばんです。', N'だれ', N'どこ', N'いつ', N'なん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (47, 2, N'あのほんは　＿ですか。
・・・ミンさんのです。', N'どこの', N'なんの', N'いくら', N'だれの')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (48, 2, N'「にほんご」は　＿で　なんですか。
・・・「Japanese」です。', N'アメリカご', N'フランスご', N'ベトナムご', N'えいご')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (49, 2, N'カレー＿　ふたつと　すし＿　みっつ＿　ください。', N'を、を、を', N'を、を、は', N'は、は、を', N'を、を、X')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (50, 2, N'そのほんは　＿ほんですか。
・・・まんがです。', N'どこの', N'だれの', N'なにの', N'なんの')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (51, 2, N'ハイさん、まいにち　＿　おきますか。
・・・ろくじに　おきます。', N'なんじ', N'なんじで', N'なんふん', N'なんじに')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (52, 2, N'としょかんは　＿から　＿まで　やすみます。', N'げつようび、きんようび', N'ハノイ、ホーチミン', N'きょう、きのう', N'どようび、にちようび')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (53, 2, N'ミンさんは　ハノイ＿　いきますか。
・・・はい、いきます。', N'を', N'で', N'は', N'へ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (54, 2, N'きのう、こうえん＿　あそびましたか。
・・・いいえ、あそびませんでした。', N'へ', N'を', N'は', N'で')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (55, 2, N'わたしのしゅみは　どくしょ＿　すいえい＿です。', N'と、と', N'や、など', N'と、を', N'と、X')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (56, 2, N'わたしは　サッカー＿　テニス＿を　します。', N'と、と', N'と、は', N'は、と', N'や、など')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (57, 2, N'きのう、わたしは　どこ＿　いきませんでした。', N'へ', N'に', N'を', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (58, 2, N'あした　やすみです。わたしは　なに＿　しません。うちに　います。', N'を', N'をも', N'が', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (59, 2, N'みなさん　あした　＿　あそびに　いきますか。', N'で', N'に', N'は', N'へ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (60, 2, N'あそこ＿　うたを　うたいましたか。', N'に', N'へ', N'は', N'で')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (61, 3, N'あなたのたんじょうびは　＿ですか。
・・・くがつよっかです。', N'だれ', N'なん', N'どちら', N'いつ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (62, 3, N'いけだ＿　のしごとは　＿です。', N'きょうし、せんせい', N'せんせい、せんせい', N'きょうし、きょうし', N'せんせい、きょうし')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (63, 3, N'これは　＿ですか。', N'いつ', N'だれ', N'どちら', N'なん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (64, 3, N'ナムさんの　おくには　＿ですか。', N'いつ', N'だれ', N'なん', N'どちら')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (65, 3, N'クァンさんは　ハンサムです。ハイさん＿　ハンサムです。', N'は', N'の', N'と', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (66, 3, N'クィンちゃんの　いぬ＿　かわいいです。', N'も', N'の', N'と', N'は')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (67, 3, N'キェンさんは　ベトナムの　＿です。', N'いぬ', N'ねこ', N'ハノイ', N'がくせい')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (68, 3, N'タインさんは　FPTの　＿ですか。
・・・いいえ、しゃいんではありません。', N'がくせい', N'せんせい', N'こうむいん', N'しゃいん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (69, 3, N'にほんの　こどものひは　いつですか。
・・・＿です。', N'６がつ１日', N'７がつ７日', N'３月３日', N'５月５日')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (70, 3, N'ハーさんの　しゅみは　なんですか。
・・・どくしょ＿　サッカーです。', N'の', N'も', N'は', N'と')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (71, 3, N'いけださんは　がくせいですか。
・・・いいえ、＿です。', N'そうです', N'がくせいです', N'せんせいではありません', N'ちがいます')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (72, 3, N'ハイさんは　＿ですか。
・・・１５です。', N'なんかい', N'なんがつ', N'なんにち', N'なんさい')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (73, 3, N'すみません、＿ほんは　いくらですか。
・・・１００えんです。', N'これ', N'こちら', N'ここ', N'この')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (74, 3, N'ハーさん、＿は　なんですか。
・・・かいしゃいんです。', N'おくに', N'おかね', N'おすし', N'おしごと')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (75, 3, N'すみません、トイレは　＿ですか。
・・・あちらです。', N'どちら', N'いつ', N'だれ', N'どこ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (76, 3, N'あれは　＿ですか。
・・・あ、かばんです。', N'だれ', N'どこ', N'いつ', N'なん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (77, 3, N'あのほんは　＿ですか。
・・・ミンさんのです。', N'どこの', N'なんの', N'いくら', N'だれの')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (78, 3, N'「にほんご」は　＿で　なんですか。
・・・「Japanese」です。', N'アメリカご', N'フランスご', N'ベトナムご', N'えいご')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (79, 3, N'カレー＿　ふたつと　すし＿　みっつ＿　ください。', N'を、を、を', N'を、を、は', N'は、は、を', N'を、を、X')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (80, 3, N'そのほんは　＿ほんですか。
・・・まんがです。', N'どこの', N'だれの', N'なにの', N'なんの')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (81, 3, N'ハイさん、まいにち　＿　おきますか。
・・・ろくじに　おきます。', N'なんじ', N'なんじで', N'なんふん', N'なんじに')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (82, 3, N'としょかんは　＿から　＿まで　やすみます。', N'げつようび、きんようび', N'ハノイ、ホーチミン', N'きょう、きのう', N'どようび、にちようび')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (83, 3, N'ミンさんは　ハノイ＿　いきますか。
・・・はい、いきます。', N'を', N'で', N'は', N'へ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (84, 3, N'きのう、こうえん＿　あそびましたか。
・・・いいえ、あそびませんでした。', N'へ', N'を', N'は', N'で')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (85, 3, N'わたしのしゅみは　どくしょ＿　すいえい＿です。', N'と、と', N'や、など', N'と、を', N'と、X')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (86, 3, N'わたしは　サッカー＿　テニス＿を　します。', N'と、と', N'と、は', N'は、と', N'や、など')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (87, 3, N'きのう、わたしは　どこ＿　いきませんでした。', N'へ', N'に', N'を', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (88, 3, N'あした　やすみです。わたしは　なに＿　しません。うちに　います。', N'を', N'をも', N'が', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (89, 3, N'みなさん　あした　＿　あそびに　いきますか。', N'で', N'に', N'は', N'へ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (90, 3, N'あそこ＿　うたを　うたいましたか。', N'に', N'へ', N'は', N'で')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (91, 4, N'あなたのたんじょうびは　＿ですか。
・・・くがつよっかです。', N'だれ', N'なん', N'どちら', N'いつ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (92, 4, N'いけだ＿　のしごとは　＿です。', N'きょうし、せんせい', N'せんせい、せんせい', N'きょうし、きょうし', N'せんせい、きょうし')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (93, 4, N'これは　＿ですか。', N'いつ', N'だれ', N'どちら', N'なん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (94, 4, N'ナムさんの　おくには　＿ですか。', N'いつ', N'だれ', N'なん', N'どちら')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (95, 4, N'クァンさんは　ハンサムです。ハイさん＿　ハンサムです。', N'は', N'の', N'と', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (96, 4, N'クィンちゃんの　いぬ＿　かわいいです。', N'も', N'の', N'と', N'は')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (97, 4, N'キェンさんは　ベトナムの　＿です。', N'いぬ', N'ねこ', N'ハノイ', N'がくせい')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (98, 4, N'タインさんは　FPTの　＿ですか。
・・・いいえ、しゃいんではありません。', N'がくせい', N'せんせい', N'こうむいん', N'しゃいん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (99, 4, N'にほんの　こどものひは　いつですか。
・・・＿です。', N'６がつ１日', N'７がつ７日', N'３月３日', N'５月５日')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (100, 4, N'ハーさんの　しゅみは　なんですか。
・・・どくしょ＿　サッカーです。', N'の', N'も', N'は', N'と')
GO
print 'Processed 100 total records'
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (101, 4, N'いけださんは　がくせいですか。
・・・いいえ、＿です。', N'そうです', N'がくせいです', N'せんせいではありません', N'ちがいます')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (102, 4, N'ハイさんは　＿ですか。
・・・１５です。', N'なんかい', N'なんがつ', N'なんにち', N'なんさい')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (103, 4, N'すみません、＿ほんは　いくらですか。
・・・１００えんです。', N'これ', N'こちら', N'ここ', N'この')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (104, 4, N'ハーさん、＿は　なんですか。
・・・かいしゃいんです。', N'おくに', N'おかね', N'おすし', N'おしごと')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (105, 4, N'すみません、トイレは　＿ですか。
・・・あちらです。', N'どちら', N'いつ', N'だれ', N'どこ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (106, 4, N'あれは　＿ですか。
・・・あ、かばんです。', N'だれ', N'どこ', N'いつ', N'なん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (107, 4, N'あのほんは　＿ですか。
・・・ミンさんのです。', N'どこの', N'なんの', N'いくら', N'だれの')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (108, 4, N'「にほんご」は　＿で　なんですか。
・・・「Japanese」です。', N'アメリカご', N'フランスご', N'ベトナムご', N'えいご')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (109, 4, N'カレー＿　ふたつと　すし＿　みっつ＿　ください。', N'を、を、を', N'を、を、は', N'は、は、を', N'を、を、X')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (110, 4, N'そのほんは　＿ほんですか。
・・・まんがです。', N'どこの', N'だれの', N'なにの', N'なんの')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (111, 4, N'ハイさん、まいにち　＿　おきますか。
・・・ろくじに　おきます。', N'なんじ', N'なんじで', N'なんふん', N'なんじに')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (112, 4, N'としょかんは　＿から　＿まで　やすみます。', N'げつようび、きんようび', N'ハノイ、ホーチミン', N'きょう、きのう', N'どようび、にちようび')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (113, 4, N'ミンさんは　ハノイ＿　いきますか。
・・・はい、いきます。', N'を', N'で', N'は', N'へ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (114, 4, N'きのう、こうえん＿　あそびましたか。
・・・いいえ、あそびませんでした。', N'へ', N'を', N'は', N'で')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (115, 4, N'わたしのしゅみは　どくしょ＿　すいえい＿です。', N'と、と', N'や、など', N'と、を', N'と、X')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (116, 4, N'わたしは　サッカー＿　テニス＿を　します。', N'と、と', N'と、は', N'は、と', N'や、など')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (117, 4, N'きのう、わたしは　どこ＿　いきませんでした。', N'へ', N'に', N'を', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (118, 4, N'あした　やすみです。わたしは　なに＿　しません。うちに　います。', N'を', N'をも', N'が', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (119, 4, N'みなさん　あした　＿　あそびに　いきますか。', N'で', N'に', N'は', N'へ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (120, 4, N'あそこ＿　うたを　うたいましたか。', N'に', N'へ', N'は', N'で')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (121, 5, N'あなたのたんじょうびは　＿ですか。
・・・くがつよっかです。', N'だれ', N'なん', N'どちら', N'いつ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (122, 5, N'いけだ＿　のしごとは　＿です。', N'きょうし、せんせい', N'せんせい、せんせい', N'きょうし、きょうし', N'せんせい、きょうし')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (123, 5, N'これは　＿ですか。', N'いつ', N'だれ', N'どちら', N'なん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (124, 5, N'ナムさんの　おくには　＿ですか。', N'いつ', N'だれ', N'なん', N'どちら')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (125, 5, N'クァンさんは　ハンサムです。ハイさん＿　ハンサムです。', N'は', N'の', N'と', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (126, 5, N'クィンちゃんの　いぬ＿　かわいいです。', N'も', N'の', N'と', N'は')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (127, 5, N'キェンさんは　ベトナムの　＿です。', N'いぬ', N'ねこ', N'ハノイ', N'がくせい')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (128, 5, N'タインさんは　FPTの　＿ですか。
・・・いいえ、しゃいんではありません。', N'がくせい', N'せんせい', N'こうむいん', N'しゃいん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (129, 5, N'にほんの　こどものひは　いつですか。
・・・＿です。', N'６がつ１日', N'７がつ７日', N'３月３日', N'５月５日')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (130, 5, N'ハーさんの　しゅみは　なんですか。
・・・どくしょ＿　サッカーです。', N'の', N'も', N'は', N'と')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (131, 5, N'いけださんは　がくせいですか。
・・・いいえ、＿です。', N'そうです', N'がくせいです', N'せんせいではありません', N'ちがいます')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (132, 5, N'ハイさんは　＿ですか。
・・・１５です。', N'なんかい', N'なんがつ', N'なんにち', N'なんさい')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (133, 5, N'すみません、＿ほんは　いくらですか。
・・・１００えんです。', N'これ', N'こちら', N'ここ', N'この')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (134, 5, N'ハーさん、＿は　なんですか。
・・・かいしゃいんです。', N'おくに', N'おかね', N'おすし', N'おしごと')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (135, 5, N'すみません、トイレは　＿ですか。
・・・あちらです。', N'どちら', N'いつ', N'だれ', N'どこ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (136, 5, N'あれは　＿ですか。
・・・あ、かばんです。', N'だれ', N'どこ', N'いつ', N'なん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (137, 5, N'あのほんは　＿ですか。
・・・ミンさんのです。', N'どこの', N'なんの', N'いくら', N'だれの')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (138, 5, N'「にほんご」は　＿で　なんですか。
・・・「Japanese」です。', N'アメリカご', N'フランスご', N'ベトナムご', N'えいご')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (139, 5, N'カレー＿　ふたつと　すし＿　みっつ＿　ください。', N'を、を、を', N'を、を、は', N'は、は、を', N'を、を、X')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (140, 5, N'そのほんは　＿ほんですか。
・・・まんがです。', N'どこの', N'だれの', N'なにの', N'なんの')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (141, 5, N'ハイさん、まいにち　＿　おきますか。
・・・ろくじに　おきます。', N'なんじ', N'なんじで', N'なんふん', N'なんじに')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (142, 5, N'としょかんは　＿から　＿まで　やすみます。', N'げつようび、きんようび', N'ハノイ、ホーチミン', N'きょう、きのう', N'どようび、にちようび')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (143, 5, N'ミンさんは　ハノイ＿　いきますか。
・・・はい、いきます。', N'を', N'で', N'は', N'へ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (144, 5, N'きのう、こうえん＿　あそびましたか。
・・・いいえ、あそびませんでした。', N'へ', N'を', N'は', N'で')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (145, 5, N'わたしのしゅみは　どくしょ＿　すいえい＿です。', N'と、と', N'や、など', N'と、を', N'と、X')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (146, 5, N'わたしは　サッカー＿　テニス＿を　します。', N'と、と', N'と、は', N'は、と', N'や、など')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (147, 5, N'きのう、わたしは　どこ＿　いきませんでした。', N'へ', N'に', N'を', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (148, 5, N'あした　やすみです。わたしは　なに＿　しません。うちに　います。', N'を', N'をも', N'が', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (149, 5, N'みなさん　あした　＿　あそびに　いきますか。', N'で', N'に', N'は', N'へ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (150, 5, N'あそこ＿　うたを　うたいましたか。', N'に', N'へ', N'は', N'で')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (151, 6, N'あなたのたんじょうびは　＿ですか。
・・・くがつよっかです。', N'だれ', N'なん', N'どちら', N'いつ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (152, 6, N'いけだ＿　のしごとは　＿です。', N'きょうし、せんせい', N'せんせい、せんせい', N'きょうし、きょうし', N'せんせい、きょうし')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (153, 6, N'これは　＿ですか。', N'いつ', N'だれ', N'どちら', N'なん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (154, 6, N'ナムさんの　おくには　＿ですか。', N'いつ', N'だれ', N'なん', N'どちら')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (155, 6, N'クァンさんは　ハンサムです。ハイさん＿　ハンサムです。', N'は', N'の', N'と', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (156, 6, N'クィンちゃんの　いぬ＿　かわいいです。', N'も', N'の', N'と', N'は')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (157, 6, N'キェンさんは　ベトナムの　＿です。', N'いぬ', N'ねこ', N'ハノイ', N'がくせい')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (158, 6, N'タインさんは　FPTの　＿ですか。
・・・いいえ、しゃいんではありません。', N'がくせい', N'せんせい', N'こうむいん', N'しゃいん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (159, 6, N'にほんの　こどものひは　いつですか。
・・・＿です。', N'６がつ１日', N'７がつ７日', N'３月３日', N'５月５日')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (160, 6, N'ハーさんの　しゅみは　なんですか。
・・・どくしょ＿　サッカーです。', N'の', N'も', N'は', N'と')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (161, 6, N'いけださんは　がくせいですか。
・・・いいえ、＿です。', N'そうです', N'がくせいです', N'せんせいではありません', N'ちがいます')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (162, 6, N'ハイさんは　＿ですか。
・・・１５です。', N'なんかい', N'なんがつ', N'なんにち', N'なんさい')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (163, 6, N'すみません、＿ほんは　いくらですか。
・・・１００えんです。', N'これ', N'こちら', N'ここ', N'この')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (164, 6, N'ハーさん、＿は　なんですか。
・・・かいしゃいんです。', N'おくに', N'おかね', N'おすし', N'おしごと')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (165, 6, N'すみません、トイレは　＿ですか。
・・・あちらです。', N'どちら', N'いつ', N'だれ', N'どこ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (166, 6, N'あれは　＿ですか。
・・・あ、かばんです。', N'だれ', N'どこ', N'いつ', N'なん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (167, 6, N'あのほんは　＿ですか。
・・・ミンさんのです。', N'どこの', N'なんの', N'いくら', N'だれの')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (168, 6, N'「にほんご」は　＿で　なんですか。
・・・「Japanese」です。', N'アメリカご', N'フランスご', N'ベトナムご', N'えいご')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (169, 6, N'カレー＿　ふたつと　すし＿　みっつ＿　ください。', N'を、を、を', N'を、を、は', N'は、は、を', N'を、を、X')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (170, 6, N'そのほんは　＿ほんですか。
・・・まんがです。', N'どこの', N'だれの', N'なにの', N'なんの')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (171, 6, N'ハイさん、まいにち　＿　おきますか。
・・・ろくじに　おきます。', N'なんじ', N'なんじで', N'なんふん', N'なんじに')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (172, 6, N'としょかんは　＿から　＿まで　やすみます。', N'げつようび、きんようび', N'ハノイ、ホーチミン', N'きょう、きのう', N'どようび、にちようび')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (173, 6, N'ミンさんは　ハノイ＿　いきますか。
・・・はい、いきます。', N'を', N'で', N'は', N'へ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (174, 6, N'きのう、こうえん＿　あそびましたか。
・・・いいえ、あそびませんでした。', N'へ', N'を', N'は', N'で')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (175, 6, N'わたしのしゅみは　どくしょ＿　すいえい＿です。', N'と、と', N'や、など', N'と、を', N'と、X')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (176, 6, N'わたしは　サッカー＿　テニス＿を　します。', N'と、と', N'と、は', N'は、と', N'や、など')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (177, 6, N'きのう、わたしは　どこ＿　いきませんでした。', N'へ', N'に', N'を', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (178, 6, N'あした　やすみです。わたしは　なに＿　しません。うちに　います。', N'を', N'をも', N'が', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (179, 6, N'みなさん　あした　＿　あそびに　いきますか。', N'で', N'に', N'は', N'へ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (180, 6, N'あそこ＿　うたを　うたいましたか。', N'に', N'へ', N'は', N'で')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (181, 7, N'あなたのたんじょうびは　＿ですか。
・・・くがつよっかです。', N'だれ', N'なん', N'どちら', N'いつ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (182, 7, N'いけだ＿　のしごとは　＿です。', N'きょうし、せんせい', N'せんせい、せんせい', N'きょうし、きょうし', N'せんせい、きょうし')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (183, 7, N'これは　＿ですか。', N'いつ', N'だれ', N'どちら', N'なん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (184, 7, N'ナムさんの　おくには　＿ですか。', N'いつ', N'だれ', N'なん', N'どちら')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (185, 7, N'クァンさんは　ハンサムです。ハイさん＿　ハンサムです。', N'は', N'の', N'と', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (186, 7, N'クィンちゃんの　いぬ＿　かわいいです。', N'も', N'の', N'と', N'は')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (187, 7, N'キェンさんは　ベトナムの　＿です。', N'いぬ', N'ねこ', N'ハノイ', N'がくせい')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (188, 7, N'タインさんは　FPTの　＿ですか。
・・・いいえ、しゃいんではありません。', N'がくせい', N'せんせい', N'こうむいん', N'しゃいん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (189, 7, N'にほんの　こどものひは　いつですか。
・・・＿です。', N'６がつ１日', N'７がつ７日', N'３月３日', N'５月５日')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (190, 7, N'ハーさんの　しゅみは　なんですか。
・・・どくしょ＿　サッカーです。', N'の', N'も', N'は', N'と')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (191, 7, N'いけださんは　がくせいですか。
・・・いいえ、＿です。', N'そうです', N'がくせいです', N'せんせいではありません', N'ちがいます')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (192, 7, N'ハイさんは　＿ですか。
・・・１５です。', N'なんかい', N'なんがつ', N'なんにち', N'なんさい')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (193, 7, N'すみません、＿ほんは　いくらですか。
・・・１００えんです。', N'これ', N'こちら', N'ここ', N'この')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (194, 7, N'ハーさん、＿は　なんですか。
・・・かいしゃいんです。', N'おくに', N'おかね', N'おすし', N'おしごと')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (195, 7, N'すみません、トイレは　＿ですか。
・・・あちらです。', N'どちら', N'いつ', N'だれ', N'どこ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (196, 7, N'あれは　＿ですか。
・・・あ、かばんです。', N'だれ', N'どこ', N'いつ', N'なん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (197, 7, N'あのほんは　＿ですか。
・・・ミンさんのです。', N'どこの', N'なんの', N'いくら', N'だれの')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (198, 7, N'「にほんご」は　＿で　なんですか。
・・・「Japanese」です。', N'アメリカご', N'フランスご', N'ベトナムご', N'えいご')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (199, 7, N'カレー＿　ふたつと　すし＿　みっつ＿　ください。', N'を、を、を', N'を、を、は', N'は、は、を', N'を、を、X')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (200, 7, N'そのほんは　＿ほんですか。
・・・まんがです。', N'どこの', N'だれの', N'なにの', N'なんの')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (201, 7, N'ハイさん、まいにち　＿　おきますか。
・・・ろくじに　おきます。', N'なんじ', N'なんじで', N'なんふん', N'なんじに')
GO
print 'Processed 200 total records'
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (202, 7, N'としょかんは　＿から　＿まで　やすみます。', N'げつようび、きんようび', N'ハノイ、ホーチミン', N'きょう、きのう', N'どようび、にちようび')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (203, 7, N'ミンさんは　ハノイ＿　いきますか。
・・・はい、いきます。', N'を', N'で', N'は', N'へ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (204, 7, N'きのう、こうえん＿　あそびましたか。
・・・いいえ、あそびませんでした。', N'へ', N'を', N'は', N'で')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (205, 7, N'わたしのしゅみは　どくしょ＿　すいえい＿です。', N'と、と', N'や、など', N'と、を', N'と、X')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (206, 7, N'わたしは　サッカー＿　テニス＿を　します。', N'と、と', N'と、は', N'は、と', N'や、など')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (207, 7, N'きのう、わたしは　どこ＿　いきませんでした。', N'へ', N'に', N'を', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (208, 7, N'あした　やすみです。わたしは　なに＿　しません。うちに　います。', N'を', N'をも', N'が', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (209, 7, N'みなさん　あした　＿　あそびに　いきますか。', N'で', N'に', N'は', N'へ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (210, 7, N'あそこ＿　うたを　うたいましたか。', N'に', N'へ', N'は', N'で')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (211, 8, N'あなたのたんじょうびは　＿ですか。
・・・くがつよっかです。', N'だれ', N'なん', N'どちら', N'いつ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (212, 8, N'いけだ＿　のしごとは　＿です。', N'きょうし、せんせい', N'せんせい、せんせい', N'きょうし、きょうし', N'せんせい、きょうし')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (213, 8, N'これは　＿ですか。', N'いつ', N'だれ', N'どちら', N'なん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (214, 8, N'ナムさんの　おくには　＿ですか。', N'いつ', N'だれ', N'なん', N'どちら')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (215, 8, N'クァンさんは　ハンサムです。ハイさん＿　ハンサムです。', N'は', N'の', N'と', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (216, 8, N'クィンちゃんの　いぬ＿　かわいいです。', N'も', N'の', N'と', N'は')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (217, 8, N'キェンさんは　ベトナムの　＿です。', N'いぬ', N'ねこ', N'ハノイ', N'がくせい')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (218, 8, N'タインさんは　FPTの　＿ですか。
・・・いいえ、しゃいんではありません。', N'がくせい', N'せんせい', N'こうむいん', N'しゃいん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (219, 8, N'にほんの　こどものひは　いつですか。
・・・＿です。', N'６がつ１日', N'７がつ７日', N'３月３日', N'５月５日')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (220, 8, N'ハーさんの　しゅみは　なんですか。
・・・どくしょ＿　サッカーです。', N'の', N'も', N'は', N'と')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (221, 8, N'いけださんは　がくせいですか。
・・・いいえ、＿です。', N'そうです', N'がくせいです', N'せんせいではありません', N'ちがいます')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (222, 8, N'ハイさんは　＿ですか。
・・・１５です。', N'なんかい', N'なんがつ', N'なんにち', N'なんさい')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (223, 8, N'すみません、＿ほんは　いくらですか。
・・・１００えんです。', N'これ', N'こちら', N'ここ', N'この')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (224, 8, N'ハーさん、＿は　なんですか。
・・・かいしゃいんです。', N'おくに', N'おかね', N'おすし', N'おしごと')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (225, 8, N'すみません、トイレは　＿ですか。
・・・あちらです。', N'どちら', N'いつ', N'だれ', N'どこ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (226, 8, N'あれは　＿ですか。
・・・あ、かばんです。', N'だれ', N'どこ', N'いつ', N'なん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (227, 8, N'あのほんは　＿ですか。
・・・ミンさんのです。', N'どこの', N'なんの', N'いくら', N'だれの')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (228, 8, N'「にほんご」は　＿で　なんですか。
・・・「Japanese」です。', N'アメリカご', N'フランスご', N'ベトナムご', N'えいご')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (229, 8, N'カレー＿　ふたつと　すし＿　みっつ＿　ください。', N'を、を、を', N'を、を、は', N'は、は、を', N'を、を、X')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (230, 8, N'そのほんは　＿ほんですか。
・・・まんがです。', N'どこの', N'だれの', N'なにの', N'なんの')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (231, 8, N'ハイさん、まいにち　＿　おきますか。
・・・ろくじに　おきます。', N'なんじ', N'なんじで', N'なんふん', N'なんじに')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (232, 8, N'としょかんは　＿から　＿まで　やすみます。', N'げつようび、きんようび', N'ハノイ、ホーチミン', N'きょう、きのう', N'どようび、にちようび')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (233, 8, N'ミンさんは　ハノイ＿　いきますか。
・・・はい、いきます。', N'を', N'で', N'は', N'へ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (234, 8, N'きのう、こうえん＿　あそびましたか。
・・・いいえ、あそびませんでした。', N'へ', N'を', N'は', N'で')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (235, 8, N'わたしのしゅみは　どくしょ＿　すいえい＿です。', N'と、と', N'や、など', N'と、を', N'と、X')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (236, 8, N'わたしは　サッカー＿　テニス＿を　します。', N'と、と', N'と、は', N'は、と', N'や、など')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (237, 8, N'きのう、わたしは　どこ＿　いきませんでした。', N'へ', N'に', N'を', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (238, 8, N'あした　やすみです。わたしは　なに＿　しません。うちに　います。', N'を', N'をも', N'が', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (239, 8, N'みなさん　あした　＿　あそびに　いきますか。', N'で', N'に', N'は', N'へ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (240, 8, N'あそこ＿　うたを　うたいましたか。', N'に', N'へ', N'は', N'で')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (241, 9, N'あなたのたんじょうびは　＿ですか。
・・・くがつよっかです。', N'だれ', N'なん', N'どちら', N'いつ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (242, 9, N'いけだ＿　のしごとは　＿です。', N'きょうし、せんせい', N'せんせい、せんせい', N'きょうし、きょうし', N'せんせい、きょうし')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (243, 9, N'これは　＿ですか。', N'いつ', N'だれ', N'どちら', N'なん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (244, 9, N'ナムさんの　おくには　＿ですか。', N'いつ', N'だれ', N'なん', N'どちら')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (245, 9, N'クァンさんは　ハンサムです。ハイさん＿　ハンサムです。', N'は', N'の', N'と', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (246, 9, N'クィンちゃんの　いぬ＿　かわいいです。', N'も', N'の', N'と', N'は')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (247, 9, N'キェンさんは　ベトナムの　＿です。', N'いぬ', N'ねこ', N'ハノイ', N'がくせい')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (248, 9, N'タインさんは　FPTの　＿ですか。
・・・いいえ、しゃいんではありません。', N'がくせい', N'せんせい', N'こうむいん', N'しゃいん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (249, 9, N'にほんの　こどものひは　いつですか。
・・・＿です。', N'６がつ１日', N'７がつ７日', N'３月３日', N'５月５日')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (250, 9, N'ハーさんの　しゅみは　なんですか。
・・・どくしょ＿　サッカーです。', N'の', N'も', N'は', N'と')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (251, 9, N'いけださんは　がくせいですか。
・・・いいえ、＿です。', N'そうです', N'がくせいです', N'せんせいではありません', N'ちがいます')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (252, 9, N'ハイさんは　＿ですか。
・・・１５です。', N'なんかい', N'なんがつ', N'なんにち', N'なんさい')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (253, 9, N'すみません、＿ほんは　いくらですか。
・・・１００えんです。', N'これ', N'こちら', N'ここ', N'この')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (254, 9, N'ハーさん、＿は　なんですか。
・・・かいしゃいんです。', N'おくに', N'おかね', N'おすし', N'おしごと')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (255, 9, N'すみません、トイレは　＿ですか。
・・・あちらです。', N'どちら', N'いつ', N'だれ', N'どこ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (256, 9, N'あれは　＿ですか。
・・・あ、かばんです。', N'だれ', N'どこ', N'いつ', N'なん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (257, 9, N'あのほんは　＿ですか。
・・・ミンさんのです。', N'どこの', N'なんの', N'いくら', N'だれの')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (258, 9, N'「にほんご」は　＿で　なんですか。
・・・「Japanese」です。', N'アメリカご', N'フランスご', N'ベトナムご', N'えいご')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (259, 9, N'カレー＿　ふたつと　すし＿　みっつ＿　ください。', N'を、を、を', N'を、を、は', N'は、は、を', N'を、を、X')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (260, 9, N'そのほんは　＿ほんですか。
・・・まんがです。', N'どこの', N'だれの', N'なにの', N'なんの')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (261, 9, N'ハイさん、まいにち　＿　おきますか。
・・・ろくじに　おきます。', N'なんじ', N'なんじで', N'なんふん', N'なんじに')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (262, 9, N'としょかんは　＿から　＿まで　やすみます。', N'げつようび、きんようび', N'ハノイ、ホーチミン', N'きょう、きのう', N'どようび、にちようび')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (263, 9, N'ミンさんは　ハノイ＿　いきますか。
・・・はい、いきます。', N'を', N'で', N'は', N'へ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (264, 9, N'きのう、こうえん＿　あそびましたか。
・・・いいえ、あそびませんでした。', N'へ', N'を', N'は', N'で')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (265, 9, N'わたしのしゅみは　どくしょ＿　すいえい＿です。', N'と、と', N'や、など', N'と、を', N'と、X')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (266, 9, N'わたしは　サッカー＿　テニス＿を　します。', N'と、と', N'と、は', N'は、と', N'や、など')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (267, 9, N'きのう、わたしは　どこ＿　いきませんでした。', N'へ', N'に', N'を', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (268, 9, N'あした　やすみです。わたしは　なに＿　しません。うちに　います。', N'を', N'をも', N'が', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (269, 9, N'みなさん　あした　＿　あそびに　いきますか。', N'で', N'に', N'は', N'へ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (270, 9, N'あそこ＿　うたを　うたいましたか。', N'に', N'へ', N'は', N'で')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (271, 10, N'あなたのたんじょうびは　＿ですか。
・・・くがつよっかです。', N'だれ', N'なん', N'どちら', N'いつ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (272, 10, N'いけだ＿　のしごとは　＿です。', N'きょうし、せんせい', N'せんせい、せんせい', N'きょうし、きょうし', N'せんせい、きょうし')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (273, 10, N'これは　＿ですか。', N'いつ', N'だれ', N'どちら', N'なん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (274, 10, N'ナムさんの　おくには　＿ですか。', N'いつ', N'だれ', N'なん', N'どちら')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (275, 10, N'クァンさんは　ハンサムです。ハイさん＿　ハンサムです。', N'は', N'の', N'と', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (276, 10, N'クィンちゃんの　いぬ＿　かわいいです。', N'も', N'の', N'と', N'は')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (277, 10, N'キェンさんは　ベトナムの　＿です。', N'いぬ', N'ねこ', N'ハノイ', N'がくせい')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (278, 10, N'タインさんは　FPTの　＿ですか。
・・・いいえ、しゃいんではありません。', N'がくせい', N'せんせい', N'こうむいん', N'しゃいん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (279, 10, N'にほんの　こどものひは　いつですか。
・・・＿です。', N'６がつ１日', N'７がつ７日', N'３月３日', N'５月５日')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (280, 10, N'ハーさんの　しゅみは　なんですか。
・・・どくしょ＿　サッカーです。', N'の', N'も', N'は', N'と')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (281, 10, N'いけださんは　がくせいですか。
・・・いいえ、＿です。', N'そうです', N'がくせいです', N'せんせいではありません', N'ちがいます')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (282, 10, N'ハイさんは　＿ですか。
・・・１５です。', N'なんかい', N'なんがつ', N'なんにち', N'なんさい')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (283, 10, N'すみません、＿ほんは　いくらですか。
・・・１００えんです。', N'これ', N'こちら', N'ここ', N'この')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (284, 10, N'ハーさん、＿は　なんですか。
・・・かいしゃいんです。', N'おくに', N'おかね', N'おすし', N'おしごと')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (285, 10, N'すみません、トイレは　＿ですか。
・・・あちらです。', N'どちら', N'いつ', N'だれ', N'どこ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (286, 10, N'あれは　＿ですか。
・・・あ、かばんです。', N'だれ', N'どこ', N'いつ', N'なん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (287, 10, N'あのほんは　＿ですか。
・・・ミンさんのです。', N'どこの', N'なんの', N'いくら', N'だれの')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (288, 10, N'「にほんご」は　＿で　なんですか。
・・・「Japanese」です。', N'アメリカご', N'フランスご', N'ベトナムご', N'えいご')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (289, 10, N'カレー＿　ふたつと　すし＿　みっつ＿　ください。', N'を、を、を', N'を、を、は', N'は、は、を', N'を、を、X')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (290, 10, N'そのほんは　＿ほんですか。
・・・まんがです。', N'どこの', N'だれの', N'なにの', N'なんの')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (291, 10, N'ハイさん、まいにち　＿　おきますか。
・・・ろくじに　おきます。', N'なんじ', N'なんじで', N'なんふん', N'なんじに')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (292, 10, N'としょかんは　＿から　＿まで　やすみます。', N'げつようび、きんようび', N'ハノイ、ホーチミン', N'きょう、きのう', N'どようび、にちようび')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (293, 10, N'ミンさんは　ハノイ＿　いきますか。
・・・はい、いきます。', N'を', N'で', N'は', N'へ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (294, 10, N'きのう、こうえん＿　あそびましたか。
・・・いいえ、あそびませんでした。', N'へ', N'を', N'は', N'で')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (295, 10, N'わたしのしゅみは　どくしょ＿　すいえい＿です。', N'と、と', N'や、など', N'と、を', N'と、X')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (296, 10, N'わたしは　サッカー＿　テニス＿を　します。', N'と、と', N'と、は', N'は、と', N'や、など')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (297, 10, N'きのう、わたしは　どこ＿　いきませんでした。', N'へ', N'に', N'を', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (298, 10, N'あした　やすみです。わたしは　なに＿　しません。うちに　います。', N'を', N'をも', N'が', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (299, 10, N'みなさん　あした　＿　あそびに　いきますか。', N'で', N'に', N'は', N'へ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (300, 10, N'あそこ＿　うたを　うたいましたか。', N'に', N'へ', N'は', N'で')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (301, 11, N'あなたのたんじょうびは　＿ですか。
・・・くがつよっかです。', N'だれ', N'なん', N'どちら', N'いつ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (302, 11, N'いけだ＿　のしごとは　＿です。', N'きょうし、せんせい', N'せんせい、せんせい', N'きょうし、きょうし', N'せんせい、きょうし')
GO
print 'Processed 300 total records'
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (303, 11, N'これは　＿ですか。', N'いつ', N'だれ', N'どちら', N'なん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (304, 11, N'ナムさんの　おくには　＿ですか。', N'いつ', N'だれ', N'なん', N'どちら')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (305, 11, N'クァンさんは　ハンサムです。ハイさん＿　ハンサムです。', N'は', N'の', N'と', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (306, 11, N'クィンちゃんの　いぬ＿　かわいいです。', N'も', N'の', N'と', N'は')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (307, 11, N'キェンさんは　ベトナムの　＿です。', N'いぬ', N'ねこ', N'ハノイ', N'がくせい')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (308, 11, N'タインさんは　FPTの　＿ですか。
・・・いいえ、しゃいんではありません。', N'がくせい', N'せんせい', N'こうむいん', N'しゃいん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (309, 11, N'にほんの　こどものひは　いつですか。
・・・＿です。', N'６がつ１日', N'７がつ７日', N'３月３日', N'５月５日')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (310, 11, N'ハーさんの　しゅみは　なんですか。
・・・どくしょ＿　サッカーです。', N'の', N'も', N'は', N'と')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (311, 11, N'いけださんは　がくせいですか。
・・・いいえ、＿です。', N'そうです', N'がくせいです', N'せんせいではありません', N'ちがいます')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (312, 11, N'ハイさんは　＿ですか。
・・・１５です。', N'なんかい', N'なんがつ', N'なんにち', N'なんさい')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (313, 11, N'すみません、＿ほんは　いくらですか。
・・・１００えんです。', N'これ', N'こちら', N'ここ', N'この')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (314, 11, N'ハーさん、＿は　なんですか。
・・・かいしゃいんです。', N'おくに', N'おかね', N'おすし', N'おしごと')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (315, 11, N'すみません、トイレは　＿ですか。
・・・あちらです。', N'どちら', N'いつ', N'だれ', N'どこ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (316, 11, N'あれは　＿ですか。
・・・あ、かばんです。', N'だれ', N'どこ', N'いつ', N'なん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (317, 11, N'あのほんは　＿ですか。
・・・ミンさんのです。', N'どこの', N'なんの', N'いくら', N'だれの')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (318, 11, N'「にほんご」は　＿で　なんですか。
・・・「Japanese」です。', N'アメリカご', N'フランスご', N'ベトナムご', N'えいご')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (319, 11, N'カレー＿　ふたつと　すし＿　みっつ＿　ください。', N'を、を、を', N'を、を、は', N'は、は、を', N'を、を、X')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (320, 11, N'そのほんは　＿ほんですか。
・・・まんがです。', N'どこの', N'だれの', N'なにの', N'なんの')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (321, 11, N'ハイさん、まいにち　＿　おきますか。
・・・ろくじに　おきます。', N'なんじ', N'なんじで', N'なんふん', N'なんじに')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (322, 11, N'としょかんは　＿から　＿まで　やすみます。', N'げつようび、きんようび', N'ハノイ、ホーチミン', N'きょう、きのう', N'どようび、にちようび')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (323, 11, N'ミンさんは　ハノイ＿　いきますか。
・・・はい、いきます。', N'を', N'で', N'は', N'へ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (324, 11, N'きのう、こうえん＿　あそびましたか。
・・・いいえ、あそびませんでした。', N'へ', N'を', N'は', N'で')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (325, 11, N'わたしのしゅみは　どくしょ＿　すいえい＿です。', N'と、と', N'や、など', N'と、を', N'と、X')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (326, 11, N'わたしは　サッカー＿　テニス＿を　します。', N'と、と', N'と、は', N'は、と', N'や、など')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (327, 11, N'きのう、わたしは　どこ＿　いきませんでした。', N'へ', N'に', N'を', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (328, 11, N'あした　やすみです。わたしは　なに＿　しません。うちに　います。', N'を', N'をも', N'が', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (329, 11, N'みなさん　あした　＿　あそびに　いきますか。', N'で', N'に', N'は', N'へ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (330, 11, N'あそこ＿　うたを　うたいましたか。', N'に', N'へ', N'は', N'で')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (331, 12, N'あなたのたんじょうびは　＿ですか。
・・・くがつよっかです。', N'だれ', N'なん', N'どちら', N'いつ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (332, 12, N'いけだ＿　のしごとは　＿です。', N'きょうし、せんせい', N'せんせい、せんせい', N'きょうし、きょうし', N'せんせい、きょうし')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (333, 12, N'これは　＿ですか。', N'いつ', N'だれ', N'どちら', N'なん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (334, 12, N'ナムさんの　おくには　＿ですか。', N'いつ', N'だれ', N'なん', N'どちら')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (335, 12, N'クァンさんは　ハンサムです。ハイさん＿　ハンサムです。', N'は', N'の', N'と', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (336, 12, N'クィンちゃんの　いぬ＿　かわいいです。', N'も', N'の', N'と', N'は')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (337, 12, N'キェンさんは　ベトナムの　＿です。', N'いぬ', N'ねこ', N'ハノイ', N'がくせい')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (338, 12, N'タインさんは　FPTの　＿ですか。
・・・いいえ、しゃいんではありません。', N'がくせい', N'せんせい', N'こうむいん', N'しゃいん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (339, 12, N'にほんの　こどものひは　いつですか。
・・・＿です。', N'６がつ１日', N'７がつ７日', N'３月３日', N'５月５日')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (340, 12, N'ハーさんの　しゅみは　なんですか。
・・・どくしょ＿　サッカーです。', N'の', N'も', N'は', N'と')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (341, 12, N'いけださんは　がくせいですか。
・・・いいえ、＿です。', N'そうです', N'がくせいです', N'せんせいではありません', N'ちがいます')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (342, 12, N'ハイさんは　＿ですか。
・・・１５です。', N'なんかい', N'なんがつ', N'なんにち', N'なんさい')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (343, 12, N'すみません、＿ほんは　いくらですか。
・・・１００えんです。', N'これ', N'こちら', N'ここ', N'この')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (344, 12, N'ハーさん、＿は　なんですか。
・・・かいしゃいんです。', N'おくに', N'おかね', N'おすし', N'おしごと')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (345, 12, N'すみません、トイレは　＿ですか。
・・・あちらです。', N'どちら', N'いつ', N'だれ', N'どこ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (346, 12, N'あれは　＿ですか。
・・・あ、かばんです。', N'だれ', N'どこ', N'いつ', N'なん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (347, 12, N'あのほんは　＿ですか。
・・・ミンさんのです。', N'どこの', N'なんの', N'いくら', N'だれの')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (348, 12, N'「にほんご」は　＿で　なんですか。
・・・「Japanese」です。', N'アメリカご', N'フランスご', N'ベトナムご', N'えいご')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (349, 12, N'カレー＿　ふたつと　すし＿　みっつ＿　ください。', N'を、を、を', N'を、を、は', N'は、は、を', N'を、を、X')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (350, 12, N'そのほんは　＿ほんですか。
・・・まんがです。', N'どこの', N'だれの', N'なにの', N'なんの')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (351, 12, N'ハイさん、まいにち　＿　おきますか。
・・・ろくじに　おきます。', N'なんじ', N'なんじで', N'なんふん', N'なんじに')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (352, 12, N'としょかんは　＿から　＿まで　やすみます。', N'げつようび、きんようび', N'ハノイ、ホーチミン', N'きょう、きのう', N'どようび、にちようび')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (353, 12, N'ミンさんは　ハノイ＿　いきますか。
・・・はい、いきます。', N'を', N'で', N'は', N'へ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (354, 12, N'きのう、こうえん＿　あそびましたか。
・・・いいえ、あそびませんでした。', N'へ', N'を', N'は', N'で')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (355, 12, N'わたしのしゅみは　どくしょ＿　すいえい＿です。', N'と、と', N'や、など', N'と、を', N'と、X')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (356, 12, N'わたしは　サッカー＿　テニス＿を　します。', N'と、と', N'と、は', N'は、と', N'や、など')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (357, 12, N'きのう、わたしは　どこ＿　いきませんでした。', N'へ', N'に', N'を', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (358, 12, N'あした　やすみです。わたしは　なに＿　しません。うちに　います。', N'を', N'をも', N'が', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (359, 12, N'みなさん　あした　＿　あそびに　いきますか。', N'で', N'に', N'は', N'へ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (360, 12, N'あそこ＿　うたを　うたいましたか。', N'に', N'へ', N'は', N'で')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (361, 13, N'あなたのたんじょうびは　＿ですか。
・・・くがつよっかです。', N'だれ', N'なん', N'どちら', N'いつ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (362, 13, N'いけだ＿　のしごとは　＿です。', N'きょうし、せんせい', N'せんせい、せんせい', N'きょうし、きょうし', N'せんせい、きょうし')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (363, 13, N'これは　＿ですか。', N'いつ', N'だれ', N'どちら', N'なん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (364, 13, N'ナムさんの　おくには　＿ですか。', N'いつ', N'だれ', N'なん', N'どちら')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (365, 13, N'クァンさんは　ハンサムです。ハイさん＿　ハンサムです。', N'は', N'の', N'と', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (366, 13, N'クィンちゃんの　いぬ＿　かわいいです。', N'も', N'の', N'と', N'は')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (367, 13, N'キェンさんは　ベトナムの　＿です。', N'いぬ', N'ねこ', N'ハノイ', N'がくせい')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (368, 13, N'タインさんは　FPTの　＿ですか。
・・・いいえ、しゃいんではありません。', N'がくせい', N'せんせい', N'こうむいん', N'しゃいん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (369, 13, N'にほんの　こどものひは　いつですか。
・・・＿です。', N'６がつ１日', N'７がつ７日', N'３月３日', N'５月５日')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (370, 13, N'ハーさんの　しゅみは　なんですか。
・・・どくしょ＿　サッカーです。', N'の', N'も', N'は', N'と')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (371, 13, N'いけださんは　がくせいですか。
・・・いいえ、＿です。', N'そうです', N'がくせいです', N'せんせいではありません', N'ちがいます')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (372, 13, N'ハイさんは　＿ですか。
・・・１５です。', N'なんかい', N'なんがつ', N'なんにち', N'なんさい')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (373, 13, N'すみません、＿ほんは　いくらですか。
・・・１００えんです。', N'これ', N'こちら', N'ここ', N'この')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (374, 13, N'ハーさん、＿は　なんですか。
・・・かいしゃいんです。', N'おくに', N'おかね', N'おすし', N'おしごと')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (375, 13, N'すみません、トイレは　＿ですか。
・・・あちらです。', N'どちら', N'いつ', N'だれ', N'どこ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (376, 13, N'あれは　＿ですか。
・・・あ、かばんです。', N'だれ', N'どこ', N'いつ', N'なん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (377, 13, N'あのほんは　＿ですか。
・・・ミンさんのです。', N'どこの', N'なんの', N'いくら', N'だれの')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (378, 13, N'「にほんご」は　＿で　なんですか。
・・・「Japanese」です。', N'アメリカご', N'フランスご', N'ベトナムご', N'えいご')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (379, 13, N'カレー＿　ふたつと　すし＿　みっつ＿　ください。', N'を、を、を', N'を、を、は', N'は、は、を', N'を、を、X')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (380, 13, N'そのほんは　＿ほんですか。
・・・まんがです。', N'どこの', N'だれの', N'なにの', N'なんの')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (381, 13, N'ハイさん、まいにち　＿　おきますか。
・・・ろくじに　おきます。', N'なんじ', N'なんじで', N'なんふん', N'なんじに')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (382, 13, N'としょかんは　＿から　＿まで　やすみます。', N'げつようび、きんようび', N'ハノイ、ホーチミン', N'きょう、きのう', N'どようび、にちようび')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (383, 13, N'ミンさんは　ハノイ＿　いきますか。
・・・はい、いきます。', N'を', N'で', N'は', N'へ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (384, 13, N'きのう、こうえん＿　あそびましたか。
・・・いいえ、あそびませんでした。', N'へ', N'を', N'は', N'で')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (385, 13, N'わたしのしゅみは　どくしょ＿　すいえい＿です。', N'と、と', N'や、など', N'と、を', N'と、X')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (386, 13, N'わたしは　サッカー＿　テニス＿を　します。', N'と、と', N'と、は', N'は、と', N'や、など')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (387, 13, N'きのう、わたしは　どこ＿　いきませんでした。', N'へ', N'に', N'を', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (388, 13, N'あした　やすみです。わたしは　なに＿　しません。うちに　います。', N'を', N'をも', N'が', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (389, 13, N'みなさん　あした　＿　あそびに　いきますか。', N'で', N'に', N'は', N'へ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (390, 13, N'あそこ＿　うたを　うたいましたか。', N'に', N'へ', N'は', N'で')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (391, 14, N'あなたのたんじょうびは　＿ですか。
・・・くがつよっかです。', N'だれ', N'なん', N'どちら', N'いつ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (392, 14, N'いけだ＿　のしごとは　＿です。', N'きょうし、せんせい', N'せんせい、せんせい', N'きょうし、きょうし', N'せんせい、きょうし')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (393, 14, N'これは　＿ですか。', N'いつ', N'だれ', N'どちら', N'なん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (394, 14, N'ナムさんの　おくには　＿ですか。', N'いつ', N'だれ', N'なん', N'どちら')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (395, 14, N'クァンさんは　ハンサムです。ハイさん＿　ハンサムです。', N'は', N'の', N'と', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (396, 14, N'クィンちゃんの　いぬ＿　かわいいです。', N'も', N'の', N'と', N'は')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (397, 14, N'キェンさんは　ベトナムの　＿です。', N'いぬ', N'ねこ', N'ハノイ', N'がくせい')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (398, 14, N'タインさんは　FPTの　＿ですか。
・・・いいえ、しゃいんではありません。', N'がくせい', N'せんせい', N'こうむいん', N'しゃいん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (399, 14, N'にほんの　こどものひは　いつですか。
・・・＿です。', N'６がつ１日', N'７がつ７日', N'３月３日', N'５月５日')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (400, 14, N'ハーさんの　しゅみは　なんですか。
・・・どくしょ＿　サッカーです。', N'の', N'も', N'は', N'と')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (401, 14, N'いけださんは　がくせいですか。
・・・いいえ、＿です。', N'そうです', N'がくせいです', N'せんせいではありません', N'ちがいます')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (402, 14, N'ハイさんは　＿ですか。
・・・１５です。', N'なんかい', N'なんがつ', N'なんにち', N'なんさい')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (403, 14, N'すみません、＿ほんは　いくらですか。
・・・１００えんです。', N'これ', N'こちら', N'ここ', N'この')
GO
print 'Processed 400 total records'
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (404, 14, N'ハーさん、＿は　なんですか。
・・・かいしゃいんです。', N'おくに', N'おかね', N'おすし', N'おしごと')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (405, 14, N'すみません、トイレは　＿ですか。
・・・あちらです。', N'どちら', N'いつ', N'だれ', N'どこ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (406, 14, N'あれは　＿ですか。
・・・あ、かばんです。', N'だれ', N'どこ', N'いつ', N'なん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (407, 14, N'あのほんは　＿ですか。
・・・ミンさんのです。', N'どこの', N'なんの', N'いくら', N'だれの')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (408, 14, N'「にほんご」は　＿で　なんですか。
・・・「Japanese」です。', N'アメリカご', N'フランスご', N'ベトナムご', N'えいご')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (409, 14, N'カレー＿　ふたつと　すし＿　みっつ＿　ください。', N'を、を、を', N'を、を、は', N'は、は、を', N'を、を、X')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (410, 14, N'そのほんは　＿ほんですか。
・・・まんがです。', N'どこの', N'だれの', N'なにの', N'なんの')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (411, 14, N'ハイさん、まいにち　＿　おきますか。
・・・ろくじに　おきます。', N'なんじ', N'なんじで', N'なんふん', N'なんじに')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (412, 14, N'としょかんは　＿から　＿まで　やすみます。', N'げつようび、きんようび', N'ハノイ、ホーチミン', N'きょう、きのう', N'どようび、にちようび')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (413, 14, N'ミンさんは　ハノイ＿　いきますか。
・・・はい、いきます。', N'を', N'で', N'は', N'へ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (414, 14, N'きのう、こうえん＿　あそびましたか。
・・・いいえ、あそびませんでした。', N'へ', N'を', N'は', N'で')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (415, 14, N'わたしのしゅみは　どくしょ＿　すいえい＿です。', N'と、と', N'や、など', N'と、を', N'と、X')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (416, 14, N'わたしは　サッカー＿　テニス＿を　します。', N'と、と', N'と、は', N'は、と', N'や、など')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (417, 14, N'きのう、わたしは　どこ＿　いきませんでした。', N'へ', N'に', N'を', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (418, 14, N'あした　やすみです。わたしは　なに＿　しません。うちに　います。', N'を', N'をも', N'が', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (419, 14, N'みなさん　あした　＿　あそびに　いきますか。', N'で', N'に', N'は', N'へ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (420, 14, N'あそこ＿　うたを　うたいましたか。', N'に', N'へ', N'は', N'で')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (421, 15, N'あなたのたんじょうびは　＿ですか。
・・・くがつよっかです。', N'だれ', N'なん', N'どちら', N'いつ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (422, 15, N'いけだ＿　のしごとは　＿です。', N'きょうし、せんせい', N'せんせい、せんせい', N'きょうし、きょうし', N'せんせい、きょうし')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (423, 15, N'これは　＿ですか。', N'いつ', N'だれ', N'どちら', N'なん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (424, 15, N'ナムさんの　おくには　＿ですか。', N'いつ', N'だれ', N'なん', N'どちら')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (425, 15, N'クァンさんは　ハンサムです。ハイさん＿　ハンサムです。', N'は', N'の', N'と', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (426, 15, N'クィンちゃんの　いぬ＿　かわいいです。', N'も', N'の', N'と', N'は')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (427, 15, N'キェンさんは　ベトナムの　＿です。', N'いぬ', N'ねこ', N'ハノイ', N'がくせい')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (428, 15, N'タインさんは　FPTの　＿ですか。
・・・いいえ、しゃいんではありません。', N'がくせい', N'せんせい', N'こうむいん', N'しゃいん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (429, 15, N'にほんの　こどものひは　いつですか。
・・・＿です。', N'６がつ１日', N'７がつ７日', N'３月３日', N'５月５日')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (430, 15, N'ハーさんの　しゅみは　なんですか。
・・・どくしょ＿　サッカーです。', N'の', N'も', N'は', N'と')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (431, 15, N'いけださんは　がくせいですか。
・・・いいえ、＿です。', N'そうです', N'がくせいです', N'せんせいではありません', N'ちがいます')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (432, 15, N'ハイさんは　＿ですか。
・・・１５です。', N'なんかい', N'なんがつ', N'なんにち', N'なんさい')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (433, 15, N'すみません、＿ほんは　いくらですか。
・・・１００えんです。', N'これ', N'こちら', N'ここ', N'この')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (434, 15, N'ハーさん、＿は　なんですか。
・・・かいしゃいんです。', N'おくに', N'おかね', N'おすし', N'おしごと')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (435, 15, N'すみません、トイレは　＿ですか。
・・・あちらです。', N'どちら', N'いつ', N'だれ', N'どこ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (436, 15, N'あれは　＿ですか。
・・・あ、かばんです。', N'だれ', N'どこ', N'いつ', N'なん')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (437, 15, N'あのほんは　＿ですか。
・・・ミンさんのです。', N'どこの', N'なんの', N'いくら', N'だれの')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (438, 15, N'「にほんご」は　＿で　なんですか。
・・・「Japanese」です。', N'アメリカご', N'フランスご', N'ベトナムご', N'えいご')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (439, 15, N'カレー＿　ふたつと　すし＿　みっつ＿　ください。', N'を、を、を', N'を、を、は', N'は、は、を', N'を、を、X')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (440, 15, N'そのほんは　＿ほんですか。
・・・まんがです。', N'どこの', N'だれの', N'なにの', N'なんの')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (441, 15, N'ハイさん、まいにち　＿　おきますか。
・・・ろくじに　おきます。', N'なんじ', N'なんじで', N'なんふん', N'なんじに')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (442, 15, N'としょかんは　＿から　＿まで　やすみます。', N'げつようび、きんようび', N'ハノイ、ホーチミン', N'きょう、きのう', N'どようび、にちようび')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (443, 15, N'ミンさんは　ハノイ＿　いきますか。
・・・はい、いきます。', N'を', N'で', N'は', N'へ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (444, 15, N'きのう、こうえん＿　あそびましたか。
・・・いいえ、あそびませんでした。', N'へ', N'を', N'は', N'で')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (445, 15, N'わたしのしゅみは　どくしょ＿　すいえい＿です。', N'と、と', N'や、など', N'と、を', N'と、X')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (446, 15, N'わたしは　サッカー＿　テニス＿を　します。', N'と、と', N'と、は', N'は、と', N'や、など')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (447, 15, N'きのう、わたしは　どこ＿　いきませんでした。', N'へ', N'に', N'を', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (448, 15, N'あした　やすみです。わたしは　なに＿　しません。うちに　います。', N'を', N'をも', N'が', N'も')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (449, 15, N'みなさん　あした　＿　あそびに　いきますか。', N'で', N'に', N'は', N'へ')
INSERT [dbo].[Quiz] ([ID], [LessonID], [Question], [Answer1], [Answer2], [Answer3], [CorrectAnswer]) VALUES (450, 15, N'あそこ＿　うたを　うたいましたか。', N'に', N'へ', N'は', N'で')
SET IDENTITY_INSERT [dbo].[Quiz] OFF
/****** Object:  Table [dbo].[Kanji]    Script Date: 03/23/2017 23:32:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kanji](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LessonID] [int] NOT NULL,
	[Term] [ntext] NOT NULL,
	[Definition] [ntext] NOT NULL,
 CONSTRAINT [PK_Kanji] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Kanji] ON
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (1, 1, N'私 - TƯ', N'Âm ON: シ
Âm KUN: わたし／わたくし
Từ ghép:
私立大学（しりつだいがく）: đại học tư nhân
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (2, 1, N'人 - NHÂN', N'Âm ON: ジン／にん
Âm KUN: ひと
Từ ghép:
日本人（にほんじん）: người Nhật
3人（さんにん）: 3 người
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (3, 1, N'才 - TÀI', N'Âm ON: サイ
Âm KUN: 
Từ ghép:
４才（よんさい）:4 tuổi
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (4, 1, N'学 - HỌC', N'Âm ON: ガク
Âm KUN: 
Từ ghép: 
大学（だいがく） : trường đại học
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (5, 1, N'生 - SINH', N'Âm ON: セイ
Âm KUN: 
Từ ghép: 
学生（がくせい） : học sinh
先生（せんせい） : giáo viên
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (6, 1, N'校 - HIỆU', N'Âm ON: コウ
Âm KUN: 
Từ ghép: 
学校（がっこう） : trường học
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (7, 1, N'日 - NHẬT', N'Âm ON: ジツ
Âm KUN: ひ／び
Từ ghép:
ー日（ついたち） : ngày mồng một
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (8, 1, N'本 - BẢN', N'Âm ON: ホン
Âm KUN: 
Từ ghép: 
日本（にほん） : Nhật Bản
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (9, 1, N'語 - NGỮ', N'Âm ON: ゴ
Âm KUN: 
Từ ghép: 
日本語（にほんご） : tiếng Nhật
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (10, 2, N'一 - NHẤT', N'Âm ON: イチ
Âm KUN: ひと・つ
Từ ghép:
一日（いちにち）：một ngày
一日（ついたち）：ngày mùng 1
一人（ひとり）：một người
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (11, 2, N'二 - NHỊ', N'Âm ON: ニ
Âm KUN: ふた・つ
Từ ghép:
二日（ふつか）：ngày mùng 2 , 2 ngày
二人（ふたり）：2 người
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (12, 2, N'三 - TAM', N'Âm ON: サン
Âm KUN: みっ・つ
Từ ghép:
三日（みっか）：ngày mùng 3 , 3 ngày
三人（さんにん）：3 cái
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (13, 2, N'四 - TỨ', N'Âm ON: ヨン／ヨ
Âm KUN: よっ・つ
Từ ghép:
四日（よっか）：ngày mùng 4 , 4 ngày
四人（よにん）：4 người
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (14, 2, N'五 - NGŨ', N'Âm ON: ゴ
Âm KUN: いつ・つ
Từ ghép:
五日（いつか）：ngày mùng 5 , 5 ngày
五人（ごにん）：4 người
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (15, 2, N'六 - LỤC', N'Âm ON: ロク
Âm KUN: むっ・つ
Từ ghép:
六日（むいか）：ngày mùng 6 , 6 ngày
六人（ろくにん）：6 người
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (16, 2, N'七 - THẤT', N'Âm ON: シチ／ナナ
Âm KUN: なな・つ
Từ ghép:
七時（しちじ）：7 giờ
七人（ななにん）：7 người
七日（なのか）：mùng 7 , 7 ngày
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (17, 2, N'九 - CỬU', N'Âm ON: キュウ／ク
Âm KUN: ここの・つ
Từ ghép: 
九日（ここのか）：mùng 9 , 9 ngày
九時（くじ）：9 giờ
九番（きゅうばん）：số thứ 9
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (18, 2, N'十 - THẬP', N'Âm ON: ジュウ
Âm KUN: とお
Từ ghép:
十日（とおか）：ngày 10 , 10 ngày
十時（じゅうじ）：10 giờ
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (19, 2, N'百 - BÁCH', N'Âm ON: ヒャク
Âm KUN: 
Từ ghép:
百(さんびゃく）：300
八百（はっぴゃく）：800
六百（ろっぴゃく）：600
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (20, 2, N'千 - THIÊN', N'Âm ON: セン
Âm KUN:
Từ ghép:
千円（せんえん）：1 nghìn Yen
千年（せんねん）：1 nghìn năm
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (21, 2, N'万 - VẠN', N'Âm ON: マン
Âm KUN: 
Từ ghép:
一万（いちまん）：1 vạn
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (22, 2, N'円 - VIÊN', N'Âm ON: エン
Âm KUN: 
Từ ghép:
二千円（にせんえん）：2 nghìn Yen
一万円（いちまんえん）：10 nghìn Yen
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (23, 2, N'八 - BÁT', N'Âm ON: ハチ
Âm KUN:やっ・つ
Từ ghép:
八日（ようか）：mùng 8 , 8 ngày
八ばん（はちばん）：số thứ 8
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (24, 3, N'月 - NGUYỆT', N'Âm ON: ガツ／ゲツ
Âm KUN: つき
Từ ghép: 
月よう日（げつようび）：Thứ hai
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (25, 3, N'火 - HỎA', N'Âm ON: カ
Âm KUN: ひ
Từ ghép: 
火じ（かじ）：hỏa hoạn
火（ひ）：lửa
火よう日（かようび）：Thứ ba
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (26, 3, N'水 - THỦY', N'Âm ON: スイ
Âm KUN: みず
Từ ghép: 
水よう日（すいようび）：Thứ tư
水えい（すいえい）：Bơi lội
水（みず）：nước
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (27, 3, N'木 - MỘC', N'Âm ON: モク
Âm KUN: き
Từ ghép: 
木（き）：cây
木よう日（もくようび）：Thứ năm
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (28, 3, N'金 - KIM', N'Âm ON: キン
Âm KUN: かね
Từ ghép: 
お金（おかね）：tiền
金よう日（きにょうび）：Thứ sáu
お金もち（おかねもち）：người giàu
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (29, 3, N'土 - THỔ', N'Âm ON: ド／ト
Âm KUN: つち
Từ ghép: 
土（つち）：đất đai
土よう日（どようび）：Thứ bảy
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (30, 3, N'曜 - DIỆU', N'Âm ON: ヨウ
Âm KUN: 
Từ ghép: 
日曜日（にちようび）：Chủ nhật
～曜日（ようび）：ngày trong tuần
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (31, 3, N'何 - HÀ', N'Âm ON: カ
Âm KUN: なん／なに
Từ ghép: 
何日（なんにち）：ngày bao nhiêu ／ bao nhiêu ngày
何月（なんがつ）：tháng mấy
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (32, 3, N'年 - NIÊN', N'Âm ON: ネン
Âm KUN: とし
Từ ghép: 
一年生（いちねんせい）：sinh viên năm nhất, hs năm nhất
今年（ことし）：năm nay
去年（きょねん）：năm ngoái
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (33, 3, N'時 - THỜI, THÌ', N'Âm ON: ジ
Âm KUN: とき
Từ ghép: 
時々（ときどき）：thỉnh thoảng
時間（じかん）：thời gian
こどもの時（こどものとき）：hồi còn bé, lúc nhỏ
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (34, 3, N'間 - GIAN', N'Âm ON: カン／ケン
Âm KUN: あいだ、ま
Từ ghép: 
人間（にんげん）：nhân gian, loài người
この間（このあいだ）：khoảng thời gian này, thời gian gần đây
間に合う（まにあう）：kịp thời, kịp
時間（じかん）：thời gian
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (35, 3, N'分 - PHÂN', N'Âm ON: ふん／ぶん
Âm KUN: わ・かります／わ・かれます
Từ ghép: 
五分（ごふん）：5 phút
～分（～ふん）：~phút
分かれます（わかれます）：chia tay
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (36, 4, N'一 - NHẤT', N'Âm ON: イチ
Âm KUN: ひと・つ
Từ ghép:
一日（いちにち）：một ngày
一日（ついたち）：ngày mùng 1
一人（ひとり）：một người
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (37, 4, N'二 - NHỊ', N'Âm ON: ニ
Âm KUN: ふた・つ
Từ ghép:
二日（ふつか）：ngày mùng 2 , 2 ngày
二人（ふたり）：2 người
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (38, 4, N'三 - TAM', N'Âm ON: サン
Âm KUN: みっ・つ
Từ ghép:
三日（みっか）：ngày mùng 3 , 3 ngày
三人（さんにん）：3 cái
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (39, 4, N'四 - TỨ', N'Âm ON: ヨン／ヨ
Âm KUN: よっ・つ
Từ ghép:
四日（よっか）：ngày mùng 4 , 4 ngày
四人（よにん）：4 người
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (40, 4, N'生 - SINH', N'Âm ON: セイ
Âm KUN: 
Từ ghép: 
学生（がくせい） : học sinh
先生（せんせい） : giáo viên
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (41, 4, N'校 - HIỆU', N'Âm ON: コウ
Âm KUN: 
Từ ghép: 
学校（がっこう） : trường học
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (42, 4, N'日 - NHẬT', N'Âm ON: ジツ
Âm KUN: ひ／び
Từ ghép:
ー日（ついたち） : ngày mồng một
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (43, 4, N'本 - BẢN', N'Âm ON: ホン
Âm KUN: 
Từ ghép: 
日本（にほん） : Nhật Bản
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (44, 4, N'語 - NGỮ', N'Âm ON: ゴ
Âm KUN: 
Từ ghép: 
日本語（にほんご） : tiếng Nhật
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (45, 5, N'私 - TƯ', N'Âm ON: シ
Âm KUN: わたし／わたくし
Từ ghép:
私立大学（しりつだいがく）: đại học tư nhân
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (46, 5, N'人 - NHÂN', N'Âm ON: ジン／にん
Âm KUN: ひと
Từ ghép:
日本人（にほんじん）: người Nhật
3人（さんにん）: 3 người
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (47, 5, N'才 - TÀI', N'Âm ON: サイ
Âm KUN: 
Từ ghép:
４才（よんさい）:4 tuổi
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (48, 5, N'学 - HỌC', N'Âm ON: ガク
Âm KUN: 
Từ ghép: 
大学（だいがく） : trường đại học
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (49, 5, N'十 - THẬP', N'Âm ON: ジュウ
Âm KUN: とお
Từ ghép:
十日（とおか）：ngày 10 , 10 ngày
十時（じゅうじ）：10 giờ
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (50, 5, N'百 - BÁCH', N'Âm ON: ヒャク
Âm KUN: 
Từ ghép:
百(さんびゃく）：300
八百（はっぴゃく）：800
六百（ろっぴゃく）：600
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (51, 5, N'千 - THIÊN', N'Âm ON: セン
Âm KUN:
Từ ghép:
千円（せんえん）：1 nghìn Yen
千年（せんねん）：1 nghìn năm
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (52, 5, N'万 - VẠN', N'Âm ON: マン
Âm KUN: 
Từ ghép:
一万（いちまん）：1 vạn
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (53, 5, N'円 - VIÊN', N'Âm ON: エン
Âm KUN: 
Từ ghép:
二千円（にせんえん）：2 nghìn Yen
一万円（いちまんえん）：10 nghìn Yen
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (54, 5, N'語 - NGỮ', N'Âm ON: ゴ
Âm KUN: 
Từ ghép: 
日本語（にほんご） : tiếng Nhật
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (55, 6, N'月 - NGUYỆT', N'Âm ON: ガツ／ゲツ
Âm KUN: つき
Từ ghép: 
月よう日（げつようび）：Thứ hai
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (56, 6, N'火 - HỎA', N'Âm ON: カ
Âm KUN: ひ
Từ ghép: 
火じ（かじ）：hỏa hoạn
火（ひ）：lửa
火よう日（かようび）：Thứ ba
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (57, 6, N'水 - THỦY', N'Âm ON: スイ
Âm KUN: みず
Từ ghép: 
水よう日（すいようび）：Thứ tư
水えい（すいえい）：Bơi lội
水（みず）：nước
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (58, 6, N'木 - MỘC', N'Âm ON: モク
Âm KUN: き
Từ ghép: 
木（き）：cây
木よう日（もくようび）：Thứ năm
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (59, 6, N'金 - KIM', N'Âm ON: キン
Âm KUN: かね
Từ ghép: 
お金（おかね）：tiền
金よう日（きにょうび）：Thứ sáu
お金もち（おかねもち）：người giàu
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (60, 6, N'校 - HIỆU', N'Âm ON: コウ
Âm KUN: 
Từ ghép: 
学校（がっこう） : trường học
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (61, 6, N'日 - NHẬT', N'Âm ON: ジツ
Âm KUN: ひ／び
Từ ghép:
ー日（ついたち） : ngày mồng một
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (62, 6, N'本 - BẢN', N'Âm ON: ホン
Âm KUN: 
Từ ghép: 
日本（にほん） : Nhật Bản
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (63, 6, N'語 - NGỮ', N'Âm ON: ゴ
Âm KUN: 
Từ ghép: 
日本語（にほんご） : tiếng Nhật
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (64, 7, N'私 - TƯ', N'Âm ON: シ
Âm KUN: わたし／わたくし
Từ ghép:
私立大学（しりつだいがく）: đại học tư nhân
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (65, 7, N'人 - NHÂN', N'Âm ON: ジン／にん
Âm KUN: ひと
Từ ghép:
日本人（にほんじん）: người Nhật
3人（さんにん）: 3 người
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (66, 7, N'才 - TÀI', N'Âm ON: サイ
Âm KUN: 
Từ ghép:
４才（よんさい）:4 tuổi
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (67, 7, N'学 - HỌC', N'Âm ON: ガク
Âm KUN: 
Từ ghép: 
大学（だいがく） : trường đại học
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (68, 7, N'曜 - DIỆU', N'Âm ON: ヨウ
Âm KUN: 
Từ ghép: 
日曜日（にちようび）：Chủ nhật
～曜日（ようび）：ngày trong tuần
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (69, 7, N'何 - HÀ', N'Âm ON: カ
Âm KUN: なん／なに
Từ ghép: 
何日（なんにち）：ngày bao nhiêu ／ bao nhiêu ngày
何月（なんがつ）：tháng mấy
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (70, 7, N'年 - NIÊN', N'Âm ON: ネン
Âm KUN: とし
Từ ghép: 
一年生（いちねんせい）：sinh viên năm nhất, hs năm nhất
今年（ことし）：năm nay
去年（きょねん）：năm ngoái
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (71, 7, N'時 - THỜI, THÌ', N'Âm ON: ジ
Âm KUN: とき
Từ ghép: 
時々（ときどき）：thỉnh thoảng
時間（じかん）：thời gian
こどもの時（こどものとき）：hồi còn bé, lúc nhỏ
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (72, 7, N'間 - GIAN', N'Âm ON: カン／ケン
Âm KUN: あいだ、ま
Từ ghép: 
人間（にんげん）：nhân gian, loài người
この間（このあいだ）：khoảng thời gian này, thời gian gần đây
間に合う（まにあう）：kịp thời, kịp
時間（じかん）：thời gian
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (73, 7, N'分 - PHÂN', N'Âm ON: ふん／ぶん
Âm KUN: わ・かります／わ・かれます
Từ ghép: 
五分（ごふん）：5 phút
～分（～ふん）：~phút
分かれます（わかれます）：chia tay
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (74, 8, N'一 - NHẤT', N'Âm ON: イチ
Âm KUN: ひと・つ
Từ ghép:
一日（いちにち）：một ngày
一日（ついたち）：ngày mùng 1
一人（ひとり）：một người
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (75, 8, N'二 - NHỊ', N'Âm ON: ニ
Âm KUN: ふた・つ
Từ ghép:
二日（ふつか）：ngày mùng 2 , 2 ngày
二人（ふたり）：2 người
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (76, 8, N'三 - TAM', N'Âm ON: サン
Âm KUN: みっ・つ
Từ ghép:
三日（みっか）：ngày mùng 3 , 3 ngày
三人（さんにん）：3 cái
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (77, 8, N'四 - TỨ', N'Âm ON: ヨン／ヨ
Âm KUN: よっ・つ
Từ ghép:
四日（よっか）：ngày mùng 4 , 4 ngày
四人（よにん）：4 người
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (78, 8, N'五 - NGŨ', N'Âm ON: ゴ
Âm KUN: いつ・つ
Từ ghép:
五日（いつか）：ngày mùng 5 , 5 ngày
五人（ごにん）：4 người
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (79, 8, N'六 - LỤC', N'Âm ON: ロク
Âm KUN: むっ・つ
Từ ghép:
六日（むいか）：ngày mùng 6 , 6 ngày
六人（ろくにん）：6 người
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (80, 8, N'校 - HIỆU', N'Âm ON: コウ
Âm KUN: 
Từ ghép: 
学校（がっこう） : trường học
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (81, 8, N'日 - NHẬT', N'Âm ON: ジツ
Âm KUN: ひ／び
Từ ghép:
ー日（ついたち） : ngày mồng một
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (82, 8, N'本 - BẢN', N'Âm ON: ホン
Âm KUN: 
Từ ghép: 
日本（にほん） : Nhật Bản
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (83, 8, N'語 - NGỮ', N'Âm ON: ゴ
Âm KUN: 
Từ ghép: 
日本語（にほんご） : tiếng Nhật
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (84, 9, N'私 - TƯ', N'Âm ON: シ
Âm KUN: わたし／わたくし
Từ ghép:
私立大学（しりつだいがく）: đại học tư nhân
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (85, 9, N'人 - NHÂN', N'Âm ON: ジン／にん
Âm KUN: ひと
Từ ghép:
日本人（にほんじん）: người Nhật
3人（さんにん）: 3 người
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (86, 9, N'才 - TÀI', N'Âm ON: サイ
Âm KUN: 
Từ ghép:
４才（よんさい）:4 tuổi
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (87, 9, N'学 - HỌC', N'Âm ON: ガク
Âm KUN: 
Từ ghép: 
大学（だいがく） : trường đại học
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (88, 9, N'十 - THẬP', N'Âm ON: ジュウ
Âm KUN: とお
Từ ghép:
十日（とおか）：ngày 10 , 10 ngày
十時（じゅうじ）：10 giờ
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (89, 9, N'百 - BÁCH', N'Âm ON: ヒャク
Âm KUN: 
Từ ghép:
百(さんびゃく）：300
八百（はっぴゃく）：800
六百（ろっぴゃく）：600
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (90, 9, N'千 - THIÊN', N'Âm ON: セン
Âm KUN:
Từ ghép:
千円（せんえん）：1 nghìn Yen
千年（せんねん）：1 nghìn năm
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (91, 9, N'万 - VẠN', N'Âm ON: マン
Âm KUN: 
Từ ghép:
一万（いちまん）：1 vạn
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (92, 9, N'円 - VIÊN', N'Âm ON: エン
Âm KUN: 
Từ ghép:
二千円（にせんえん）：2 nghìn Yen
一万円（いちまんえん）：10 nghìn Yen
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (93, 9, N'八 - BÁT', N'Âm ON: ハチ
Âm KUN:やっ・つ
Từ ghép:
八日（ようか）：mùng 8 , 8 ngày
八ばん（はちばん）：số thứ 8
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (94, 10, N'月 - NGUYỆT', N'Âm ON: ガツ／ゲツ
Âm KUN: つき
Từ ghép: 
月よう日（げつようび）：Thứ hai
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (95, 10, N'火 - HỎA', N'Âm ON: カ
Âm KUN: ひ
Từ ghép: 
火じ（かじ）：hỏa hoạn
火（ひ）：lửa
火よう日（かようび）：Thứ ba
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (96, 10, N'水 - THỦY', N'Âm ON: スイ
Âm KUN: みず
Từ ghép: 
水よう日（すいようび）：Thứ tư
水えい（すいえい）：Bơi lội
水（みず）：nước
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (97, 10, N'木 - MỘC', N'Âm ON: モク
Âm KUN: き
Từ ghép: 
木（き）：cây
木よう日（もくようび）：Thứ năm
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (98, 10, N'金 - KIM', N'Âm ON: キン
Âm KUN: かね
Từ ghép: 
お金（おかね）：tiền
金よう日（きにょうび）：Thứ sáu
お金もち（おかねもち）：người giàu
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (99, 10, N'校 - HIỆU', N'Âm ON: コウ
Âm KUN: 
Từ ghép: 
学校（がっこう） : trường học
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (100, 10, N'日 - NHẬT', N'Âm ON: ジツ
Âm KUN: ひ／び
Từ ghép:
ー日（ついたち） : ngày mồng một
')
GO
print 'Processed 100 total records'
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (101, 10, N'本 - BẢN', N'Âm ON: ホン
Âm KUN: 
Từ ghép: 
日本（にほん） : Nhật Bản
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (102, 10, N'語 - NGỮ', N'Âm ON: ゴ
Âm KUN: 
Từ ghép: 
日本語（にほんご） : tiếng Nhật
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (103, 11, N'私 - TƯ', N'Âm ON: シ
Âm KUN: わたし／わたくし
Từ ghép:
私立大学（しりつだいがく）: đại học tư nhân
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (104, 11, N'人 - NHÂN', N'Âm ON: ジン／にん
Âm KUN: ひと
Từ ghép:
日本人（にほんじん）: người Nhật
3人（さんにん）: 3 người
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (105, 11, N'才 - TÀI', N'Âm ON: サイ
Âm KUN: 
Từ ghép:
４才（よんさい）:4 tuổi
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (106, 11, N'学 - HỌC', N'Âm ON: ガク
Âm KUN: 
Từ ghép: 
大学（だいがく） : trường đại học
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (107, 11, N'何 - HÀ', N'Âm ON: カ
Âm KUN: なん／なに
Từ ghép: 
何日（なんにち）：ngày bao nhiêu ／ bao nhiêu ngày
何月（なんがつ）：tháng mấy
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (108, 11, N'年 - NIÊN', N'Âm ON: ネン
Âm KUN: とし
Từ ghép: 
一年生（いちねんせい）：sinh viên năm nhất, hs năm nhất
今年（ことし）：năm nay
去年（きょねん）：năm ngoái
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (109, 11, N'時 - THỜI, THÌ', N'Âm ON: ジ
Âm KUN: とき
Từ ghép: 
時々（ときどき）：thỉnh thoảng
時間（じかん）：thời gian
こどもの時（こどものとき）：hồi còn bé, lúc nhỏ
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (110, 11, N'間 - GIAN', N'Âm ON: カン／ケン
Âm KUN: あいだ、ま
Từ ghép: 
人間（にんげん）：nhân gian, loài người
この間（このあいだ）：khoảng thời gian này, thời gian gần đây
間に合う（まにあう）：kịp thời, kịp
時間（じかん）：thời gian
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (111, 11, N'分 - PHÂN', N'Âm ON: ふん／ぶん
Âm KUN: わ・かります／わ・かれます
Từ ghép: 
五分（ごふん）：5 phút
～分（～ふん）：~phút
分かれます（わかれます）：chia tay
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (112, 12, N'九 - CỬU', N'Âm ON: キュウ／ク
Âm KUN: ここの・つ
Từ ghép: 
九日（ここのか）：mùng 9 , 9 ngày
九時（くじ）：9 giờ
九番（きゅうばん）：số thứ 9
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (113, 12, N'十 - THẬP', N'Âm ON: ジュウ
Âm KUN: とお
Từ ghép:
十日（とおか）：ngày 10 , 10 ngày
十時（じゅうじ）：10 giờ
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (114, 12, N'百 - BÁCH', N'Âm ON: ヒャク
Âm KUN: 
Từ ghép:
百(さんびゃく）：300
八百（はっぴゃく）：800
六百（ろっぴゃく）：600
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (115, 12, N'千 - THIÊN', N'Âm ON: セン
Âm KUN:
Từ ghép:
千円（せんえん）：1 nghìn Yen
千年（せんねん）：1 nghìn năm
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (116, 12, N'万 - VẠN', N'Âm ON: マン
Âm KUN: 
Từ ghép:
一万（いちまん）：1 vạn
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (117, 12, N'円 - VIÊN', N'Âm ON: エン
Âm KUN: 
Từ ghép:
二千円（にせんえん）：2 nghìn Yen
一万円（いちまんえん）：10 nghìn Yen
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (118, 12, N'八 - BÁT', N'Âm ON: ハチ
Âm KUN:やっ・つ
Từ ghép:
八日（ようか）：mùng 8 , 8 ngày
八ばん（はちばん）：số thứ 8
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (119, 12, N'校 - HIỆU', N'Âm ON: コウ
Âm KUN: 
Từ ghép: 
学校（がっこう） : trường học
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (120, 12, N'日 - NHẬT', N'Âm ON: ジツ
Âm KUN: ひ／び
Từ ghép:
ー日（ついたち） : ngày mồng một
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (121, 12, N'本 - BẢN', N'Âm ON: ホン
Âm KUN: 
Từ ghép: 
日本（にほん） : Nhật Bản
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (122, 12, N'語 - NGỮ', N'Âm ON: ゴ
Âm KUN: 
Từ ghép: 
日本語（にほんご） : tiếng Nhật
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (123, 13, N'私 - TƯ', N'Âm ON: シ
Âm KUN: わたし／わたくし
Từ ghép:
私立大学（しりつだいがく）: đại học tư nhân
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (124, 13, N'人 - NHÂN', N'Âm ON: ジン／にん
Âm KUN: ひと
Từ ghép:
日本人（にほんじん）: người Nhật
3人（さんにん）: 3 người
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (125, 13, N'才 - TÀI', N'Âm ON: サイ
Âm KUN: 
Từ ghép:
４才（よんさい）:4 tuổi
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (126, 13, N'学 - HỌC', N'Âm ON: ガク
Âm KUN: 
Từ ghép: 
大学（だいがく） : trường đại học
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (127, 13, N'木 - MỘC', N'Âm ON: モク
Âm KUN: き
Từ ghép: 
木（き）：cây
木よう日（もくようび）：Thứ năm
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (128, 13, N'金 - KIM', N'Âm ON: キン
Âm KUN: かね
Từ ghép: 
お金（おかね）：tiền
金よう日（きにょうび）：Thứ sáu
お金もち（おかねもち）：người giàu
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (129, 13, N'土 - THỔ', N'Âm ON: ド／ト
Âm KUN: つち
Từ ghép: 
土（つち）：đất đai
土よう日（どようび）：Thứ bảy
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (130, 13, N'曜 - DIỆU', N'Âm ON: ヨウ
Âm KUN: 
Từ ghép: 
日曜日（にちようび）：Chủ nhật
～曜日（ようび）：ngày trong tuần
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (131, 13, N'何 - HÀ', N'Âm ON: カ
Âm KUN: なん／なに
Từ ghép: 
何日（なんにち）：ngày bao nhiêu ／ bao nhiêu ngày
何月（なんがつ）：tháng mấy
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (132, 14, N'一 - NHẤT', N'Âm ON: イチ
Âm KUN: ひと・つ
Từ ghép:
一日（いちにち）：một ngày
一日（ついたち）：ngày mùng 1
一人（ひとり）：một người
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (133, 14, N'二 - NHỊ', N'Âm ON: ニ
Âm KUN: ふた・つ
Từ ghép:
二日（ふつか）：ngày mùng 2 , 2 ngày
二人（ふたり）：2 người
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (134, 14, N'三 - TAM', N'Âm ON: サン
Âm KUN: みっ・つ
Từ ghép:
三日（みっか）：ngày mùng 3 , 3 ngày
三人（さんにん）：3 cái
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (135, 14, N'四 - TỨ', N'Âm ON: ヨン／ヨ
Âm KUN: よっ・つ
Từ ghép:
四日（よっか）：ngày mùng 4 , 4 ngày
四人（よにん）：4 người
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (136, 14, N'五 - NGŨ', N'Âm ON: ゴ
Âm KUN: いつ・つ
Từ ghép:
五日（いつか）：ngày mùng 5 , 5 ngày
五人（ごにん）：4 người
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (137, 14, N'六 - LỤC', N'Âm ON: ロク
Âm KUN: むっ・つ
Từ ghép:
六日（むいか）：ngày mùng 6 , 6 ngày
六人（ろくにん）：6 người
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (138, 14, N'日 - NHẬT', N'Âm ON: ジツ
Âm KUN: ひ／び
Từ ghép:
ー日（ついたち） : ngày mồng một
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (139, 14, N'本 - BẢN', N'Âm ON: ホン
Âm KUN: 
Từ ghép: 
日本（にほん） : Nhật Bản
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (140, 14, N'語 - NGỮ', N'Âm ON: ゴ
Âm KUN: 
Từ ghép: 
日本語（にほんご） : tiếng Nhật
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (141, 15, N'私 - TƯ', N'Âm ON: シ
Âm KUN: わたし／わたくし
Từ ghép:
私立大学（しりつだいがく）: đại học tư nhân
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (142, 15, N'人 - NHÂN', N'Âm ON: ジン／にん
Âm KUN: ひと
Từ ghép:
日本人（にほんじん）: người Nhật
3人（さんにん）: 3 người
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (143, 15, N'才 - TÀI', N'Âm ON: サイ
Âm KUN: 
Từ ghép:
４才（よんさい）:4 tuổi
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (144, 15, N'学 - HỌC', N'Âm ON: ガク
Âm KUN: 
Từ ghép: 
大学（だいがく） : trường đại học
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (145, 15, N'九 - CỬU', N'Âm ON: キュウ／ク
Âm KUN: ここの・つ
Từ ghép: 
九日（ここのか）：mùng 9 , 9 ngày
九時（くじ）：9 giờ
九番（きゅうばん）：số thứ 9
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (146, 15, N'十 - THẬP', N'Âm ON: ジュウ
Âm KUN: とお
Từ ghép:
十日（とおか）：ngày 10 , 10 ngày
十時（じゅうじ）：10 giờ
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (147, 15, N'百 - BÁCH', N'Âm ON: ヒャク
Âm KUN: 
Từ ghép:
百(さんびゃく）：300
八百（はっぴゃく）：800
六百（ろっぴゃく）：600
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (148, 15, N'千 - THIÊN', N'Âm ON: セン
Âm KUN:
Từ ghép:
千円（せんえん）：1 nghìn Yen
千年（せんねん）：1 nghìn năm
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (149, 15, N'万 - VẠN', N'Âm ON: マン
Âm KUN: 
Từ ghép:
一万（いちまん）：1 vạn
')
INSERT [dbo].[Kanji] ([ID], [LessonID], [Term], [Definition]) VALUES (150, 15, N'円 - VIÊN', N'Âm ON: エン
Âm KUN: 
Từ ghép:
二千円（にせんえん）：2 nghìn Yen
一万円（いちまんえん）：10 nghìn Yen
')
SET IDENTITY_INSERT [dbo].[Kanji] OFF
/****** Object:  Table [dbo].[Grammar]    Script Date: 03/23/2017 23:32:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grammar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LessonID] [int] NOT NULL,
	[Term] [ntext] NOT NULL,
	[Definition] [ntext] NOT NULL,
 CONSTRAINT [PK_Gramma] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Grammar] ON
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (1, 1, N'N1は　N2です', N'N1 là N2.
Thể khẳng định, hiện tại hoặc tương lai.
N2 ở đây thể hiện 1 thuộc tính của N1.

れい：
・ミンさんは　がくせいです。
Minh là học sinh.
・クァンさんは　ベトナムじんです。
Quang là người Việt Nam.
・マイさんは　じゅうはっさいです。
Mai 18 tuổi.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (2, 1, N'N1は　N2ですか。', N'はい、N2です。
いいえ、N2では／じゃありません。

れい：
・ミンさんは　せんせいですか。
Minh là giáo viên phải không?
・・・はい、せんせいです。
Đúng, là giáo viên.
・・・いいえ、せんせいでは／じゃありません。
Không, không phải là giáo viên.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (3, 1, N'Nは　どちら／いつ／なんですか。', N'N là nước nào, khi nào, cái gì?
・どちら：có thể dùng hỏi đất nước, công ty, tập đoàn, hãng sản xuất…
・いつ：hỏi thời gian, lúc nào, khi nào
・なん：hỏi cái gì

れい：
・おくには　どちらですか。
Đất nước／ quê hương của bạn là gì?
・たんじょうには　いつですか。
Sinh nhật của bạn là khi nào?
・しゅみは　なんですか。
Sở thích của bạn là gì?
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (4, 1, N'N1の　N2', N'Dịch là N2 của N1.
N2 ở đây là thuộc sở hữu của N1, hoặc là 1 bộ phận, 1 nhánh, 1 phần nhỏ hơn của N1.

れい：
・ハノイは　ベトナムのしゅとです。
Hà Nội là thủ đô của Việt Nam.
・わたしは　FPTだいがくの　がくせいです。
Tôi là sinh viên của trường ĐH FPT.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (5, 1, N'N1と　N2', N'N1 và N2. 
と ở đây dùng như AND của tiếng Anh.

れい：
・ナムさんのしゅみは　りょこうと　どくしょです。
Sở thích của Nam là du lịch và đọc sách.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (6, 1, N'Nも', N'Cũng

れい：
・わたしはFPTだいがくの　がくせいです。ミンさんも　FPTだいがくの　がくせいです。
Tôi là sv ĐH FPT, Minh cũng là sv ĐH FPT.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (7, 2, N'これ／それ／あれ', N'Cái này／ cái đó／ cái kia
この được dùng khi vật ở gần người nói, xa người nghe.
その được dùng khi vật ở gần người nghe xa người nói. 
あの được dùng khi vật ở xa cả người nói và người nghe.

れい：
・これは　にほんごのほんです。
Đây là quyển sách tiếng nhật.
・それは　えんぴつです。
Đó là cái bút chì.
・あれは　けいたいでんわです。
Kia là cái điện thoại di động.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (8, 2, N'この／その／あの　N', N'Cái N này／ đó／ kia
Dùng như この／その／あの nhưng vật ở đây được chỉ rõ ra bằng danh từ N.

れい：
・このほんは　ナムさんのほんです。
Quyển sách này là sách của Nam.
・そのほんは　にほんごのほんです。
Quyển sách đó là sách tiếng Nhật.
・あのぺんは　わたしのぺんです。
Cây bút kia là bút của tôi.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (9, 2, N'Nは　どこですか。
ここ／そこ／あそこ 
こちら／そちら／あちら', N'どこ／どちら ở đây được dùng để hỏi địa điểm của danh từ N.
ここ／そこ／あそこ  : ở đây ／ ở đó ／ ở kia.
こちら／そちら／あちら  : hướng này ／ hướng đó ／ hướng kia.

例（れい）：
A：　Bさん、きょうしつは　どこですか。
          B ơi, lớp học ở đâu thế?
B：　きょうしつは　あそこです。 
          Lớp học ở đằng kia.
----
  　      A：　すみません、トイレは　どこですか。
　　　　　　Xin lỗi cho tôi hỏi WC ở đâu thế?
てんいん：　トイレは　あちらです。
　　　　　　WC ở đằng kia.
-----
A：　せんせいは　どこですか。
　　　Thầy giáo đang ở đâu thế?
B：　きょうしつです。
　　　Thầy giáo đang ở trong lớp.
Lưu ý không dịch: Thầy giáo là lớp học.
Câu hỏi どこですか。Có câu trả lời là những từ ngữ chỉ vị trí như: ここ／そこ／あそこ
Nhưng lúc người trả lời muốn nói 1 cách lịch sự thì sẽ dùng　こちら／そちら／あちら　thay thế.
Ngoài ra còn có thể trả lời bằng những danh từ chỉ địa điểm như lớp học, nhà ăn,....
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (10, 2, N'いくらですか。', N'Giá bao nhiêu?

れい：
・そのほんは　いくらですか。
Quyển sách đó giá bao nhiêu?
・５５００えんです。
5500 Yên.
・これは　いくらですか。
Cái này bao nhiêu tiền thế?
・それは　１まんえんです。
Cái đó giá 10000Yên.
Số đếm + えん　＝　～Yên
Số đếm + ドル　＝　～Dolla
Số đếm + ドン　＝　～VNĐ
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (11, 2, N'だれの　N　ですか。', N'Thể hiện sự sở hữu
・これは　だれのほんですか。
Đây là quyển sách của ai?
・これは　Nguyenさんのほんです。
Đây là quyển sách của Nguyên
----
・こちらは　だれのこいびと／だれ　ですか。
Đây là người yêu của ai／ là ai?
・わたしの　こいびとです。
Là người yêu của tôi.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (12, 2, N'どこの　Nですか。', N'Thể hiện nguồn gốc, xuất xứ, hãng… của đồ vật

れい：
・これは　どこのけいたいでんわですか。
Cái này là đt của hãng nào／ nước nào?
・これは　APPLEの（けいたいでんわ）です。
Cái này là(smartphone) của Apple.
・これは　どこのくつですか。
Đây là đôi giày của nước nào／ hãng nào?
・このくつは　日本のです。
Đôi giày này là của Nhật.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (13, 2, N'なんの　Nですか。', N'Thể hiện thuộc tính, chủng loại, lĩnh vực… của sự vật

れい：
・これは　なんの　ざっしですか。
Đây là tạp chí về cái gì?
・これは　コンピューターの　ざっしです。
Đây là quyển tạp chí về máy tính.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (14, 2, N'N  を　（～つ）ください。', N'Cho tôi  ～ cái　N

れい：
　　　A：すみません、　ちゅうもんをおねがいします。
てんいん：はい、どうぞ。
　　　A：カレーを　ひとつ（１つ）ください。
てんいん：はい。
Dịch:
A： Xin lỗi, vui lòng cho tôi gọi món.
Nhân viên： Vâng, xin mời.
A： Cho tôi 1 Cà-ri.
Nhân viên： Vâng.
----
　　　A：　すみません、　ちゅうもんをおねがいします。
てんいん：　はい、どうぞ。
　　　A：　このビールは　どこのビールですか。
てんいん：　ドイツのビールです。
　　　A：　じゃ、カレーを　ふたつ（２つ）と　ビールを　みっつ（３つ）　ください。
てんいん：　カレーを２つとビールを３つですね。しょうしょうおまちください。
Dịch：
A： Xin lỗi, vui lòng cho tôi gọi món.
Nhân viên：Vâng, xin mời.
A： Bia này là bia của nước nào vậy?
Nhân viên： Bia của Đức.
A： Vậy cho tôi 2 Cà-ri và 3 bia.
Nhân viên： 2 cà-ri và 3 bia đúng không nhỉ. Xin vui lòng chờ 1 chút.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (15, 2, N'N(～ご)で　～', N'Trong ngôn ngữ ～ 

れい：
・ぶたにくは　えいごで　なんですか。
Thịt lợn trong tiếng Anh là gì?
・「Pork」 です。Là Pork
----
・「Beef」は　にほんごで　なんですか。
Beef trong tiếng nhật là gì?

・「ぎゅうにく」です。
Là thịt bò (ぎゅうにく).
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (16, 3, N'N（じかん）に　Vます', N'Thực hiện hành động V tại thời điểm N.
Trợ từ に dịch là vào, vào lúc.
Đứng sau thời gian cụ thể, như giờ cụ thể, hoặc ngày cụ thể( những mốc thời gian có số) để thể hiện thời điểm hành động xảy ra.
Không dùng trợ từ に sau những thời gian k có số đi kèm.
Trường hợp đặc biệt:
Với các ngày trong tuần ～ようび　và kì nghỉ như kì nghỉ hè   なつやすみ　thì tùy vào ngữ cảnh của câu có thể là thời gian cụ thể ( T2 tuần này, kì nghỉ hè năm nay...) hoặc không, cho nên có thể có に ở phía sau hay không có đều được.

れい：
・わたしは　まいあさ　ろくじに　おきます
Mỗi buổi sáng tôi thức dậy lúc 6h.
・わたしは　まいばん　じゅういちじに　ねます。
Mỗi tối tôi đi ngủ lúc 11h.
Ở 2 câu trên thì sau   まいああさ   và   まいばん　thì không có   に　mặc dù chúng đều là từ chỉ thời gian, vì chúng không chỉ thời gian cụ thể ( không có số).
Lưu ý bảng cách đếm giờ và đếm ngày ở trang 286 sách   できるにほんご   quyển 1.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (17, 3, N'N（じかん・ようび）から　N（じかん・ようび）まで', N'Từ thời điểm (giờ ／ ngày) đến thời điểm (giờ ／ ngày)

れい：
・みどりゆうびんきょくは　ごぜんくじから　ごご　ごじまでです。
Bưu điện Xanh hoạt động từ 9h sáng đến 5h chiều.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (18, 3, N'Vます／ません', N'Động từ thể khẳng định／ phủ định.

れい：
・アンさんは　まいにち、あさごはんをたべますか。
Mỗi buổi sáng An có ăn sáng không?
・・・はい、たべます。
Có, có ăn.
・・・いいえ、たべません。
Không, không ăn.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (19, 3, N'N（ばしょ）へ    Vます', N'N (Địa điểm)  へ　Động từ di chuyển.
へ：trợ từ đi kèm với các động từ di chuyển, chỉ đứng sau các danh từ chỉ địa điểm hoặc hướng, chỉ hướng đến của hành động.
へ　いきます　：đi
へ　きます　　：đến
へ　かえります：về

れい：
・わたしは　まいにち　がっこうへ　いきます。
Mỗi ngày tôi đi tới trường (đi học).
・わたしは　まいばん　へやへ　かえります。
Mỗi tối tôi trở về phòng.
・わたしは　まいあさ　がっこうへ　きます。
Mỗi ngày tôi đến trường (đi học)
Lưu ý ví dụ 3 được nói lúc đang đứng ở trường, còn ví dụ số 1 thì có được nói lúc không ở trường.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (20, 3, N'N　を　Vます', N'Động từ V tác động trực tiếp lên sự vật, đối tượng N. 
Các động từ này đi kèm với trợ từ　を　(đọc là ô).
Một số động từ đi kèm trợ từ 　を：
たべます：　　　　ăn
のみます：　　　　uống
みます：　　　　　xem
します：　　　　　làm／chơi
べんきょうします：học
かきます：　　　　viết／ vẽ
よみます：　　　　đọc….
Một số danh từ chỉ hành động đi kèm với　します　trở thành danh động từ
サッカーを　します：　đá bóng
ダンスを　　します：　nhảy
しょくじを　します：　ăn, dùng bữa
テニスを　　します：　chơi tennis
スポッツを　します：　chơi thể thao

れい：
・まいあさ　わたしは　パンを　たべます。
Mỗi sáng tôi ăn bánh mì.
・まいばん　わたしは　はちじに　にっきを　かきます。
Mỗi tối tôi đều viết nhật kí vào lúc 8h.
・あした　わたしは　サッカを　します。
Ngày mai tôi sẽ chơi đá bóng.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (21, 3, N'N1や N2など', N'Nào là N1, nào là N2, Nào là N1, nào là N2, vânvân

れい：
・わたしは　まいあさ　パンや　サラダなどを　たべます。
Mỗi sáng tôi ăn nào là bánh mì, salad….
・わたしは　サッカーや　テニスなどを　します。
Tôi chơi nào là bóng đá, tennis…..
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (22, 3, N'なにも／どこ（へ）も　Vません', N'Không làm hành động V gì cả. Dịch là : không V gì cả
何(なに)も　しません　　　　Không làm gì cả
何も　たべません　　　　　　Không ăn gì cả
何も　のみません　　　　　　Không uống gì cả
何も　べんきょうしません　　Không học gì cả
-----
Tương tự với những động từ khác, đây là mẫu câu không làm gì cả.
Trợ từ 　を　được chuyển thành trợ từ　も.


れい：
・わたしは　なつやすみに　何(なに)も　べんきょうしません。
Vào kì nghỉ hè tôi không học gì cả.
・私は　きょう　なにも　たべません。
Hôm nay tôi không ăn gì cả.
- Với những động từ sử dụng trợ từ へ
どこ(へ)も　いきません　　Không đi đâu cả
どこ(へ)も　きません　　　Không đến đâu cả
どこ(へ)も　かえりません　Không về đâu cả
-----
Ở đây có へ　hay không  có　へ　đều được.

れい：
・わたしは　しゅうまつ　どこ（へ）も　いきません。Cuối tuần tôi không đi đâu cả.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (23, 3, N'N（ばしょ）で    Vます', N'Làm hành động V ở địa điểm N.
Dịch là ở, tại...
で ở đây là chỉ địa điểm xảy ra hành động, cũng đứng sau danh từ chỉ địa điểm.

れい：
・まいにち　わたしは　くじから　じゅうにじまで　きょうしつで　にほんごを　べんきょうします。
Mỗi ngày tôi học Tiếng Nhật từ 9h đến 12h ở lớp học.
・わたしは　しゅうまつ　あさから　よるまで　ハノイで　えいがを　みます。
Cuối tuần tôi xem phim ở Hà nội từ sáng đến tối.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (24, 4, N'Nは　Aです。
Nは　イA (bỏ い) くないです。
Nは　ナA 　じゃ／では　ありません。', N'- Dùng tính từ A để miêu tả danh từ N.
Trong tiếng Nhật có 2 loại tính từ là tính từ đuôi　い　và tính từ đuôi　な.
Tất cả tính từ đuôi　い　đều có 　い　ở cuối, phần còn lại là tính từ đuôi　な, trừ 1 vài từ đặc biệt có　い　ở cuối nhưng vẫn là tính từ đuôi　な　như　きれい(な)、きらい(な),...
- Một số tính từ đuôi　い　thường dùng:
あたらしい　　　　mới
ふるい　　　　　　cũ
いい　　　　　　　tốt
わるい　　　　　　xấu
おおい　　　　　　nhiều
おおきい　　　　　to
ちいさい　　　　　nhỏ
たかい　　　　　　cao
ひくい　　　　　　thấp
- Một số tính từ đuôi　な　thường dùng:
きれい（な）　　　đẹp, sạch
しずか（な）　　　yên tĩnh
にぎやか（な）　　nhộn nhịp
ゆうめい（な）　　nổi tiếng
ひま（な）　　　　rảnh rỗi
- Tính từ đuôi　な　lúc sử dụng thường không có　な, chỉ có　な　lúc ghép với danh từ hoặc trong một số mẫu câu đặc biệt hay có thể thông thường.
- Nは　N1が　Aです：N ở đây là chủ ngữ, một người, vật hay chủ thể nào đó.
N1 là một thuộc tính của N và có tính chất A (như ví dụ 1 bên dưới).
- Nは　イA (bỏ い) くないです：thể phủ định của tính từ đuôi　い.
- Nは　ナA じゃありません：thể phủ định của tính từ đuôi　な.

れい：
・わたしのまちは　みどりが　おおいです。
Thành phố của tôi có rất nhiều màu xanh(cây xanh).
・このりょうりは　からくないです。
Món ăn này không cay.
・わたしのまちは　にぎやかじゃありません。
Thành phố của tôi không nhộn nhịp.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (25, 4, N'イA　　＋　N
ナAな　＋　N', N'Ghép tính từ với danh từ để bổ nghĩa cho danh từ.
Với tính từ đuôi　な　ở trường hợp này thì có　な.

れい：
・わたしのこいびとは　ゆうめいなひとです。
Người yêu của tôi là một người nổi tiếng.
・ハイさんのこいびとは　かわいいおんなです。
Người yêu của Hải là một cô bé dễ thương.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (26, 4, N'N（くに・まち）は　(はる・～げつ・いちねんじゅう)、Aです', N'Danh từ (đất nước, thành phố nào đó) là ／ thì vào (mùa ／ tháng ／ trong 1 năm) có tính chất A.
Dịch là: Ở đất nước ／ thành phố N vào mùa~／ tháng~／ trong năm thì như thế này~(tính chất A).

れい： 
・とうきょうは　６げつ、あめが　おいいです。
Ở Tokyo thì vào tháng 6 mưa rất nhiều.
・ベトナムは　はる、てんきが　いいです。
Ở Việt Nam vào mùa xuân thì thời tiết rất đẹp.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (27, 4, N'とても／たいへん　Aです。
あまり／ぜんぜん　イAくないです／ナAじゃ　ありません。
すこし／ちょっと　Aです。', N'とても：　　　　rất, lắm
たいへん：　　　cực kì, vô cùng
あまり：　　　　không ~ lắm
ぜんぜん：　　　hoàn toàn không
すこし／ちょっと：một chút, một ít, hơi, hơi hơi
Đây là các phó từ thường đứng trước tính từ và động từ để bổ nghĩa cho chúng.
Lưu ý　あまり　và　ぜんぜん　luôn đi với các động từ ở thể phủ định.

れい：
・ベトナムは　ふゆ、とても　さむいです。
Việt Nam vào mùa đông thì rất lạnh.
・とうきょうは　たいへん　にぎやかです。
Tokyo vô cùng nhộn nhịp.
・このこうえんは　あまり　おおきくないです。
Công viên này không to lắm.
・わたしのせんせいは　ぜんぜん　ハンサムじゃありません。
Thầy giáo tôi hoàn toàn không đẹp trai.
・このへやは　すこし　ふるいです。
Căn phòng này hơi cũ.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (28, 4, N'N1（ばしょ）に　N2が　あります', N'Ở vị trí N1 có vật thể N2.

れい：
・わたしのまちに　きれいなかわが　あります。
Ở thành phố của tôi có con sông đẹp.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (29, 4, N'N1（まち）は　N2（くに）の(ひがし・にし・みなみ・きた・まんなか)　です', N'Thành phố N1 nằm ở phía (Đông ／ Tây ／ Bắc ／ Nam) của đất nước N2.

れい：
・ハノイは　ベトナムのきたです。
Hà Nội là ở phía Bắc Việt Nam.
・フェは　べとなむのまんなかです。
Huế là ở ngay chính giữa Việt Nam.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (30, 4, N'N（ばしょ１）から　N（ばしょ２）まで　どのぐらいですか／　どのぐらいかかりますか。
N（ばしょ１）から　N（ばしょ２）まで　(～じかん・ふん)です。', N'-Từ địa điểm N1 đến địa điểm N2 là khoảng bao lâu?
-Từ địa điểm N1 đến địa điểm N2 là khoảng ~ thời gian／ phút, giờ…

れい：
・ハノイから　ホチミンし　まで　どのぐらいですか。
Từ Hà Nội đến Tp HCM mất bao lâu?
・ハノイから　ホチミンし　まで　２じかんはんぐらいです。
Từ Hà Nội đến Tp HCM mất khoảng 2 tiếng rưỡi.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (31, 4, N'N（のりもの）　で', N'Bằng phương tiện N

れい：
・ハノイから　ホアラクまで　バスで　１じかんぐらいかかります。
Từ Hà Nội đến Hòa Lạc mất khoảng 1 tiếng đi bằng xe bus.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (32, 4, N'どうですか。
どんな　Nですか。', N'Cả 2 mẫu này đều là như thế nào ／ thế nào.
Nhưng　どう　thì đứng một mình còn　どんな　thì đi kèm với danh từ.

れい：
・ハノイは　どうですか。
Hà Nội thế nào?
・・・ハノイは　あついです。
Hà Nội nóng!
・ハノイは　どんなところですか。
Hà Nội là nơi như thế nào?
・・・ハノイは　とてもあついところです。
Hà nội là 1 nơi rất nóng.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (33, 4, N'そして', N'Và ／ hơn nữa.

れい：
・このまちは　しずかです。そして　きれいです。
Thành phố này yên tĩnh và đẹp.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (34, 4, N'_________が、____________', N'～　nhưng　～

れい：
・わたしのまちは　おおきくないですが、いいところです。
Thành phố của tôi không lớn, nhưng mà là một nơi tốt.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (35, 4, N'___________ね', N'～ nhỉ

れい：
・あつですね。
Nóng nhỉ!!
・そうですね。
Uhm, nóng thật.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (36, 5, N'N1は　N2ですか。', N'はい、N2です。
いいえ、N2では／じゃありません。

れい：
・ミンさんは　せんせいですか。
Minh là giáo viên phải không?
・・・はい、せんせいです。
Đúng, là giáo viên.
・・・いいえ、せんせいでは／じゃありません。
Không, không phải là giáo viên.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (37, 5, N'Nは　どちら／いつ／なんですか。', N'N là nước nào, khi nào, cái gì?
・どちら：có thể dùng hỏi đất nước, công ty, tập đoàn, hãng sản xuất…
・いつ：hỏi thời gian, lúc nào, khi nào
・なん：hỏi cái gì

れい：
・おくには　どちらですか。
Đất nước／ quê hương của bạn là gì?
・たんじょうには　いつですか。
Sinh nhật của bạn là khi nào?
・しゅみは　なんですか。
Sở thích của bạn là gì?
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (38, 5, N'Nは　どこですか。
ここ／そこ／あそこ 
こちら／そちら／あちら', N'どこ／どちら ở đây được dùng để hỏi địa điểm của danh từ N.
ここ／そこ／あそこ  : ở đây ／ ở đó ／ ở kia.
こちら／そちら／あちら  : hướng này ／ hướng đó ／ hướng kia.

例（れい）：
A：　Bさん、きょうしつは　どこですか。
          B ơi, lớp học ở đâu thế?
B：　きょうしつは　あそこです。 
          Lớp học ở đằng kia.
----
  　      A：　すみません、トイレは　どこですか。
　　　　　　Xin lỗi cho tôi hỏi WC ở đâu thế?
てんいん：　トイレは　あちらです。
　　　　　　WC ở đằng kia.
-----
A：　せんせいは　どこですか。
　　　Thầy giáo đang ở đâu thế?
B：　きょうしつです。
　　　Thầy giáo đang ở trong lớp.
Lưu ý không dịch: Thầy giáo là lớp học.
Câu hỏi どこですか。Có câu trả lời là những từ ngữ chỉ vị trí như: ここ／そこ／あそこ
Nhưng lúc người trả lời muốn nói 1 cách lịch sự thì sẽ dùng　こちら／そちら／あちら　thay thế.
Ngoài ra còn có thể trả lời bằng những danh từ chỉ địa điểm như lớp học, nhà ăn,....
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (39, 5, N'どうですか。
どんな　Nですか。', N'Cả 2 mẫu này đều là như thế nào ／ thế nào.
Nhưng　どう　thì đứng một mình còn　どんな　thì đi kèm với danh từ.

れい：
・ハノイは　どうですか。
Hà Nội thế nào?
・・・ハノイは　あついです。
Hà Nội nóng!
・ハノイは　どんなところですか。
Hà Nội là nơi như thế nào?
・・・ハノイは　とてもあついところです。
Hà nội là 1 nơi rất nóng.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (40, 5, N'そして', N'Và ／ hơn nữa.

れい：
・このまちは　しずかです。そして　きれいです。
Thành phố này yên tĩnh và đẹp.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (41, 5, N'なんの　Nですか。', N'Thể hiện thuộc tính, chủng loại, lĩnh vực… của sự vật

れい：
・これは　なんの　ざっしですか。
Đây là tạp chí về cái gì?
・これは　コンピューターの　ざっしです。
Đây là quyển tạp chí về máy tính.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (42, 5, N'N  を　（～つ）ください。', N'Cho tôi  ～ cái　N

れい：
　　　A：すみません、　ちゅうもんをおねがいします。
てんいん：はい、どうぞ。
　　　A：カレーを　ひとつ（１つ）ください。
てんいん：はい。
Dịch:
A： Xin lỗi, vui lòng cho tôi gọi món.
Nhân viên： Vâng, xin mời.
A： Cho tôi 1 Cà-ri.
Nhân viên： Vâng.
----
　　　A：　すみません、　ちゅうもんをおねがいします。
てんいん：　はい、どうぞ。
　　　A：　このビールは　どこのビールですか。
てんいん：　ドイツのビールです。
　　　A：　じゃ、カレーを　ふたつ（２つ）と　ビールを　みっつ（３つ）　ください。
てんいん：　カレーを２つとビールを３つですね。しょうしょうおまちください。
Dịch：
A： Xin lỗi, vui lòng cho tôi gọi món.
Nhân viên：Vâng, xin mời.
A： Bia này là bia của nước nào vậy?
Nhân viên： Bia của Đức.
A： Vậy cho tôi 2 Cà-ri và 3 bia.
Nhân viên： 2 cà-ri và 3 bia đúng không nhỉ. Xin vui lòng chờ 1 chút.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (43, 5, N'N(～ご)で　～', N'Trong ngôn ngữ ～ 

れい：
・ぶたにくは　えいごで　なんですか。
Thịt lợn trong tiếng Anh là gì?
・「Pork」 です。Là Pork
----
・「Beef」は　にほんごで　なんですか。
Beef trong tiếng nhật là gì?

・「ぎゅうにく」です。
Là thịt bò (ぎゅうにく).
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (44, 6, N'N（ばしょ１）から　N（ばしょ２）まで　どのぐらいですか／　どのぐらいかかりますか。
N（ばしょ１）から　N（ばしょ２）まで　(～じかん・ふん)です。', N'-Từ địa điểm N1 đến địa điểm N2 là khoảng bao lâu?
-Từ địa điểm N1 đến địa điểm N2 là khoảng ~ thời gian／ phút, giờ…

れい：
・ハノイから　ホチミンし　まで　どのぐらいですか。
Từ Hà Nội đến Tp HCM mất bao lâu?
・ハノイから　ホチミンし　まで　２じかんはんぐらいです。
Từ Hà Nội đến Tp HCM mất khoảng 2 tiếng rưỡi.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (45, 6, N'N（のりもの）　で', N'Bằng phương tiện N

れい：
・ハノイから　ホアラクまで　バスで　１じかんぐらいかかります。
Từ Hà Nội đến Hòa Lạc mất khoảng 1 tiếng đi bằng xe bus.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (46, 6, N'どうですか。
どんな　Nですか。', N'Cả 2 mẫu này đều là như thế nào ／ thế nào.
Nhưng　どう　thì đứng một mình còn　どんな　thì đi kèm với danh từ.

れい：
・ハノイは　どうですか。
Hà Nội thế nào?
・・・ハノイは　あついです。
Hà Nội nóng!
・ハノイは　どんなところですか。
Hà Nội là nơi như thế nào?
・・・ハノイは　とてもあついところです。
Hà nội là 1 nơi rất nóng.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (47, 6, N'Nは　どこですか。
ここ／そこ／あそこ 
こちら／そちら／あちら', N'どこ／どちら ở đây được dùng để hỏi địa điểm của danh từ N.
ここ／そこ／あそこ  : ở đây ／ ở đó ／ ở kia.
こちら／そちら／あちら  : hướng này ／ hướng đó ／ hướng kia.

例（れい）：
A：　Bさん、きょうしつは　どこですか。
          B ơi, lớp học ở đâu thế?
B：　きょうしつは　あそこです。 
          Lớp học ở đằng kia.
----
  　      A：　すみません、トイレは　どこですか。
　　　　　　Xin lỗi cho tôi hỏi WC ở đâu thế?
てんいん：　トイレは　あちらです。
　　　　　　WC ở đằng kia.
-----
A：　せんせいは　どこですか。
　　　Thầy giáo đang ở đâu thế?
B：　きょうしつです。
　　　Thầy giáo đang ở trong lớp.
Lưu ý không dịch: Thầy giáo là lớp học.
Câu hỏi どこですか。Có câu trả lời là những từ ngữ chỉ vị trí như: ここ／そこ／あそこ
Nhưng lúc người trả lời muốn nói 1 cách lịch sự thì sẽ dùng　こちら／そちら／あちら　thay thế.
Ngoài ra còn có thể trả lời bằng những danh từ chỉ địa điểm như lớp học, nhà ăn,....
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (48, 6, N'Vます／ません', N'Động từ thể khẳng định／ phủ định.

れい：
・アンさんは　まいにち、あさごはんをたべますか。
Mỗi buổi sáng An có ăn sáng không?
・・・はい、たべます。
Có, có ăn.
・・・いいえ、たべません。
Không, không ăn.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (49, 6, N'N（ばしょ）へ    Vます', N'N (Địa điểm)  へ　Động từ di chuyển.
へ：trợ từ đi kèm với các động từ di chuyển, chỉ đứng sau các danh từ chỉ địa điểm hoặc hướng, chỉ hướng đến của hành động.
へ　いきます　：đi
へ　きます　　：đến
へ　かえります：về

れい：
・わたしは　まいにち　がっこうへ　いきます。
Mỗi ngày tôi đi tới trường (đi học).
・わたしは　まいばん　へやへ　かえります。
Mỗi tối tôi trở về phòng.
・わたしは　まいあさ　がっこうへ　きます。
Mỗi ngày tôi đến trường (đi học)
Lưu ý ví dụ 3 được nói lúc đang đứng ở trường, còn ví dụ số 1 thì có được nói lúc không ở trường.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (50, 6, N'N　を　Vます', N'Động từ V tác động trực tiếp lên sự vật, đối tượng N. 
Các động từ này đi kèm với trợ từ　を　(đọc là ô).
Một số động từ đi kèm trợ từ 　を：
たべます：　　　　ăn
のみます：　　　　uống
みます：　　　　　xem
します：　　　　　làm／chơi
べんきょうします：học
かきます：　　　　viết／ vẽ
よみます：　　　　đọc….
Một số danh từ chỉ hành động đi kèm với　します　trở thành danh động từ
サッカーを　します：　đá bóng
ダンスを　　します：　nhảy
しょくじを　します：　ăn, dùng bữa
テニスを　　します：　chơi tennis
スポッツを　します：　chơi thể thao

れい：
・まいあさ　わたしは　パンを　たべます。
Mỗi sáng tôi ăn bánh mì.
・まいばん　わたしは　はちじに　にっきを　かきます。
Mỗi tối tôi đều viết nhật kí vào lúc 8h.
・あした　わたしは　サッカを　します。
Ngày mai tôi sẽ chơi đá bóng.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (51, 6, N'N  を　（～つ）ください。', N'Cho tôi  ～ cái　N

れい：
　　　A：すみません、　ちゅうもんをおねがいします。
てんいん：はい、どうぞ。
　　　A：カレーを　ひとつ（１つ）ください。
てんいん：はい。
Dịch:
A： Xin lỗi, vui lòng cho tôi gọi món.
Nhân viên： Vâng, xin mời.
A： Cho tôi 1 Cà-ri.
Nhân viên： Vâng.
----
　　　A：　すみません、　ちゅうもんをおねがいします。
てんいん：　はい、どうぞ。
　　　A：　このビールは　どこのビールですか。
てんいん：　ドイツのビールです。
　　　A：　じゃ、カレーを　ふたつ（２つ）と　ビールを　みっつ（３つ）　ください。
てんいん：　カレーを２つとビールを３つですね。しょうしょうおまちください。
Dịch：
A： Xin lỗi, vui lòng cho tôi gọi món.
Nhân viên：Vâng, xin mời.
A： Bia này là bia của nước nào vậy?
Nhân viên： Bia của Đức.
A： Vậy cho tôi 2 Cà-ri và 3 bia.
Nhân viên： 2 cà-ri và 3 bia đúng không nhỉ. Xin vui lòng chờ 1 chút.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (52, 6, N'N(～ご)で　～', N'Trong ngôn ngữ ～ 

れい：
・ぶたにくは　えいごで　なんですか。
Thịt lợn trong tiếng Anh là gì?
・「Pork」 です。Là Pork
----
・「Beef」は　にほんごで　なんですか。
Beef trong tiếng nhật là gì?

・「ぎゅうにく」です。
Là thịt bò (ぎゅうにく).
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (53, 7, N'_________が、____________', N'～　nhưng　～

れい：
・わたしのまちは　おおきくないですが、いいところです。
Thành phố của tôi không lớn, nhưng mà là một nơi tốt.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (54, 7, N'___________ね', N'～ nhỉ

れい：
・あつですね。
Nóng nhỉ!!
・そうですね。
Uhm, nóng thật.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (55, 7, N'Nは　どこですか。
ここ／そこ／あそこ 
こちら／そちら／あちら', N'どこ／どちら ở đây được dùng để hỏi địa điểm của danh từ N.
ここ／そこ／あそこ  : ở đây ／ ở đó ／ ở kia.
こちら／そちら／あちら  : hướng này ／ hướng đó ／ hướng kia.

例（れい）：
A：　Bさん、きょうしつは　どこですか。
          B ơi, lớp học ở đâu thế?
B：　きょうしつは　あそこです。 
          Lớp học ở đằng kia.
----
  　      A：　すみません、トイレは　どこですか。
　　　　　　Xin lỗi cho tôi hỏi WC ở đâu thế?
てんいん：　トイレは　あちらです。
　　　　　　WC ở đằng kia.
-----
A：　せんせいは　どこですか。
　　　Thầy giáo đang ở đâu thế?
B：　きょうしつです。
　　　Thầy giáo đang ở trong lớp.
Lưu ý không dịch: Thầy giáo là lớp học.
Câu hỏi どこですか。Có câu trả lời là những từ ngữ chỉ vị trí như: ここ／そこ／あそこ
Nhưng lúc người trả lời muốn nói 1 cách lịch sự thì sẽ dùng　こちら／そちら／あちら　thay thế.
Ngoài ra còn có thể trả lời bằng những danh từ chỉ địa điểm như lớp học, nhà ăn,....
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (56, 7, N'いくらですか。', N'Giá bao nhiêu?

れい：
・そのほんは　いくらですか。
Quyển sách đó giá bao nhiêu?
・５５００えんです。
5500 Yên.
・これは　いくらですか。
Cái này bao nhiêu tiền thế?
・それは　１まんえんです。
Cái đó giá 10000Yên.
Số đếm + えん　＝　～Yên
Số đếm + ドル　＝　～Dolla
Số đếm + ドン　＝　～VNĐ
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (57, 7, N'N（のりもの）　で', N'Bằng phương tiện N

れい：
・ハノイから　ホアラクまで　バスで　１じかんぐらいかかります。
Từ Hà Nội đến Hòa Lạc mất khoảng 1 tiếng đi bằng xe bus.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (58, 7, N'どうですか。
どんな　Nですか。', N'Cả 2 mẫu này đều là như thế nào ／ thế nào.
Nhưng　どう　thì đứng một mình còn　どんな　thì đi kèm với danh từ.

れい：
・ハノイは　どうですか。
Hà Nội thế nào?
・・・ハノイは　あついです。
Hà Nội nóng!
・ハノイは　どんなところですか。
Hà Nội là nơi như thế nào?
・・・ハノイは　とてもあついところです。
Hà nội là 1 nơi rất nóng.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (59, 7, N'Nは　どこですか。
ここ／そこ／あそこ 
こちら／そちら／あちら', N'どこ／どちら ở đây được dùng để hỏi địa điểm của danh từ N.
ここ／そこ／あそこ  : ở đây ／ ở đó ／ ở kia.
こちら／そちら／あちら  : hướng này ／ hướng đó ／ hướng kia.

例（れい）：
A：　Bさん、きょうしつは　どこですか。
          B ơi, lớp học ở đâu thế?
B：　きょうしつは　あそこです。 
          Lớp học ở đằng kia.
----
  　      A：　すみません、トイレは　どこですか。
　　　　　　Xin lỗi cho tôi hỏi WC ở đâu thế?
てんいん：　トイレは　あちらです。
　　　　　　WC ở đằng kia.
-----
A：　せんせいは　どこですか。
　　　Thầy giáo đang ở đâu thế?
B：　きょうしつです。
　　　Thầy giáo đang ở trong lớp.
Lưu ý không dịch: Thầy giáo là lớp học.
Câu hỏi どこですか。Có câu trả lời là những từ ngữ chỉ vị trí như: ここ／そこ／あそこ
Nhưng lúc người trả lời muốn nói 1 cách lịch sự thì sẽ dùng　こちら／そちら／あちら　thay thế.
Ngoài ra còn có thể trả lời bằng những danh từ chỉ địa điểm như lớp học, nhà ăn,....
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (60, 7, N'N  を　（～つ）ください。', N'Cho tôi  ～ cái　N

れい：
　　　A：すみません、　ちゅうもんをおねがいします。
てんいん：はい、どうぞ。
　　　A：カレーを　ひとつ（１つ）ください。
てんいん：はい。
Dịch:
A： Xin lỗi, vui lòng cho tôi gọi món.
Nhân viên： Vâng, xin mời.
A： Cho tôi 1 Cà-ri.
Nhân viên： Vâng.
----
　　　A：　すみません、　ちゅうもんをおねがいします。
てんいん：　はい、どうぞ。
　　　A：　このビールは　どこのビールですか。
てんいん：　ドイツのビールです。
　　　A：　じゃ、カレーを　ふたつ（２つ）と　ビールを　みっつ（３つ）　ください。
てんいん：　カレーを２つとビールを３つですね。しょうしょうおまちください。
Dịch：
A： Xin lỗi, vui lòng cho tôi gọi món.
Nhân viên：Vâng, xin mời.
A： Bia này là bia của nước nào vậy?
Nhân viên： Bia của Đức.
A： Vậy cho tôi 2 Cà-ri và 3 bia.
Nhân viên： 2 cà-ri và 3 bia đúng không nhỉ. Xin vui lòng chờ 1 chút.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (61, 7, N'N(～ご)で　～', N'Trong ngôn ngữ ～ 

れい：
・ぶたにくは　えいごで　なんですか。
Thịt lợn trong tiếng Anh là gì?
・「Pork」 です。Là Pork
----
・「Beef」は　にほんごで　なんですか。
Beef trong tiếng nhật là gì?

・「ぎゅうにく」です。
Là thịt bò (ぎゅうにく).
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (62, 8, N'Nは　どこですか。
ここ／そこ／あそこ 
こちら／そちら／あちら', N'どこ／どちら ở đây được dùng để hỏi địa điểm của danh từ N.
ここ／そこ／あそこ  : ở đây ／ ở đó ／ ở kia.
こちら／そちら／あちら  : hướng này ／ hướng đó ／ hướng kia.

例（れい）：
A：　Bさん、きょうしつは　どこですか。
          B ơi, lớp học ở đâu thế?
B：　きょうしつは　あそこです。 
          Lớp học ở đằng kia.
----
  　      A：　すみません、トイレは　どこですか。
　　　　　　Xin lỗi cho tôi hỏi WC ở đâu thế?
てんいん：　トイレは　あちらです。
　　　　　　WC ở đằng kia.
-----
A：　せんせいは　どこですか。
　　　Thầy giáo đang ở đâu thế?
B：　きょうしつです。
　　　Thầy giáo đang ở trong lớp.
Lưu ý không dịch: Thầy giáo là lớp học.
Câu hỏi どこですか。Có câu trả lời là những từ ngữ chỉ vị trí như: ここ／そこ／あそこ
Nhưng lúc người trả lời muốn nói 1 cách lịch sự thì sẽ dùng　こちら／そちら／あちら　thay thế.
Ngoài ra còn có thể trả lời bằng những danh từ chỉ địa điểm như lớp học, nhà ăn,....
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (63, 8, N'いくらですか。', N'Giá bao nhiêu?

れい：
・そのほんは　いくらですか。
Quyển sách đó giá bao nhiêu?
・５５００えんです。
5500 Yên.
・これは　いくらですか。
Cái này bao nhiêu tiền thế?
・それは　１まんえんです。
Cái đó giá 10000Yên.
Số đếm + えん　＝　～Yên
Số đếm + ドル　＝　～Dolla
Số đếm + ドン　＝　～VNĐ
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (64, 8, N'どうですか。
どんな　Nですか。', N'Cả 2 mẫu này đều là như thế nào ／ thế nào.
Nhưng　どう　thì đứng một mình còn　どんな　thì đi kèm với danh từ.

れい：
・ハノイは　どうですか。
Hà Nội thế nào?
・・・ハノイは　あついです。
Hà Nội nóng!
・ハノイは　どんなところですか。
Hà Nội là nơi như thế nào?
・・・ハノイは　とてもあついところです。
Hà nội là 1 nơi rất nóng.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (65, 8, N'いくらですか。', N'Giá bao nhiêu?

れい：
・そのほんは　いくらですか。
Quyển sách đó giá bao nhiêu?
・５５００えんです。
5500 Yên.
・これは　いくらですか。
Cái này bao nhiêu tiền thế?
・それは　１まんえんです。
Cái đó giá 10000Yên.
Số đếm + えん　＝　～Yên
Số đếm + ドル　＝　～Dolla
Số đếm + ドン　＝　～VNĐ
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (66, 8, N'とても／たいへん　Aです。
あまり／ぜんぜん　イAくないです／ナAじゃ　ありません。
すこし／ちょっと　Aです。', N'とても：　　　　rất, lắm
たいへん：　　　cực kì, vô cùng
あまり：　　　　không ~ lắm
ぜんぜん：　　　hoàn toàn không
すこし／ちょっと：một chút, một ít, hơi, hơi hơi
Đây là các phó từ thường đứng trước tính từ và động từ để bổ nghĩa cho chúng.
Lưu ý　あまり　và　ぜんぜん　luôn đi với các động từ ở thể phủ định.

れい：
・ベトナムは　ふゆ、とても　さむいです。
Việt Nam vào mùa đông thì rất lạnh.
・とうきょうは　たいへん　にぎやかです。
Tokyo vô cùng nhộn nhịp.
・このこうえんは　あまり　おおきくないです。
Công viên này không to lắm.
・わたしのせんせいは　ぜんぜん　ハンサムじゃありません。
Thầy giáo tôi hoàn toàn không đẹp trai.
・このへやは　すこし　ふるいです。
Căn phòng này hơi cũ.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (67, 8, N'N1（ばしょ）に　N2が　あります', N'Ở vị trí N1 có vật thể N2.

れい：
・わたしのまちに　きれいなかわが　あります。
Ở thành phố của tôi có con sông đẹp.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (68, 8, N'N  を　（～つ）ください。', N'Cho tôi  ～ cái　N

れい：
　　　A：すみません、　ちゅうもんをおねがいします。
てんいん：はい、どうぞ。
　　　A：カレーを　ひとつ（１つ）ください。
てんいん：はい。
Dịch:
A： Xin lỗi, vui lòng cho tôi gọi món.
Nhân viên： Vâng, xin mời.
A： Cho tôi 1 Cà-ri.
Nhân viên： Vâng.
----
　　　A：　すみません、　ちゅうもんをおねがいします。
てんいん：　はい、どうぞ。
　　　A：　このビールは　どこのビールですか。
てんいん：　ドイツのビールです。
　　　A：　じゃ、カレーを　ふたつ（２つ）と　ビールを　みっつ（３つ）　ください。
てんいん：　カレーを２つとビールを３つですね。しょうしょうおまちください。
Dịch：
A： Xin lỗi, vui lòng cho tôi gọi món.
Nhân viên：Vâng, xin mời.
A： Bia này là bia của nước nào vậy?
Nhân viên： Bia của Đức.
A： Vậy cho tôi 2 Cà-ri và 3 bia.
Nhân viên： 2 cà-ri và 3 bia đúng không nhỉ. Xin vui lòng chờ 1 chút.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (69, 8, N'N(～ご)で　～', N'Trong ngôn ngữ ～ 

れい：
・ぶたにくは　えいごで　なんですか。
Thịt lợn trong tiếng Anh là gì?
・「Pork」 です。Là Pork
----
・「Beef」は　にほんごで　なんですか。
Beef trong tiếng nhật là gì?

・「ぎゅうにく」です。
Là thịt bò (ぎゅうにく).
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (70, 9, N'N（のりもの）　で', N'Bằng phương tiện N

れい：
・ハノイから　ホアラクまで　バスで　１じかんぐらいかかります。
Từ Hà Nội đến Hòa Lạc mất khoảng 1 tiếng đi bằng xe bus.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (71, 9, N'どうですか。
どんな　Nですか。', N'Cả 2 mẫu này đều là như thế nào ／ thế nào.
Nhưng　どう　thì đứng một mình còn　どんな　thì đi kèm với danh từ.

れい：
・ハノイは　どうですか。
Hà Nội thế nào?
・・・ハノイは　あついです。
Hà Nội nóng!
・ハノイは　どんなところですか。
Hà Nội là nơi như thế nào?
・・・ハノイは　とてもあついところです。
Hà nội là 1 nơi rất nóng.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (72, 9, N'そして', N'Và ／ hơn nữa.

れい：
・このまちは　しずかです。そして　きれいです。
Thành phố này yên tĩnh và đẹp.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (73, 9, N'_________が、____________', N'～　nhưng　～

れい：
・わたしのまちは　おおきくないですが、いいところです。
Thành phố của tôi không lớn, nhưng mà là một nơi tốt.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (74, 9, N'いくらですか。', N'Giá bao nhiêu?

れい：
・そのほんは　いくらですか。
Quyển sách đó giá bao nhiêu?
・５５００えんです。
5500 Yên.
・これは　いくらですか。
Cái này bao nhiêu tiền thế?
・それは　１まんえんです。
Cái đó giá 10000Yên.
Số đếm + えん　＝　～Yên
Số đếm + ドル　＝　～Dolla
Số đếm + ドン　＝　～VNĐ
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (75, 9, N'だれの　N　ですか。', N'Thể hiện sự sở hữu
・これは　だれのほんですか。
Đây là quyển sách của ai?
・これは　Nguyenさんのほんです。
Đây là quyển sách của Nguyên
----
・こちらは　だれのこいびと／だれ　ですか。
Đây là người yêu của ai／ là ai?
・わたしの　こいびとです。
Là người yêu của tôi.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (76, 9, N'どこの　Nですか。', N'Thể hiện nguồn gốc, xuất xứ, hãng… của đồ vật

れい：
・これは　どこのけいたいでんわですか。
Cái này là đt của hãng nào／ nước nào?
・これは　APPLEの（けいたいでんわ）です。
Cái này là(smartphone) của Apple.
・これは　どこのくつですか。
Đây là đôi giày của nước nào／ hãng nào?
・このくつは　日本のです。
Đôi giày này là của Nhật.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (77, 9, N'なんの　Nですか。', N'Thể hiện thuộc tính, chủng loại, lĩnh vực… của sự vật

れい：
・これは　なんの　ざっしですか。
Đây là tạp chí về cái gì?
・これは　コンピューターの　ざっしです。
Đây là quyển tạp chí về máy tính.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (78, 9, N'N  を　（～つ）ください。', N'Cho tôi  ～ cái　N

れい：
　　　A：すみません、　ちゅうもんをおねがいします。
てんいん：はい、どうぞ。
　　　A：カレーを　ひとつ（１つ）ください。
てんいん：はい。
Dịch:
A： Xin lỗi, vui lòng cho tôi gọi món.
Nhân viên： Vâng, xin mời.
A： Cho tôi 1 Cà-ri.
Nhân viên： Vâng.
----
　　　A：　すみません、　ちゅうもんをおねがいします。
てんいん：　はい、どうぞ。
　　　A：　このビールは　どこのビールですか。
てんいん：　ドイツのビールです。
　　　A：　じゃ、カレーを　ふたつ（２つ）と　ビールを　みっつ（３つ）　ください。
てんいん：　カレーを２つとビールを３つですね。しょうしょうおまちください。
Dịch：
A： Xin lỗi, vui lòng cho tôi gọi món.
Nhân viên：Vâng, xin mời.
A： Bia này là bia của nước nào vậy?
Nhân viên： Bia của Đức.
A： Vậy cho tôi 2 Cà-ri và 3 bia.
Nhân viên： 2 cà-ri và 3 bia đúng không nhỉ. Xin vui lòng chờ 1 chút.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (79, 9, N'N(～ご)で　～', N'Trong ngôn ngữ ～ 

れい：
・ぶたにくは　えいごで　なんですか。
Thịt lợn trong tiếng Anh là gì?
・「Pork」 です。Là Pork
----
・「Beef」は　にほんごで　なんですか。
Beef trong tiếng nhật là gì?

・「ぎゅうにく」です。
Là thịt bò (ぎゅうにく).
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (80, 10, N'N（じかん）に　Vます', N'Thực hiện hành động V tại thời điểm N.
Trợ từ に dịch là vào, vào lúc.
Đứng sau thời gian cụ thể, như giờ cụ thể, hoặc ngày cụ thể( những mốc thời gian có số) để thể hiện thời điểm hành động xảy ra.
Không dùng trợ từ に sau những thời gian k có số đi kèm.
Trường hợp đặc biệt:
Với các ngày trong tuần ～ようび　và kì nghỉ như kì nghỉ hè   なつやすみ　thì tùy vào ngữ cảnh của câu có thể là thời gian cụ thể ( T2 tuần này, kì nghỉ hè năm nay...) hoặc không, cho nên có thể có に ở phía sau hay không có đều được.

れい：
・わたしは　まいあさ　ろくじに　おきます
Mỗi buổi sáng tôi thức dậy lúc 6h.
・わたしは　まいばん　じゅういちじに　ねます。
Mỗi tối tôi đi ngủ lúc 11h.
Ở 2 câu trên thì sau   まいああさ   và   まいばん　thì không có   に　mặc dù chúng đều là từ chỉ thời gian, vì chúng không chỉ thời gian cụ thể ( không có số).
Lưu ý bảng cách đếm giờ và đếm ngày ở trang 286 sách   できるにほんご   quyển 1.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (81, 10, N'N（じかん・ようび）から　N（じかん・ようび）まで', N'Từ thời điểm (giờ ／ ngày) đến thời điểm (giờ ／ ngày)

れい：
・みどりゆうびんきょくは　ごぜんくじから　ごご　ごじまでです。
Bưu điện Xanh hoạt động từ 9h sáng đến 5h chiều.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (82, 10, N'Vます／ません', N'Động từ thể khẳng định／ phủ định.

れい：
・アンさんは　まいにち、あさごはんをたべますか。
Mỗi buổi sáng An có ăn sáng không?
・・・はい、たべます。
Có, có ăn.
・・・いいえ、たべません。
Không, không ăn.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (83, 10, N'いくらですか。', N'Giá bao nhiêu?

れい：
・そのほんは　いくらですか。
Quyển sách đó giá bao nhiêu?
・５５００えんです。
5500 Yên.
・これは　いくらですか。
Cái này bao nhiêu tiền thế?
・それは　１まんえんです。
Cái đó giá 10000Yên.
Số đếm + えん　＝　～Yên
Số đếm + ドル　＝　～Dolla
Số đếm + ドン　＝　～VNĐ
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (84, 10, N'だれの　N　ですか。', N'Thể hiện sự sở hữu
・これは　だれのほんですか。
Đây là quyển sách của ai?
・これは　Nguyenさんのほんです。
Đây là quyển sách của Nguyên
----
・こちらは　だれのこいびと／だれ　ですか。
Đây là người yêu của ai／ là ai?
・わたしの　こいびとです。
Là người yêu của tôi.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (85, 10, N'どこの　Nですか。', N'Thể hiện nguồn gốc, xuất xứ, hãng… của đồ vật

れい：
・これは　どこのけいたいでんわですか。
Cái này là đt của hãng nào／ nước nào?
・これは　APPLEの（けいたいでんわ）です。
Cái này là(smartphone) của Apple.
・これは　どこのくつですか。
Đây là đôi giày của nước nào／ hãng nào?
・このくつは　日本のです。
Đôi giày này là của Nhật.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (86, 10, N'なんの　Nですか。', N'Thể hiện thuộc tính, chủng loại, lĩnh vực… của sự vật

れい：
・これは　なんの　ざっしですか。
Đây là tạp chí về cái gì?
・これは　コンピューターの　ざっしです。
Đây là quyển tạp chí về máy tính.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (87, 10, N'N  を　（～つ）ください。', N'Cho tôi  ～ cái　N

れい：
　　　A：すみません、　ちゅうもんをおねがいします。
てんいん：はい、どうぞ。
　　　A：カレーを　ひとつ（１つ）ください。
てんいん：はい。
Dịch:
A： Xin lỗi, vui lòng cho tôi gọi món.
Nhân viên： Vâng, xin mời.
A： Cho tôi 1 Cà-ri.
Nhân viên： Vâng.
----
　　　A：　すみません、　ちゅうもんをおねがいします。
てんいん：　はい、どうぞ。
　　　A：　このビールは　どこのビールですか。
てんいん：　ドイツのビールです。
　　　A：　じゃ、カレーを　ふたつ（２つ）と　ビールを　みっつ（３つ）　ください。
てんいん：　カレーを２つとビールを３つですね。しょうしょうおまちください。
Dịch：
A： Xin lỗi, vui lòng cho tôi gọi món.
Nhân viên：Vâng, xin mời.
A： Bia này là bia của nước nào vậy?
Nhân viên： Bia của Đức.
A： Vậy cho tôi 2 Cà-ri và 3 bia.
Nhân viên： 2 cà-ri và 3 bia đúng không nhỉ. Xin vui lòng chờ 1 chút.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (88, 10, N'N(～ご)で　～', N'Trong ngôn ngữ ～ 

れい：
・ぶたにくは　えいごで　なんですか。
Thịt lợn trong tiếng Anh là gì?
・「Pork」 です。Là Pork
----
・「Beef」は　にほんごで　なんですか。
Beef trong tiếng nhật là gì?

・「ぎゅうにく」です。
Là thịt bò (ぎゅうにく).
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (89, 11, N'これ／それ／あれ', N'Cái này／ cái đó／ cái kia
この được dùng khi vật ở gần người nói, xa người nghe.
その được dùng khi vật ở gần người nghe xa người nói. 
あの được dùng khi vật ở xa cả người nói và người nghe.

れい：
・これは　にほんごのほんです。
Đây là quyển sách tiếng nhật.
・それは　えんぴつです。
Đó là cái bút chì.
・あれは　けいたいでんわです。
Kia là cái điện thoại di động.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (90, 11, N'この／その／あの　N', N'Cái N này／ đó／ kia
Dùng như この／その／あの nhưng vật ở đây được chỉ rõ ra bằng danh từ N.

れい：
・このほんは　ナムさんのほんです。
Quyển sách này là sách của Nam.
・そのほんは　にほんごのほんです。
Quyển sách đó là sách tiếng Nhật.
・あのぺんは　わたしのぺんです。
Cây bút kia là bút của tôi.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (91, 11, N'Nは　どこですか。
ここ／そこ／あそこ 
こちら／そちら／あちら', N'どこ／どちら ở đây được dùng để hỏi địa điểm của danh từ N.
ここ／そこ／あそこ  : ở đây ／ ở đó ／ ở kia.
こちら／そちら／あちら  : hướng này ／ hướng đó ／ hướng kia.

例（れい）：
A：　Bさん、きょうしつは　どこですか。
          B ơi, lớp học ở đâu thế?
B：　きょうしつは　あそこです。 
          Lớp học ở đằng kia.
----
  　      A：　すみません、トイレは　どこですか。
　　　　　　Xin lỗi cho tôi hỏi WC ở đâu thế?
てんいん：　トイレは　あちらです。
　　　　　　WC ở đằng kia.
-----
A：　せんせいは　どこですか。
　　　Thầy giáo đang ở đâu thế?
B：　きょうしつです。
　　　Thầy giáo đang ở trong lớp.
Lưu ý không dịch: Thầy giáo là lớp học.
Câu hỏi どこですか。Có câu trả lời là những từ ngữ chỉ vị trí như: ここ／そこ／あそこ
Nhưng lúc người trả lời muốn nói 1 cách lịch sự thì sẽ dùng　こちら／そちら／あちら　thay thế.
Ngoài ra còn có thể trả lời bằng những danh từ chỉ địa điểm như lớp học, nhà ăn,....
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (92, 11, N'いくらですか。', N'Giá bao nhiêu?

れい：
・そのほんは　いくらですか。
Quyển sách đó giá bao nhiêu?
・５５００えんです。
5500 Yên.
・これは　いくらですか。
Cái này bao nhiêu tiền thế?
・それは　１まんえんです。
Cái đó giá 10000Yên.
Số đếm + えん　＝　～Yên
Số đếm + ドル　＝　～Dolla
Số đếm + ドン　＝　～VNĐ
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (93, 11, N'だれの　N　ですか。', N'Thể hiện sự sở hữu
・これは　だれのほんですか。
Đây là quyển sách của ai?
・これは　Nguyenさんのほんです。
Đây là quyển sách của Nguyên
----
・こちらは　だれのこいびと／だれ　ですか。
Đây là người yêu của ai／ là ai?
・わたしの　こいびとです。
Là người yêu của tôi.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (94, 11, N'どこの　Nですか。', N'Thể hiện nguồn gốc, xuất xứ, hãng… của đồ vật

れい：
・これは　どこのけいたいでんわですか。
Cái này là đt của hãng nào／ nước nào?
・これは　APPLEの（けいたいでんわ）です。
Cái này là(smartphone) của Apple.
・これは　どこのくつですか。
Đây là đôi giày của nước nào／ hãng nào?
・このくつは　日本のです。
Đôi giày này là của Nhật.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (95, 11, N'なんの　Nですか。', N'Thể hiện thuộc tính, chủng loại, lĩnh vực… của sự vật

れい：
・これは　なんの　ざっしですか。
Đây là tạp chí về cái gì?
・これは　コンピューターの　ざっしです。
Đây là quyển tạp chí về máy tính.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (96, 11, N'N  を　（～つ）ください。', N'Cho tôi  ～ cái　N

れい：
　　　A：すみません、　ちゅうもんをおねがいします。
てんいん：はい、どうぞ。
　　　A：カレーを　ひとつ（１つ）ください。
てんいん：はい。
Dịch:
A： Xin lỗi, vui lòng cho tôi gọi món.
Nhân viên： Vâng, xin mời.
A： Cho tôi 1 Cà-ri.
Nhân viên： Vâng.
----
　　　A：　すみません、　ちゅうもんをおねがいします。
てんいん：　はい、どうぞ。
　　　A：　このビールは　どこのビールですか。
てんいん：　ドイツのビールです。
　　　A：　じゃ、カレーを　ふたつ（２つ）と　ビールを　みっつ（３つ）　ください。
てんいん：　カレーを２つとビールを３つですね。しょうしょうおまちください。
Dịch：
A： Xin lỗi, vui lòng cho tôi gọi món.
Nhân viên：Vâng, xin mời.
A： Bia này là bia của nước nào vậy?
Nhân viên： Bia của Đức.
A： Vậy cho tôi 2 Cà-ri và 3 bia.
Nhân viên： 2 cà-ri và 3 bia đúng không nhỉ. Xin vui lòng chờ 1 chút.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (97, 11, N'N(～ご)で　～', N'Trong ngôn ngữ ～ 

れい：
・ぶたにくは　えいごで　なんですか。
Thịt lợn trong tiếng Anh là gì?
・「Pork」 です。Là Pork
----
・「Beef」は　にほんごで　なんですか。
Beef trong tiếng nhật là gì?

・「ぎゅうにく」です。
Là thịt bò (ぎゅうにく).
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (98, 12, N'N1は　N2です', N'N1 là N2.
Thể khẳng định, hiện tại hoặc tương lai.
N2 ở đây thể hiện 1 thuộc tính của N1.

れい：
・ミンさんは　がくせいです。
Minh là học sinh.
・クァンさんは　ベトナムじんです。
Quang là người Việt Nam.
・マイさんは　じゅうはっさいです。
Mai 18 tuổi.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (99, 12, N'N1は　N2ですか。', N'はい、N2です。
いいえ、N2では／じゃありません。

れい：
・ミンさんは　せんせいですか。
Minh là giáo viên phải không?
・・・はい、せんせいです。
Đúng, là giáo viên.
・・・いいえ、せんせいでは／じゃありません。
Không, không phải là giáo viên.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (100, 12, N'Nは　どちら／いつ／なんですか。', N'N là nước nào, khi nào, cái gì?
・どちら：có thể dùng hỏi đất nước, công ty, tập đoàn, hãng sản xuất…
・いつ：hỏi thời gian, lúc nào, khi nào
・なん：hỏi cái gì

れい：
・おくには　どちらですか。
Đất nước／ quê hương của bạn là gì?
・たんじょうには　いつですか。
Sinh nhật của bạn là khi nào?
・しゅみは　なんですか。
Sở thích của bạn là gì?
')
GO
print 'Processed 100 total records'
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (101, 12, N'いくらですか。', N'Giá bao nhiêu?

れい：
・そのほんは　いくらですか。
Quyển sách đó giá bao nhiêu?
・５５００えんです。
5500 Yên.
・これは　いくらですか。
Cái này bao nhiêu tiền thế?
・それは　１まんえんです。
Cái đó giá 10000Yên.
Số đếm + えん　＝　～Yên
Số đếm + ドル　＝　～Dolla
Số đếm + ドン　＝　～VNĐ
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (102, 12, N'だれの　N　ですか。', N'Thể hiện sự sở hữu
・これは　だれのほんですか。
Đây là quyển sách của ai?
・これは　Nguyenさんのほんです。
Đây là quyển sách của Nguyên
----
・こちらは　だれのこいびと／だれ　ですか。
Đây là người yêu của ai／ là ai?
・わたしの　こいびとです。
Là người yêu của tôi.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (103, 12, N'どこの　Nですか。', N'Thể hiện nguồn gốc, xuất xứ, hãng… của đồ vật

れい：
・これは　どこのけいたいでんわですか。
Cái này là đt của hãng nào／ nước nào?
・これは　APPLEの（けいたいでんわ）です。
Cái này là(smartphone) của Apple.
・これは　どこのくつですか。
Đây là đôi giày của nước nào／ hãng nào?
・このくつは　日本のです。
Đôi giày này là của Nhật.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (104, 12, N'なんの　Nですか。', N'Thể hiện thuộc tính, chủng loại, lĩnh vực… của sự vật

れい：
・これは　なんの　ざっしですか。
Đây là tạp chí về cái gì?
・これは　コンピューターの　ざっしです。
Đây là quyển tạp chí về máy tính.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (105, 12, N'N  を　（～つ）ください。', N'Cho tôi  ～ cái　N

れい：
　　　A：すみません、　ちゅうもんをおねがいします。
てんいん：はい、どうぞ。
　　　A：カレーを　ひとつ（１つ）ください。
てんいん：はい。
Dịch:
A： Xin lỗi, vui lòng cho tôi gọi món.
Nhân viên： Vâng, xin mời.
A： Cho tôi 1 Cà-ri.
Nhân viên： Vâng.
----
　　　A：　すみません、　ちゅうもんをおねがいします。
てんいん：　はい、どうぞ。
　　　A：　このビールは　どこのビールですか。
てんいん：　ドイツのビールです。
　　　A：　じゃ、カレーを　ふたつ（２つ）と　ビールを　みっつ（３つ）　ください。
てんいん：　カレーを２つとビールを３つですね。しょうしょうおまちください。
Dịch：
A： Xin lỗi, vui lòng cho tôi gọi món.
Nhân viên：Vâng, xin mời.
A： Bia này là bia của nước nào vậy?
Nhân viên： Bia của Đức.
A： Vậy cho tôi 2 Cà-ri và 3 bia.
Nhân viên： 2 cà-ri và 3 bia đúng không nhỉ. Xin vui lòng chờ 1 chút.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (106, 12, N'N(～ご)で　～', N'Trong ngôn ngữ ～ 

れい：
・ぶたにくは　えいごで　なんですか。
Thịt lợn trong tiếng Anh là gì?
・「Pork」 です。Là Pork
----
・「Beef」は　にほんごで　なんですか。
Beef trong tiếng nhật là gì?

・「ぎゅうにく」です。
Là thịt bò (ぎゅうにく).
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (107, 13, N'N1の　N2', N'Dịch là N2 của N1.
N2 ở đây là thuộc sở hữu của N1, hoặc là 1 bộ phận, 1 nhánh, 1 phần nhỏ hơn của N1.

れい：
・ハノイは　ベトナムのしゅとです。
Hà Nội là thủ đô của Việt Nam.
・わたしは　FPTだいがくの　がくせいです。
Tôi là sinh viên của trường ĐH FPT.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (108, 13, N'N1と　N2', N'N1 và N2. 
と ở đây dùng như AND của tiếng Anh.

れい：
・ナムさんのしゅみは　りょこうと　どくしょです。
Sở thích của Nam là du lịch và đọc sách.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (109, 13, N'Nも', N'Cũng

れい：
・わたしはFPTだいがくの　がくせいです。ミンさんも　FPTだいがくの　がくせいです。
Tôi là sv ĐH FPT, Minh cũng là sv ĐH FPT.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (110, 13, N'いくらですか。', N'Giá bao nhiêu?

れい：
・そのほんは　いくらですか。
Quyển sách đó giá bao nhiêu?
・５５００えんです。
5500 Yên.
・これは　いくらですか。
Cái này bao nhiêu tiền thế?
・それは　１まんえんです。
Cái đó giá 10000Yên.
Số đếm + えん　＝　～Yên
Số đếm + ドル　＝　～Dolla
Số đếm + ドン　＝　～VNĐ
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (111, 13, N'だれの　N　ですか。', N'Thể hiện sự sở hữu
・これは　だれのほんですか。
Đây là quyển sách của ai?
・これは　Nguyenさんのほんです。
Đây là quyển sách của Nguyên
----
・こちらは　だれのこいびと／だれ　ですか。
Đây là người yêu của ai／ là ai?
・わたしの　こいびとです。
Là người yêu của tôi.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (112, 13, N'どこの　Nですか。', N'Thể hiện nguồn gốc, xuất xứ, hãng… của đồ vật

れい：
・これは　どこのけいたいでんわですか。
Cái này là đt của hãng nào／ nước nào?
・これは　APPLEの（けいたいでんわ）です。
Cái này là(smartphone) của Apple.
・これは　どこのくつですか。
Đây là đôi giày của nước nào／ hãng nào?
・このくつは　日本のです。
Đôi giày này là của Nhật.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (113, 13, N'なんの　Nですか。', N'Thể hiện thuộc tính, chủng loại, lĩnh vực… của sự vật

れい：
・これは　なんの　ざっしですか。
Đây là tạp chí về cái gì?
・これは　コンピューターの　ざっしです。
Đây là quyển tạp chí về máy tính.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (114, 13, N'N  を　（～つ）ください。', N'Cho tôi  ～ cái　N

れい：
　　　A：すみません、　ちゅうもんをおねがいします。
てんいん：はい、どうぞ。
　　　A：カレーを　ひとつ（１つ）ください。
てんいん：はい。
Dịch:
A： Xin lỗi, vui lòng cho tôi gọi món.
Nhân viên： Vâng, xin mời.
A： Cho tôi 1 Cà-ri.
Nhân viên： Vâng.
----
　　　A：　すみません、　ちゅうもんをおねがいします。
てんいん：　はい、どうぞ。
　　　A：　このビールは　どこのビールですか。
てんいん：　ドイツのビールです。
　　　A：　じゃ、カレーを　ふたつ（２つ）と　ビールを　みっつ（３つ）　ください。
てんいん：　カレーを２つとビールを３つですね。しょうしょうおまちください。
Dịch：
A： Xin lỗi, vui lòng cho tôi gọi món.
Nhân viên：Vâng, xin mời.
A： Bia này là bia của nước nào vậy?
Nhân viên： Bia của Đức.
A： Vậy cho tôi 2 Cà-ri và 3 bia.
Nhân viên： 2 cà-ri và 3 bia đúng không nhỉ. Xin vui lòng chờ 1 chút.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (115, 13, N'N(～ご)で　～', N'Trong ngôn ngữ ～ 

れい：
・ぶたにくは　えいごで　なんですか。
Thịt lợn trong tiếng Anh là gì?
・「Pork」 です。Là Pork
----
・「Beef」は　にほんごで　なんですか。
Beef trong tiếng nhật là gì?

・「ぎゅうにく」です。
Là thịt bò (ぎゅうにく).
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (116, 14, N'これ／それ／あれ', N'Cái này／ cái đó／ cái kia
この được dùng khi vật ở gần người nói, xa người nghe.
その được dùng khi vật ở gần người nghe xa người nói. 
あの được dùng khi vật ở xa cả người nói và người nghe.

れい：
・これは　にほんごのほんです。
Đây là quyển sách tiếng nhật.
・それは　えんぴつです。
Đó là cái bút chì.
・あれは　けいたいでんわです。
Kia là cái điện thoại di động.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (117, 14, N'この／その／あの　N', N'Cái N này／ đó／ kia
Dùng như この／その／あの nhưng vật ở đây được chỉ rõ ra bằng danh từ N.

れい：
・このほんは　ナムさんのほんです。
Quyển sách này là sách của Nam.
・そのほんは　にほんごのほんです。
Quyển sách đó là sách tiếng Nhật.
・あのぺんは　わたしのぺんです。
Cây bút kia là bút của tôi.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (118, 14, N'Nは　どこですか。
ここ／そこ／あそこ 
こちら／そちら／あちら', N'どこ／どちら ở đây được dùng để hỏi địa điểm của danh từ N.
ここ／そこ／あそこ  : ở đây ／ ở đó ／ ở kia.
こちら／そちら／あちら  : hướng này ／ hướng đó ／ hướng kia.

例（れい）：
A：　Bさん、きょうしつは　どこですか。
          B ơi, lớp học ở đâu thế?
B：　きょうしつは　あそこです。 
          Lớp học ở đằng kia.
----
  　      A：　すみません、トイレは　どこですか。
　　　　　　Xin lỗi cho tôi hỏi WC ở đâu thế?
てんいん：　トイレは　あちらです。
　　　　　　WC ở đằng kia.
-----
A：　せんせいは　どこですか。
　　　Thầy giáo đang ở đâu thế?
B：　きょうしつです。
　　　Thầy giáo đang ở trong lớp.
Lưu ý không dịch: Thầy giáo là lớp học.
Câu hỏi どこですか。Có câu trả lời là những từ ngữ chỉ vị trí như: ここ／そこ／あそこ
Nhưng lúc người trả lời muốn nói 1 cách lịch sự thì sẽ dùng　こちら／そちら／あちら　thay thế.
Ngoài ra còn có thể trả lời bằng những danh từ chỉ địa điểm như lớp học, nhà ăn,....
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (119, 14, N'いくらですか。', N'Giá bao nhiêu?

れい：
・そのほんは　いくらですか。
Quyển sách đó giá bao nhiêu?
・５５００えんです。
5500 Yên.
・これは　いくらですか。
Cái này bao nhiêu tiền thế?
・それは　１まんえんです。
Cái đó giá 10000Yên.
Số đếm + えん　＝　～Yên
Số đếm + ドル　＝　～Dolla
Số đếm + ドン　＝　～VNĐ
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (120, 14, N'だれの　N　ですか。', N'Thể hiện sự sở hữu
・これは　だれのほんですか。
Đây là quyển sách của ai?
・これは　Nguyenさんのほんです。
Đây là quyển sách của Nguyên
----
・こちらは　だれのこいびと／だれ　ですか。
Đây là người yêu của ai／ là ai?
・わたしの　こいびとです。
Là người yêu của tôi.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (121, 14, N'どこの　Nですか。', N'Thể hiện nguồn gốc, xuất xứ, hãng… của đồ vật

れい：
・これは　どこのけいたいでんわですか。
Cái này là đt của hãng nào／ nước nào?
・これは　APPLEの（けいたいでんわ）です。
Cái này là(smartphone) của Apple.
・これは　どこのくつですか。
Đây là đôi giày của nước nào／ hãng nào?
・このくつは　日本のです。
Đôi giày này là của Nhật.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (122, 14, N'なんの　Nですか。', N'Thể hiện thuộc tính, chủng loại, lĩnh vực… của sự vật

れい：
・これは　なんの　ざっしですか。
Đây là tạp chí về cái gì?
・これは　コンピューターの　ざっしです。
Đây là quyển tạp chí về máy tính.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (123, 14, N'N  を　（～つ）ください。', N'Cho tôi  ～ cái　N

れい：
　　　A：すみません、　ちゅうもんをおねがいします。
てんいん：はい、どうぞ。
　　　A：カレーを　ひとつ（１つ）ください。
てんいん：はい。
Dịch:
A： Xin lỗi, vui lòng cho tôi gọi món.
Nhân viên： Vâng, xin mời.
A： Cho tôi 1 Cà-ri.
Nhân viên： Vâng.
----
　　　A：　すみません、　ちゅうもんをおねがいします。
てんいん：　はい、どうぞ。
　　　A：　このビールは　どこのビールですか。
てんいん：　ドイツのビールです。
　　　A：　じゃ、カレーを　ふたつ（２つ）と　ビールを　みっつ（３つ）　ください。
てんいん：　カレーを２つとビールを３つですね。しょうしょうおまちください。
Dịch：
A： Xin lỗi, vui lòng cho tôi gọi món.
Nhân viên：Vâng, xin mời.
A： Bia này là bia của nước nào vậy?
Nhân viên： Bia của Đức.
A： Vậy cho tôi 2 Cà-ri và 3 bia.
Nhân viên： 2 cà-ri và 3 bia đúng không nhỉ. Xin vui lòng chờ 1 chút.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (124, 14, N'N(～ご)で　～', N'Trong ngôn ngữ ～ 

れい：
・ぶたにくは　えいごで　なんですか。
Thịt lợn trong tiếng Anh là gì?
・「Pork」 です。Là Pork
----
・「Beef」は　にほんごで　なんですか。
Beef trong tiếng nhật là gì?

・「ぎゅうにく」です。
Là thịt bò (ぎゅうにく).
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (125, 15, N'N　を　Vます', N'Động từ V tác động trực tiếp lên sự vật, đối tượng N. 
Các động từ này đi kèm với trợ từ　を　(đọc là ô).
Một số động từ đi kèm trợ từ 　を：
たべます：　　　　ăn
のみます：　　　　uống
みます：　　　　　xem
します：　　　　　làm／chơi
べんきょうします：học
かきます：　　　　viết／ vẽ
よみます：　　　　đọc….
Một số danh từ chỉ hành động đi kèm với　します　trở thành danh động từ
サッカーを　します：　đá bóng
ダンスを　　します：　nhảy
しょくじを　します：　ăn, dùng bữa
テニスを　　します：　chơi tennis
スポッツを　します：　chơi thể thao

れい：
・まいあさ　わたしは　パンを　たべます。
Mỗi sáng tôi ăn bánh mì.
・まいばん　わたしは　はちじに　にっきを　かきます。
Mỗi tối tôi đều viết nhật kí vào lúc 8h.
・あした　わたしは　サッカを　します。
Ngày mai tôi sẽ chơi đá bóng.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (126, 15, N'N1や N2など', N'Nào là N1, nào là N2, Nào là N1, nào là N2, vânvân

れい：
・わたしは　まいあさ　パンや　サラダなどを　たべます。
Mỗi sáng tôi ăn nào là bánh mì, salad….
・わたしは　サッカーや　テニスなどを　します。
Tôi chơi nào là bóng đá, tennis…..
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (127, 15, N'なにも／どこ（へ）も　Vません', N'Không làm hành động V gì cả. Dịch là : không V gì cả
何(なに)も　しません　　　　Không làm gì cả
何も　たべません　　　　　　Không ăn gì cả
何も　のみません　　　　　　Không uống gì cả
何も　べんきょうしません　　Không học gì cả
-----
Tương tự với những động từ khác, đây là mẫu câu không làm gì cả.
Trợ từ 　を　được chuyển thành trợ từ　も.


れい：
・わたしは　なつやすみに　何(なに)も　べんきょうしません。
Vào kì nghỉ hè tôi không học gì cả.
・私は　きょう　なにも　たべません。
Hôm nay tôi không ăn gì cả.
- Với những động từ sử dụng trợ từ へ
どこ(へ)も　いきません　　Không đi đâu cả
どこ(へ)も　きません　　　Không đến đâu cả
どこ(へ)も　かえりません　Không về đâu cả
-----
Ở đây có へ　hay không  có　へ　đều được.

れい：
・わたしは　しゅうまつ　どこ（へ）も　いきません。Cuối tuần tôi không đi đâu cả.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (128, 15, N'だれの　N　ですか。', N'Thể hiện sự sở hữu
・これは　だれのほんですか。
Đây là quyển sách của ai?
・これは　Nguyenさんのほんです。
Đây là quyển sách của Nguyên
----
・こちらは　だれのこいびと／だれ　ですか。
Đây là người yêu của ai／ là ai?
・わたしの　こいびとです。
Là người yêu của tôi.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (129, 15, N'どこの　Nですか。', N'Thể hiện nguồn gốc, xuất xứ, hãng… của đồ vật

れい：
・これは　どこのけいたいでんわですか。
Cái này là đt của hãng nào／ nước nào?
・これは　APPLEの（けいたいでんわ）です。
Cái này là(smartphone) của Apple.
・これは　どこのくつですか。
Đây là đôi giày của nước nào／ hãng nào?
・このくつは　日本のです。
Đôi giày này là của Nhật.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (130, 15, N'なんの　Nですか。', N'Thể hiện thuộc tính, chủng loại, lĩnh vực… của sự vật

れい：
・これは　なんの　ざっしですか。
Đây là tạp chí về cái gì?
・これは　コンピューターの　ざっしです。
Đây là quyển tạp chí về máy tính.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (131, 15, N'N  を　（～つ）ください。', N'Cho tôi  ～ cái　N

れい：
　　　A：すみません、　ちゅうもんをおねがいします。
てんいん：はい、どうぞ。
　　　A：カレーを　ひとつ（１つ）ください。
てんいん：はい。
Dịch:
A： Xin lỗi, vui lòng cho tôi gọi món.
Nhân viên： Vâng, xin mời.
A： Cho tôi 1 Cà-ri.
Nhân viên： Vâng.
----
　　　A：　すみません、　ちゅうもんをおねがいします。
てんいん：　はい、どうぞ。
　　　A：　このビールは　どこのビールですか。
てんいん：　ドイツのビールです。
　　　A：　じゃ、カレーを　ふたつ（２つ）と　ビールを　みっつ（３つ）　ください。
てんいん：　カレーを２つとビールを３つですね。しょうしょうおまちください。
Dịch：
A： Xin lỗi, vui lòng cho tôi gọi món.
Nhân viên：Vâng, xin mời.
A： Bia này là bia của nước nào vậy?
Nhân viên： Bia của Đức.
A： Vậy cho tôi 2 Cà-ri và 3 bia.
Nhân viên： 2 cà-ri và 3 bia đúng không nhỉ. Xin vui lòng chờ 1 chút.
')
INSERT [dbo].[Grammar] ([ID], [LessonID], [Term], [Definition]) VALUES (132, 15, N'N(～ご)で　～', N'Trong ngôn ngữ ～ 

れい：
・ぶたにくは　えいごで　なんですか。
Thịt lợn trong tiếng Anh là gì?
・「Pork」 です。Là Pork
----
・「Beef」は　にほんごで　なんですか。
Beef trong tiếng nhật là gì?

・「ぎゅうにく」です。
Là thịt bò (ぎゅうにく).
')
SET IDENTITY_INSERT [dbo].[Grammar] OFF
/****** Object:  Table [dbo].[FavoriteWord]    Script Date: 03/23/2017 23:32:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavoriteWord](
	[UserID] [int] NOT NULL,
	[VocabularyID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Lesson_Book]    Script Date: 03/23/2017 23:32:36 ******/
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([ID])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_Book]
GO
/****** Object:  ForeignKey [FK_Vocabulary_Lesson]    Script Date: 03/23/2017 23:32:36 ******/
ALTER TABLE [dbo].[Vocabulary]  WITH CHECK ADD  CONSTRAINT [FK_Vocabulary_Lesson] FOREIGN KEY([LessonID])
REFERENCES [dbo].[Lesson] ([ID])
GO
ALTER TABLE [dbo].[Vocabulary] CHECK CONSTRAINT [FK_Vocabulary_Lesson]
GO
/****** Object:  ForeignKey [FK_Quiz_Lesson]    Script Date: 03/23/2017 23:32:36 ******/
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Quiz_Lesson] FOREIGN KEY([LessonID])
REFERENCES [dbo].[Lesson] ([ID])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [FK_Quiz_Lesson]
GO
/****** Object:  ForeignKey [FK_Kanji_Lesson]    Script Date: 03/23/2017 23:32:36 ******/
ALTER TABLE [dbo].[Kanji]  WITH CHECK ADD  CONSTRAINT [FK_Kanji_Lesson] FOREIGN KEY([LessonID])
REFERENCES [dbo].[Lesson] ([ID])
GO
ALTER TABLE [dbo].[Kanji] CHECK CONSTRAINT [FK_Kanji_Lesson]
GO
/****** Object:  ForeignKey [FK_Grammar_Lesson]    Script Date: 03/23/2017 23:32:36 ******/
ALTER TABLE [dbo].[Grammar]  WITH CHECK ADD  CONSTRAINT [FK_Grammar_Lesson] FOREIGN KEY([LessonID])
REFERENCES [dbo].[Lesson] ([ID])
GO
ALTER TABLE [dbo].[Grammar] CHECK CONSTRAINT [FK_Grammar_Lesson]
GO
/****** Object:  ForeignKey [FK_FavoriteWord_User]    Script Date: 03/23/2017 23:32:36 ******/
ALTER TABLE [dbo].[FavoriteWord]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteWord_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[FavoriteWord] CHECK CONSTRAINT [FK_FavoriteWord_User]
GO
/****** Object:  ForeignKey [FK_FavoriteWord_Vocabulary]    Script Date: 03/23/2017 23:32:36 ******/
ALTER TABLE [dbo].[FavoriteWord]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteWord_Vocabulary] FOREIGN KEY([VocabularyID])
REFERENCES [dbo].[Vocabulary] ([ID])
GO
ALTER TABLE [dbo].[FavoriteWord] CHECK CONSTRAINT [FK_FavoriteWord_Vocabulary]
GO
