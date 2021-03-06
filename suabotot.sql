USE [master]
GO
/****** Object:  Database [WebSuaBo]    Script Date: 29/08/2021 7:29:44 SA ******/
CREATE DATABASE [WebSuaBo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebSuaBo', FILENAME = N'E:\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\WebSuaBo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebSuaBo_log', FILENAME = N'E:\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\WebSuaBo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WebSuaBo] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebSuaBo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebSuaBo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebSuaBo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebSuaBo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebSuaBo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebSuaBo] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebSuaBo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebSuaBo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebSuaBo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebSuaBo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebSuaBo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebSuaBo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebSuaBo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebSuaBo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebSuaBo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebSuaBo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebSuaBo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebSuaBo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebSuaBo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebSuaBo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebSuaBo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebSuaBo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebSuaBo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebSuaBo] SET RECOVERY FULL 
GO
ALTER DATABASE [WebSuaBo] SET  MULTI_USER 
GO
ALTER DATABASE [WebSuaBo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebSuaBo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebSuaBo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebSuaBo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebSuaBo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebSuaBo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'WebSuaBo', N'ON'
GO
ALTER DATABASE [WebSuaBo] SET QUERY_STORE = OFF
GO
USE [WebSuaBo]
GO
/****** Object:  Table [dbo].[About]    Script Date: 29/08/2021 7:29:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Image] [nvarchar](250) NULL,
	[Descriptions] [nvarchar](500) NULL,
	[Detail] [ntext] NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifileDate] [datetime] NULL,
	[ModifileBy] [nvarchar](50) NULL,
	[MetaKeyword] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 29/08/2021 7:29:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifileDate] [datetime] NULL,
	[ModifileBy] [nvarchar](50) NULL,
	[MetaKeyword] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL,
	[ShowOnHome] [bit] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 29/08/2021 7:29:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Content]    Script Date: 29/08/2021 7:29:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Content](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Descriptions] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[CategoryID] [bigint] NULL,
	[Detail] [ntext] NULL,
	[Warranty] [int] NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifileDate] [datetime] NULL,
	[ModifileBy] [nvarchar](50) NULL,
	[MetaKeyword] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL,
	[TopHop] [datetime] NULL,
	[ViewCount] [int] NULL,
	[Tags] [nvarchar](500) NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentTag]    Script Date: 29/08/2021 7:29:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentTag](
	[ContentID] [bigint] NOT NULL,
	[TagID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ContentTag] PRIMARY KEY CLUSTERED 
(
	[ContentID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credential]    Script Date: 29/08/2021 7:29:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credential](
	[UserGroupID] [varchar](20) NOT NULL,
	[RoleID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Credentian] PRIMARY KEY CLUSTERED 
(
	[UserGroupID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 29/08/2021 7:29:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Content] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[Status] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Footer]    Script Date: 29/08/2021 7:29:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footer](
	[ID] [varchar](50) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Footer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 29/08/2021 7:29:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NULL,
	[Link] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Target] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[TypeID] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuType]    Script Date: 29/08/2021 7:29:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_MenuType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 29/08/2021 7:29:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NULL,
	[CustomerID] [bigint] NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipMobile] [varchar](50) NULL,
	[ShipAddress] [nvarchar](50) NULL,
	[ShipEmail] [nvarchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 29/08/2021 7:29:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ProductID] [bigint] NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 29/08/2021 7:29:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [varchar](20) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Descriptions] [nvarchar](max) NULL,
	[Image] [nvarchar](250) NULL,
	[MoreImages] [xml] NULL,
	[Price] [decimal](18, 0) NULL,
	[PromotionPrice] [decimal](18, 0) NULL,
	[IncludeVAT] [bit] NULL,
	[Quantity] [int] NULL,
	[CategoryID] [bigint] NULL,
	[Detail] [ntext] NULL,
	[Warranty] [int] NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifileDate] [datetime] NULL,
	[ModifileBy] [nvarchar](50) NULL,
	[MetaKeyword] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL,
	[TopHop] [datetime] NULL,
	[ViewCount] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 29/08/2021 7:29:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifileDate] [datetime] NULL,
	[ModifileBy] [nvarchar](50) NULL,
	[MetaKeyword] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL,
	[ShowOnHome] [bit] NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 29/08/2021 7:29:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 29/08/2021 7:29:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Link] [nvarchar](250) NULL,
	[Descriptions] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifileDate] [datetime] NULL,
	[ModifileBy] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemConfig]    Script Date: 29/08/2021 7:29:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemConfig](
	[ID] [varchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Value] [nvarchar](50) NULL,
	[Status] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 29/08/2021 7:29:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 29/08/2021 7:29:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[PassWord] [varchar](32) NULL,
	[GroupID] [varchar](20) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifileDate] [datetime] NULL,
	[ModifileBy] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 29/08/2021 7:29:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[ID] [varchar](20) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Footer] ([ID], [Content], [Status]) VALUES (N'Footer', N'<section class="footer-main pt-2">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-md-3">
                        <section id="black-studio-tinymce-2"
                                 class="col mt-2 mb-2 widget_black_studio_tinymce hotlinef1">
                            <h5 class="footer-title">TƯ VẤN BÁN HÀNG</h5>
                            <div class="textwidget">
                                <p>
                                    <span style="color: #808080;">
                                        <span style="font-size: 18pt;">
                                            <strong>
                                                <img height="30" width="30" src="/Asset/Client/img_sp/dt.png" /> <a href="#####">
                                                    <span style="color: #ff0000; font-size: 14pt;">
                                                        0961 922
                                                        556
                                                    </span>
                                                </a>
                                            </strong>
                                        </span> <span style="font-size: 10pt;">(Hotline - Zalo 1)</span>
                                    </span>
                                </p>
                                <p>
                                    <span style="color: #808080;">
                                        <span style="font-size: 18pt;">
                                            <strong>
                                                <img height="30" width="30" src="/Asset/Client/img_sp/dt.png" /> <a href="#####">
                                                    <span style="color: #ff0000; font-size: 14pt;">
                                                        0965 922
                                                        556
                                                    </span>
                                                </a>
                                            </strong>
                                        </span> <span style="font-size: 10pt;">(Hotline - Zalo 2)</span>
                                    </span>
                                </p>
                                <p>
                                    <span style="color: #808080;">
                                        <span style="font-size: 18pt;">
                                            <strong>
                                                <img height="30" width="30" src="/Asset/Client/img_sp/dt.png" /> <a href="######">
                                                    <span style="color: #ff0000; font-size: 14pt;">
                                                        0916 820
                                                        556
                                                    </span>
                                                </a>
                                            </strong>
                                        </span><span style="font-size: 10pt;">
                                            (Hotline - Zalo 3)
                                        </span>
                                    </span>
                                </p>
                            </div>
                        </section>
                        <section id="wpb_widget-2" class="col mt-2 mb-2 widget_wpb_widget col-12">
                            <div class="col">
                                <ul id="mangxahoi" class="nav">
                                    <li class="nav-item">
                                        <a class="p-2" rel="nofollow" href="#####">
                                            <img width="32" height="32"
                                                 src="https://suabottot.com/wp-content/themes/lindo/module/img/facebook.png"
                                                 alt="facebook" class="lazyloaded" data-ll-status="loaded"><noscript>
                                                <img width="32" height="32"
                                                     src="https://suabottot.com/wp-content/themes/lindo/module/img/facebook.png"
                                                     alt="facebook">
                                            </noscript>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="p-2" rel="nofollow" href="#####">
                                            <img width="32" height="32"
                                                 src="https://suabottot.com/wp-content/themes/lindo/module/img/youtube.png"
                                                 alt="youTube" class="lazyloaded" data-ll-status="loaded"><noscript>
                                                <img width="32" height="32"
                                                     src="https://suabottot.com/wp-content/themes/lindo/module/img/youtube.png"
                                                     alt="youTube">
                                            </noscript>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="p-2" rel="nofollow" href="#####">
                                            <img width="32" height="32"
                                                 src="https://suabottot.com/wp-content/themes/lindo/module/img/zalo.png"
                                                 alt="zalo" class="lazyloaded" data-ll-status="loaded"><noscript>
                                                <img width="32" height="32"
                                                     src="https://suabottot.com/wp-content/themes/lindo/module/img/zalo.png"
                                                     alt="zalo">
                                            </noscript>
                                        </a>
                                    </li>
                                </ul>
                            </div>

                        </section>
                    </div>
                    <div class="col-12 col-md-3">
                        <section id="nav_menu-2" class="col mt-2 mb-2 widget_nav_menu w-100 float-left">
                            <h5 class="footer-title">Chúng tôi là ai ?</h5>
                            <div class="menu-ve-sua-bot-tot-container">
                                <ul id="menu-ve-sua-bot-tot" class="menu">
                                    <li id="menu-item-30454"
                                        class="menu-item menu-item-type-post_type menu-item-object-post menu-item-30454">
                                        <a href="#####">
                                            Giới thiệu Sữa
                                            Bột Tốt
                                        </a>
                                    </li>
                                    <li id="menu-item-30463"
                                        class="menu-item menu-item-type-post_type menu-item-object-page menu-item-30463">
                                        <a href="#####">Tuyển Dụng</a>
                                    </li>
                                </ul>
                            </div>
                        </section>
                        <section id="media_image-2" class="col mt-2 mb-2 widget_media_image w-100 float-left mb-3">
                            <h5 class="footer-title">Vận Chuyển Thanh Toán</h5><img width="225" height="92"
                                                                                    src="https://suabottot.com/wp-content/uploads/2019/11/giaohang.png"
                                                                                    class="image wp-image-30456 attachment-full size-full lazyloaded" alt="Giao hàng"
                                                                                    style="max-width: 100%; height: auto;" data-ll-status="loaded"><noscript>
                                <img width="225" height="92"
                                     src="https://suabottot.com/wp-content/uploads/2019/11/giaohang.png"
                                     class="image wp-image-30456  attachment-full size-full" alt="Giao hàng"
                                     style="max-width: 100%; height: auto;" />
                            </noscript>
                        </section>
                    </div>
                    <div class="col-12 col-md-3">
                        <section id="nav_menu-3" class="col mt-2 mb-2 widget_nav_menu">
                            <h5 class="footer-title">Hỗ trợ khách hàng</h5>
                            <div class="menu-ho-tro-khach-hang-container">
                                <ul id="menu-ho-tro-khach-hang" class="menu">
                                    <li id="menu-item-6015"
                                        class="menu-item menu-item-type-post_type menu-item-object-post menu-item-6015">
                                        <a title="Mua sữa tích điểm nhận quà hấp dẫn" href="######">
                                            Tích
                                            điểm đổi quà
                                        </a>
                                    </li>
                                    <li id="menu-item-4058"
                                        class="menu-item menu-item-type-post_type menu-item-object-post menu-item-4058">
                                        <a href="#####">Hướng dẫn mua hàng</a>
                                    </li>
                                    <li id="menu-item-860"
                                        class="menu-item menu-item-type-post_type menu-item-object-post menu-item-860">
                                        <a href="####">Cam kết chất lượng</a>
                                    </li>
                                    <li id="menu-item-1088"
                                        class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1088">
                                        <a href="####">Quy định thanh toán</a>
                                    </li>
                                </ul>
                            </div>
                        </section>
                    </div>
                    <div class="col-12 col-md-3">
                        <section id="nav_menu-5" class="col mt-2 mb-2 widget_nav_menu">
                            <h5 class="footer-title">Chính sách ưu đãi</h5>
                            <div class="menu-chinh-sach-uu-dai-container">
                                <ul id="menu-chinh-sach-uu-dai" class="menu">
                                    <li id="menu-item-30055"
                                        class="menu-item menu-item-type-post_type menu-item-object-page menu-item-30055">
                                        <a href="###">Chính sách chung</a>
                                    </li>
                                    <li id="menu-item-31478"
                                        class="menu-item menu-item-type-post_type menu-item-object-page menu-item-31478">
                                        <a href="###">Chính sách vận chuyển</a>
                                    </li>
                                    <li id="menu-item-30059"
                                        class="menu-item menu-item-type-post_type menu-item-object-page menu-item-30059">
                                        <a href="###">
                                            Chính sách đổi trả
                                            hàng
                                        </a>
                                    </li>
                                    <li id="menu-item-31480"
                                        class="menu-item menu-item-type-post_type menu-item-object-page menu-item-31480">
                                        <a href="###">
                                            Chính sách bảo mật
                                            thông tin
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </section>
                    </div>


                </div>
            </div>
        </section>
        <section class="footer-top pt-3 pb-3">
            <div class="container">
                <div class="row">
                    <section id="black-studio-tinymce-4"
                             class="col mt-2 mb-2 widget_black_studio_tinymce col-12 col-md-7">
                        <div class="textwidget">
                            <p>
                                <strong>SỮA BỘT TỐT - SUABOTTOT.COM</strong><br>
                                TRANG TMĐT CHUYÊN SỮA HÀNG ĐẦU VIỆT NAM<br>
                                Trụ sở: 318 Đường Bưởi, Q.Ba Đình, TP.Hà Nội<br>
                                Chi nhánh: 130 Phố Chùa Quỳnh, Hai Bà Trưng, TP.Hà Nội<br>
                                Website: www.suabottot.com<br>
                                ĐT: (024) 3232 1527 - E: cskh@suabottot.com<br>
                                GPDKKD: 01A8031009, UBND Quận Ba Đình, TP.Hà Nội
                            </p>
                        </div>
                    </section>
                    <section id="black-studio-tinymce-5" class="col mt-2 mb-2 widget_black_studio_tinymce col-md-5">
                        <div class="textwidget">
                            <p>
                                <a href="#######" target="_blank" rel="noopener">
                                    <img class="alignleft wp-image-30060 lazyloaded"
                                         src="https://suabottot.com/wp-content/uploads/2019/10/dathongbaobct.png"
                                         width="209" height="63" data-ll-status="loaded"><noscript>
                                        <img class="alignleft wp-image-30060"
                                             src="https://suabottot.com/wp-content/uploads/2019/10/dathongbaobct.png"
                                             width="209" height="63" />
                                    </noscript>
                                </a><img class="alignleft wp-image-44909 lazyloaded"
                                         src="https://suabottot.com/wp-content/uploads/2020/10/ssl-logo-300x166-1.png"
                                         alt="SSL" width="114" height="63" data-ll-status="loaded"><noscript>
                                    <img class="alignleft wp-image-44909"
                                         src="https://suabottot.com/wp-content/uploads/2020/10/ssl-logo-300x166-1.png"
                                         alt="SSL" width="114" height="63" />
                                </noscript>
                            </p>
                        </div>
                    </section>
                </div>
            </div>
        </section>
        <section class="footer-bottom">
            <div class="container">
                <div class="row">
                </div>
            </div>
        </section>', 1)
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [CreateDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (1, CAST(N'2021-08-23T11:39:19.873' AS DateTime), NULL, N'Phạm Minh Đức ', N'0810240171', N'Hà Nội', N'duc@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (2, CAST(N'2021-08-27T00:47:54.887' AS DateTime), NULL, N'Trinh', N'0124812512', N'Thái Bình', N'trinh@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (3, CAST(N'2021-08-27T00:58:39.317' AS DateTime), NULL, N'Đỗ Đức Mạnh', N'0836919369', N'Thái Bình', N'manhlac2000@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreateDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (4, CAST(N'2021-08-29T02:05:52.313' AS DateTime), NULL, N'Hoài Thu', N'0157012581', N'Hải Dương', N'thu@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (12, 4, 1, CAST(310000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (21, 1, 1, CAST(530000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (21, 2, 2, CAST(530000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (21, 3, 1, CAST(530000 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Descriptions], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [TopHop], [ViewCount]) VALUES (12, N'Men vi sinh ILDong Hàn Quốc 100 gói 100g', N'8801157160560', N'men-vi-sinh-ildong-han-quoc-100', N'Men vi sinh ILDong là sản phẩm được bào chế từ Lactobacillus, Bifidus, Oligosaccharide, các enzyme tiêu hóa và các vitamin, khoáng chất, thành phần có nguồn gốc từ sữa non cần thiết cho sự phát triển giúp bảo vệ sức khỏe đường ruột.', N'\Asset\Client\img\Sanphamkm\men-vi-sinh-ildong-250x250.jpg', NULL, CAST(310000 AS Decimal(18, 0)), CAST(290000 AS Decimal(18, 0)), NULL, NULL, 6, N'Thương hiệu: ILDONG FOODIS KOREA Nhập khẩu nguyên hộp có tem phụ tiếng Việt Men vi sinh ILDong Hàn Quốc 100 gói/100g', NULL, CAST(N'2021-08-21T02:17:27.257' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, NULL, 4)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Descriptions], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [TopHop], [ViewCount]) VALUES (13, N'Sữa Dê Hikid Hàn Quốc 700g (trẻ từ 1-9 tuổi)', N'8801157117809', N'sua-de-hikid-han-quoc-600g', N'Sản xuất tại ILDONG FOODIS – Hàn Quốc Nhập khẩu nguyên hộp từ Hàn Quốc có tem phụ tiếng Việt Sữa dê núi cao cấp thơm ngon dễ uống', N'\Asset\Client\img\Sanphamkm\sua-de-hikid-250x250.jpg', NULL, CAST(660000 AS Decimal(18, 0)), CAST(550000 AS Decimal(18, 0)), NULL, NULL, 4, N'Sữa Dê Hikid Hàn Quốc dinh dưỡng đầy đủ cân đối giúp trẻ tăng trưởng chiều cao & cân nặng hiệu quả. Chắt lọc từ nguồn sữa tươi sạch của đàn dê núi được chăn thả “hoàn toàn tự nhiên” tại đồng cỏ New Zealand và vùng núi cao Hàn Quốc, trải qua dây chuyền sản xuất khép kín, hiện đại bậc nhất hiện nay. Hikid mang trong mình sứ mệnh thay đổi tầm vóc của trẻ em Châu Á, giúp bé phát triển toàn diện về thể chất và trí lực, đặc biệt là chiều cao.  ILdong Foodis đã nghiên cứu và cho ra đời sữa dê núi Hikid, một sản phẩm đậm đặc về dinh dưỡng có khả năng chuyển hóa tối đa vào cơ thể, giúp trẻ tăng trưởng chiều cao, cân nặng, hoàn thiện hệ miễn dịch, mà vẫn cân bằng với hệ tiêu hóa còn non nớt của trẻ trong những năm đầu đời.  Sữa dê Hikid được đặc chế với hàm lượng canxi cao vượt trội, lên tới 183mg Canxi trong 100g sữa, cùng với Vitamin D, Kẽm, Magie và hàm lượng cao vitamin K2, Hikid bổ sung và tăng khả năng hấp thu canxi, giúp bé phát triển chiều cao tối đa.', NULL, CAST(N'2021-08-21T02:19:21.530' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, NULL, 3)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Descriptions], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [TopHop], [ViewCount]) VALUES (21, N'Sữa HIKID Socola 650g Chính Hãng', N'8801157117144', N'sua-hikid-han-quoc-vi-socola-600g', N'Sản xuất tại ILDONG FOODIS – Hàn Quốc Nhập khẩu nguyên hộp từ Hàn Quốc có tem phụ tiếng Việt Hương Sô Cô La thơm ngon dễ uống', N'\Asset\Client\img\Sanphamkm\sua-hikid-socola-250x250.jpg', NULL, CAST(530000 AS Decimal(18, 0)), NULL, NULL, NULL, 4, N'Sữa Hikid Socola bổ sung các loại Vitamin, khoáng chất, kháng thể sữa non giúp cho sự phát triển nhanh và vững chắc cho trẻ. Khi nói đến các loại sữa công thức giúp trẻ tăng trưởng chiều cao thì không thể thiếu dòng sản phẩm HIKID của Hàn Quốc. Và sự thật thì hầu hết các mẹ đã cho con dùng sang sữa Hikid sẽ trung thành với sản phẩm và tự tin cho con dùng trong suốt thời kỳ trưởng thành của trẻ. Trong đó sữa Hikid Socola với hương vị thơm ngon tự nhiên giàu dinh dưỡng được rất nhiều trẻ yêu thích.  Sữa Hikid Socola cung cấp có chọn lọc những dưỡng chất cần thiết cho sự phát triển trên nền tảng nguyên liệu đa dạng được lựa chọn kỹ càng từ ngũ cốc, quả, rau đến dinh dưỡng của sữa bò. Sản phẩm được tăng cường thêm nhiều thành phần tính năng và sữa bột cân bằng giúp cho sự phát triển nhanh và vững chắc cho trẻ.  Sữa Hikid Socola sử dụng nguồn nguyên liệu tự nhiên có giá trị dinh dưỡng cao, gồm có: Protein cao cấp từ đất nước NewZeland với sản lượng sữa lớn nhất thế giới và Protein isolate từ đậu lành dễ tiêu hóa và hấp thu. Các axit béo Linolenic acid, Alpha-Linolenic Acid chiết suất từ dầu đậu lành, dầu ngô, dầu dừa… Các vitamin và khoáng chất với tỷ lệ cân bằng theo quy cách dinh dưỡng Codex tự nhiên trong rau quả.', NULL, CAST(N'2021-08-21T02:22:07.540' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, NULL, 2)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Descriptions], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [TopHop], [ViewCount]) VALUES (22, N'Sữa Hikid Hàn Quốc tăng Chiều cao, Cân nặng Vani 600g (1 tuổi trở lên)', N'8801157117984', N'sua-hikid-han-quoc-tang-chieu-cao-tang-can-vani-600g-1-10-tuoi', N'Sản xuất tại ILDONG FOODIS – Hàn Quốc Nhập khẩu nguyên hộp từ Hàn Quốc có tem phụ tiếng Việt Hương Vani thơm ngon dễ uống', N'\Asset\Client\img\Sanphamkm\sua-hikid-vani-250x250.jpg', NULL, CAST(530000 AS Decimal(18, 0)), CAST(430000 AS Decimal(18, 0)), NULL, NULL, 4, N'Tại sao sữa Hikid lại giúp trẻ phát triển chiều cao vượt trội? Là một người hâm mộ Bác sĩ Anh Nguyễn (Người Việt sống tại Vương Quốc Anh), mình thường xuyên theo dõi những bài chia sẻ rất hữu ích trên facbook của bác sĩ. Mình thấy cũng có rất nhiều mẹ Việt đang theo dõi để học hỏi theo những chia sẻ về chăm sóc con từ những nghiên cứu khoa học mới nhất. Gần đây mình có đọc bài viết của bác sĩ về chủ đề “DINH DƯỠNG ĐÚNG ĐỂ TRẺ TĂNG CHIỀU CAO” rất hay  Mình xin trích dẫn một đoạn quan trọng nhất liên quan đến sản phẩm sữa Hàn Quốc bạn đang muốn tham khảo cho con như sau:  “Canxi là thành phần chính cấu tạo khung xương. Nên tận dụng nguồn canxi tự nhiên hơn là từ thuốc hay thực phẩm bổ sung vì đó là nguồn hấp thụ tốt nhất và an toàn nhất.  Tuy nhiên, cha mẹ cần lưu ý sự hấp thụ canxi luôn cần sự hỗ trợ đầy đủ của vitamin D3 và K2. Nếu không có vitamin D3 thì Canxi sẽ không thể hấp thu từ ruột vào máu, không có vitamin K2 thì canxi từ máu không thể gắn hiệu quả vào xương.  Vitamin D3 kích thích nguyên bào xương sản xuất Osteocalcin – một protein có chức năng gắn canxi vào xương. Nhưng Osteocalcin này nếu thiếu vitamin K2 sẽ không thể hoạt động được. Vì thế, việc phối hợp D3 và K2 sẽ giúp canxi được hấp thu và sử dụng hiệu quả tại xương, từ đó giúp trẻ có hệ xương chắc khỏe và tăng chiều cao tốt hơn.  Ngoài chế độ ăn uống đa dạng và cân bằng, cha mẹ hãy tạo cho con môi trường ăn uống lành mạnh và vui vẻ, tránh ép trẻ quá mức, hạn chế thức ăn nhanh, đồ ăn chiên rán quá nhiều dầu mỡ, bánh kẹo ngọt, nước ngọt có ga… bởi chúng sẽ gây ra tình trạng béo phì, một sức ép đối với tăng trưởng chiều cao.”', NULL, CAST(N'2021-08-21T02:23:58.240' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Descriptions], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [TopHop], [ViewCount]) VALUES (35, N'Sữa Non ILDONG số 1 Hàn Quốc 100 thanh/100g (trẻ 0-12 tháng)', N'8801157131119', N'sua-non-ildong-so-1-han-quoc-tre-tu-0-12-thang', N'Thương hiệu: ILDONG FOODIS Korea Nhập khẩu nguyên hộp có tem phụ tiếng Việt 100% sữa bò non cao cấp giàu IgG – IGF – DHA', N'/Asset/Admin/img/sua-non-ildong-1-moi.jpg', NULL, CAST(310000 AS Decimal(18, 0)), CAST(290000 AS Decimal(18, 0)), NULL, NULL, 6, N'Sữa Non ILDONG số 1 giúp tăng cường sức đề kháng tự nhiên cho bé từ 0-12 tháng tuổi được các mẹ đánh giá tốt nhất hiện nay. Nếu mẹ để ý đến các sản phẩm dinh dưỡng cho trẻ trong thời gian gần đây thì có xu hướng thiên về tăng cường sức đề kháng. Bằng chứng là các sản phẩm cải tiến hiện nay đề trú trọng bổ sung hàm lượng sữa non Colostrum  cao. Còn đối với các bé sức đề kháng quá yếu thì mẹ sẽ lựa chọn cách tăng cường sức đề kháng từ sữa non cô đặc 100% như ILDONG Hàn Quốc.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Descriptions], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [TopHop], [ViewCount]) VALUES (37, N'Sữa Famna số 1 400G (0-6 tháng)', N'7350107130463', N'sua-famna-so-1-400g-nutifood', N'Thương hiệu Nutifood Sản xuất 100% tại Thụy Điển Đề kháng khỏe, tiêu hóa tốt, bé cao lớn thông minh Dành cho bé từ 0-6 tháng tuổi', N'/Asset/Admin/img/sua-famna-so-1-400g.jpg', NULL, CAST(260000 AS Decimal(18, 0)), CAST(200000 AS Decimal(18, 0)), NULL, NULL, 3, N'Sữa Famna số 1 là nguồn dinh dưỡng cao cấp giúp bé tiêu hóa khỏe, tăng đề kháng, tăng cân, tăng chiều cao và phát triển não bộ toàn diện. Trẻ sơ sinh và trẻ nhỏ luôn luôn là những đối tượng cần được chăm sóc đăc biệt bằng nguồn dinh dưỡng cao cấp, tiêu chuẩn an toàn phù hợp với cơ địa. Bởi vì, lúc này hệ thống miễn dịch của bé chưa hoàn thiện, hệ tiêu hóa khá nhạy cảm và non yếu nên bé rất dễ bị tấn công bởi các tác nhận xấu bên ngoài.  Hiểu được điều này các chuyên gia dinh dưỡng hàng đầu của Nutifood phối hợp cùng với các chuyên gia Châu Âu đã nghiên cứu và cho ra đời sản phẩm sữa Famna giúp bé tăng đề kháng, tiêu hóa khỏe và tăng trưởng phát triển toàn diện. Sản phẩm có nguồn nguyên liệu thuần khiết từ Châu Âu và sản xuất trên tiêu chuẩn công nghệ hiện đại 100% từ Thụy Điển đem đến cho trẻ em Việt Nam nguồn dinh dưỡng hoàn hảo.  Hơn thế nữa, Famna còn sở hữu công nghệ độc quyền FDI trọng tâm vào “Đề kháng khỏe – tiêu hóa tốt” được nghiên cứu bởi các chuyên gia hàng đầu Châu Âu tại Viện nghiên cứu dinh dưỡng Nutifood Thụy Điển (NNRIS). Đây là một trong những thành tựu khoa học đột phá trong ngành dinh dưỡng cho trẻ em hiện nay.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Descriptions], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [TopHop], [ViewCount]) VALUES (38, N'Sữa Nutren Junior Nestle Thụy Sĩ 800g (trẻ từ 1-10 tuổi)', N'7613034161017', N'sua-nutren-junior-nestle-thuy-si-800g-tre-tu-1-10-tuoi', N'Thương hiệu: Nestlé Thụy Sĩ Sản xuất và nhâp khẩu tại Thụy Sĩ Dinh dưỡng cao năng lượng giúp trẻ tăng trưởng tốt', N'/Asset/Admin/img/sua-nutren-junior-4.jpg', NULL, CAST(555000 AS Decimal(18, 0)), CAST(499000 AS Decimal(18, 0)), NULL, NULL, 3, N'Sữa Nutren Junior thương hiệu nổi tiếng của Nestle được nhập khẩu nguyên lon từ Thụy Sĩ chuyên biệt dành cho trẻ suy dinh dưỡng. Nutren Junior được biết đến như là sản phẩm y học cao năng lượng hỗ trợ tăng cân, kích thích ăn ngon miệng và tốt cho hệ tiêu hóa của trẻ. Sản phẩm được thiết kế phù hợp với nhiều đối tượng trẻ nhỏ như trẻ thấp còi, trẻ biếng ăn, trẻ đang trong giai đoạn phát triển vận động thể thao nhiều…  Ưu điểm vượt trội của sữa Nutren Junior là công thức với sự kết hợp của Synbiotics cùng các dưỡng chất, vitamin thiết yếu hàng ngày giúp tăng cường hệ miễn dịch, giúp trẻ tăng cân, phát triển não bộ, thể chất của bé.  Công thức cải tiến mới với nhiều ưu điêm vượt trội:  – 50% đạm Whey (đạm quý) và 50% đạm Casein đảm bảo cho sự phát triển và chuyển hóa của trẻ. (3g đạm / 100kcal)  – DHA hỗ trợ sự phát triển của não bộ và mắt cho trẻ (11mg DHA/250ml sau khi pha)  – Synbiotics là sự kết hợp Probiotics (chủng Bifidobacterium Longum và Lactobacillus Paracasei) và Prebiotic giúp tăng cường sức đề kháng, khả năng miễn dịch tự nhiên của trẻ bằng cách bổ sung vi sinh vật có lợi để ức chế sự phát triên của vi sinh vật có hại trong đường tiêu hóa, giúp hệ tiêu hóa của trẻ khỏe mạnh hơn, hấp thu chất tốt hơn.  – 18,5% chất béo là chất béo chuỗi trung bình (MCT) giúp trẻ dễ tiêu hóa và hấp thu.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Descriptions], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [TopHop], [ViewCount]) VALUES (39, N'Sữa OGGI Tăng Cân Cho Người Gầy 900G', N'8936170700186', N'sua-oggi-tang-can-cho-nguoi-gay', N'Thương hiệu: Vitadairy Dinh dưỡng đặc chế giúp người gầy tăng cân khỏe mạnh Hộp khối lượng tịnh: Sữa bột lon 900g', N'/Asset/Admin/img/sua-oggi-tang-can.jpg', NULL, CAST(315000 AS Decimal(18, 0)), NULL, NULL, NULL, 18, N'Sữa Oggi công thức giàu dinh dưỡng giúp người gầy tăng cân, tăng sức đề kháng khỏe mạnh một cách tự nhiên. Nguyên nhân chính dẫn đến một cơ thể gầy còm ốm yếu là do chế độ dinh dưỡng hàng ngày của chúng ta không đảm bảo đủ về cả chất và lượng. Các tế bào trong cơ thể không được nuôi dưỡng, bị bỏ đói dẫn đến suy yếu và mất khả năng tái tạo. Tình trạng này diễn biến quá lâu sẽ gây ra cơ thể suy nhược, sức đề kháng kém dễ bị nhiễm bệnh và gây ảnh hưởng rất lớn đến công việc cũng như sinh hoạt hàng ngày.  Theo các chuyên gia dinh dưỡng thì “nguyên tắc vàng” giúp cơ thể tăng cân là phải đảm bảo tổng năng lượng cung cấp cho cơ thể lớn hơn năng lượng tiêu thụ. Năng lượng dư thừa sẽ giúp sản sinh, tái tạo tế bào mô cơ, dự trữ mỡ mới có thể tăng cân được. Nhưng với những người đã gầy thì việc ăn uống một lượng nhiều hàng ngày lại không hề đơn giản, nên giải pháp lúc này là dùng sữa cao năng lượng, giàu dưỡng chất Oggi.  Sữa Oggi là một sản phẩm dinh dưỡng cao năng lượng giúp bù đắp năng lượng thiếu hụt hàng ngày, tăng sức đề kháng, giúp ăn ngủ ngon tiêu hóa tốt từ đó giúp tăng cân hiệu quả. Sản phẩm đã được rất nhiều người gầy sử dụng hàng ngày đem lại hiệu quả tăng cân rất tốt!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Descriptions], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [TopHop], [ViewCount]) VALUES (40, N'Sữa non Coloscare IgG 24h (42Gói/84G)', N'8936142671797', N'sua-non-coloscare-igg-24h', N'Thương hiệu NUTRICARE Nguyên liệu nhập khẩu từ New Zealand, Châu Âu Trọng lượng 84G/42 Gói, dành cho trẻ từ 0 tháng trở lên', N'/Asset/Admin/img/sua-non-coloscare-igg.jpg', NULL, CAST(305000 AS Decimal(18, 0)), NULL, NULL, NULL, 6, N'Sữa non ColosCare IgG 24h là dòng sản phẩm bổ sung kháng thể cao cấp từ nguồn sữa non ColosIgG 24h nhập khẩu 100% từ Mỹ. Sữa non là một loại sữa đặc biệt có giá trị dinh dưỡng rất cao, được tiết ra trong vòng 72 giờ đầu sau khi sinh. Tác dụng chính của sữa non là nâng cao sức đề kháng nên cũng được ví như liều vacxin đầu tiên của bé. Ngoài ra trong sữa non chứa nhiều vitamin và khoáng chất giúp bé tăng trưởng và phát triển khỏe mạnh. Tuy nhiên không phải sữa non nào cũng là tốt nhất mà theo các nghiên cứu thì sữa non đạt chất lượng tối ưu trong 24 giờ đầu và giảm dần theo thời gian.  Sữa non Coloscare IgG24h với nguồn sữa non chất lượng nhập khẩu từ Mỹ là sản phẩm đem lại chất lượng tuyệt vời giúp tăng cường hệ miễn dịch phòng chống các bệnh do vi khuẩn, virus gây ra từ đó giúp trẻ khỏe mạnh, ăn ngon, ngủ đủ và phát triển khỏe mạnh.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Descriptions], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [TopHop], [ViewCount]) VALUES (41, N'Sữa Kid Essentials Úc Chính Hãng Nestlé 800G (1-10 tuổi)', N'7613036109314', N'sua-kid-essentials-uc-chinh-hang-nestle-800g', N'Thương hiệu: Nestlé HealthScience Sản xuất tại: Nestle Thụy Sĩ Nhâp khẩu chính hãng tại Australia Dinh dưỡng cao năng lượng giúp trẻ tăng trưởng tốt', N'/Asset/Admin/img/sua-kid-essentials-4.jpg', NULL, CAST(540000 AS Decimal(18, 0)), NULL, NULL, NULL, 3, N'Sữa Kid Essentials – Dinh dưỡng cao năng lượng chuyên biệt cho trẻ từ 1-10 tuổi bị biếng ăn, nhẹ cân, trẻ mới ốm dậy cần phục hồi sức khỏe. Nếu mẹ đang muốn tìm hiểu và lựa chọn cho con yêu một dòng sữa tăng cân thực sự hiệu quả chứ không phải chỉ là những lời quảng cáo như các nhà sản xuất đã đưa ra, vậy thì mẹ đừng nên bỏ qua dòng sữa cao năng lượng Kid Essentials Úc vì đây chính là sự lựa chọn hoàn hảo nhất mà mẹ đang cần tìm.  Phải nói rằng, hiếm thấy dòng sữa tăng cân nào mà được các mẹ bỉm sữa review và khen ngợi trên các nhóm hội, các diễn đàn, facebook nhiều đến vậy như Kid Essentials. Có đến 98% những mẹ đã cho con dùng qua sữa đều đánh giá sữa có hương vị rất thơm và dễ uống chứ không bị ngọt quá như các sữa khác, con trộm vía tăng cân trông thấy và không còn tình trạng biếng ăn nữa.  Là dòng sữa cao năng lượng với công thức độc quyền từ Nestlé Úc, hàm lượng dinh dưỡng được thiết kế một cách khoa học, cân đối cho nên chỉ cần bổ sung một lượng nhỏ. Sữa Kid Essentials cũng có thể cung cấp được đầy đủ dinh dưỡng, lượng calo cần thiết giúp con tăng cân khỏe mạnh mỗi ngày. Tuy nhiên, để tin khách quan nhất mẹ hãy tham khảo những chia sẻ và đánh giá dưới đây về sữa Kid Essentials cũng như hỏi các mẹ bỉm sữa trên các hội nhóm để có được lựa chọn phù hợp nhất cho con yêu nhé!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Descriptions], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [TopHop], [ViewCount]) VALUES (42, N'Sữa Care 100 Gold 900g (cho trẻ từ 1 – 10 tuổi)', N'8938505463766', N'sua-care-100-gold-900g-cho-tre-tu-1-10-tuoi', N'Thương hiệu NUTRICARE Nguyên liệu chọn lọc từ Mỹ, New Zealand, Châu Âu Dành cho trẻ biếng ăn từ 1 – 10 tuổi', N'/Asset/Admin/img/sua-care-100-gold-grow.jpg', NULL, CAST(325000 AS Decimal(18, 0)), NULL, NULL, NULL, 6, N'Sữa Care 100 Gold công thức cải tiến mới hỗ trợ tiêu hóa, kích thích ngon miệng giúp trẻ tăng trưởng Cân nặng & Chiều cao vượt trội. Bé biếng ăn nếu không được chăm sóc kịp thời sẽ dẫn đến thiếu hụt năng lượng, dinh dưỡng. Bé sẽ rơi vào vòng “luẩn quẩn”: Biếng ăn => Sụt cân, suy dinh dưỡng => Suy giảm sức đề kháng do thiếu vi chất => Ốm bệnh.  Để khắc phục dứt điểm, mẹ hãy áp dụng giải pháp đồng bộ, vừa khắc phục biếng ăn, hấp thu kém, vừa phục hồi dinh dưỡng, năng lượng đồng thời phải giúp bé tăng sức đề kháng.  Sữa Care 100 Gold là dòng sản phẩm được thiết kế chuyên biệt dành cho trẻ biếng ăn, suy dinh dưỡng thấp còi từ 1 đến 10 tuổi. Sữa giúp bổ sung thêm năng lượng, chất đạm, các vitamin và khoáng chất cần thiết vào khẩu phần ăn giúp trẻ tăng trưởng và phát triển chiều cao, cân nặng, trí não tối đa.  Sữa Care 100 Gold có nguyên liệu được nhập khẩu từ New Zealand, công thức được nghiên cứu bởi các chuyên gia dinh dưỡng hàng đầu Việt Nam. Sản phẩm được sản xuất bởi công ty Nutricare, được chứng nhận bởi bộ y tế phù hợp với trẻ từ 1 đến 10 tuổi.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Descriptions], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [TopHop], [ViewCount]) VALUES (43, N'Sữa BLACKMORES Số 1 Newborn 900G Úc (trẻ từ 0-6 tháng)', N'9300807299517', N'sua-blackmores-so-1-newborn-900g-uc-tre-tu-0-6-thang', N'Thương hiệu: BLACKMORES Nguyên liệu nhập khẩu từ Australia Dinh dưỡng cao năng lượng cho trẻ từ 0-6 tháng', N'/Asset/Admin/img/sua-blackmores-so-1.jpg', NULL, CAST(550000 AS Decimal(18, 0)), NULL, NULL, NULL, 3, N'Sữa Blackmores số 1 dinh dưỡng cao năng lượng nhập khẩu nguyên lon từ Australia giúp trẻ tăng trưởng cân nặng, chiều cao tối đa. Theo đánh giá khách quan của các mẹ đã cho con sử dụng thì sữa Blackmores có mùi vị rất thơm, bé rất thích. Sử dụng sữa một thời gian thấy trẻ ăn ngon miệng, không bị táo, ngủ ngon, tiêu hóa tốt nên tăng cân, phát triển chiều cao rõ rệt.  Đây cũng chính là lý do vì sao mà sữa Blackmores đang được rất nhiều mẹ tìm mua mặc dù sản phẩm mới chỉ nổi được một thời gian. Trên các diễn đàn, facebook, hội các mẹ được chia sẻ rất nhiều về sản phẩm này và cũng nhận được sự khen ngợi rất nhiều.  Nếu mẹ có bé chậm phát triển, lười bú sữa, táo bón,… mặc dù đã đổi nhiều loại sữa mà không hợp thì Blackmores là một lựa chọn tốt cho mẹ. Nhưng trước khi quyết định lựa chọn sữa này thì mẹ hãy lên trên các diễn đàn, hội tham khảo từ các mẹ đã cho con sử dụng để yên tâm hơn. Blackmores sẽ không làm mẹ thất vọng đâu!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Descriptions], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [TopHop], [ViewCount]) VALUES (44, N'Sữa BLACKMORES số 2 Folow-on Úc (6-12 tháng)', N'9300807299524', N'sua-blackmores-so-2-folow-on-uc-6-12-thang', N'Thương hiệu: BLACKMORES Nguyên liệu nhập khẩu từ Australia Dinh dưỡng cao năng lượng cho trẻ từ 6-12 tháng', N'/Asset/Admin/img/sua-blackmores-so-2.jpg', NULL, CAST(550000 AS Decimal(18, 0)), NULL, NULL, NULL, 3, N'Sữa Blackmores số 2 nhập khẩu nguyên hộp từ Úc giàu năng lượng, vitamin và khoáng chất giúp trẻ tăng trưởng, phát triển khỏe mạnh. “Em cần nhấn mạnh là sữa Blackmores rất thơm, dễ pha, dễ uống, giàu Canxi, giúp bé phát triển chiều cao và cân nặng một cách tối ưu nhất, ngoài ra với prebiotics còn giúp bé ăn ngon miệng, không bị táo bón, ngủ ngon, hệ đường ruột khỏe mạnh và Tăng sức đề kháng cho bé.”  Nếu mẹ nào đang cho con uống sữa công thức mà thấy không hợp thì hãy thử dòng sữa này nhé, đây được coi là dòng sữa dành riêng cho các bé không chịu uống sữa công thức, đổi đủ loại sữa mà vẫn ko chịu uống.  Sản phẩm dinh dưỡng công thức Blackmores được mẹ Việt biết đến nhiều chủ yếu là từ các mẹ đã cho con dùng Blackmores xách tay có hiệu quả nên đã chia sẻ qua facebook, các hội nhóm. Tiếng lành đồn xa, dần dần nhiều mẹ khác biết được và cho con dùng thử, từ đó trung thành với sản phẩm luôn.  BLACKMORES là thương hiệu uy tín hàng dầu về sức khỏe tự nhiên hàng đầu của Úc về dinh dưỡng, vitamin, khoáng chất bổ sung. Hơn 80 năm nghiên cứu khoa học về sức khỏe và dinh dưỡng đã phát triển ra dòng sản phẩm sữa Blackmores cho trẻ em có giá trị sinh học cao được các mẹ Úc dùng rất phổ biến.  Sản phẩm dinh dưỡng công thức Blackmores Follow-on số 2 được thiết kế dành riêng cho trẻ từ 6-12 tháng tuổi trở lên, giúp bổ sung dinh dưỡng thay thế cho bữa ăn phụ hàng ngày.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Descriptions], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [TopHop], [ViewCount]) VALUES (45, N'Sữa BLACKMORES số 3 Toddler Úc 900G (1 tuổi trở lên)', N'9300807299531', N'sua-blackmores-so-3-toddler-uc-900g-1-tuoi-tro-len', N'Thương hiệu: BLACKMORES Nguyên liệu nhập khẩu từ Australia Dinh dưỡng cao năng lượng cho trẻ từ 1 tuổi', N'/Asset/Admin/img/sua-blackmores-so-3.jpg', NULL, CAST(535000 AS Decimal(18, 0)), NULL, NULL, NULL, 3, N'Sữa Blackmores số 3 công thức đột phá INFAT được chứng minh lâm sàng giúp thúc đẩy sự hấp thu chất béo và canxi hiệu quả giúp trẻ tăng trưởng cân nặng và chiều cao. Sản phẩm dinh dưỡng công thức Blackmores được mẹ Việt biết đến nhiều chủ yếu là từ các mẹ đã cho con dùng Blackmores xách tay có hiệu quả nên đã chia sẻ qua facebook, các hội nhóm. Tiếng lành đồn xa, dần dần nhiều mẹ khác biết được và cho con dùng thử, từ đó trung thành với sản phẩm luôn.  Sữa Blackmores được các mẹ đánh giá chung là thơm ngon dễ uống, không bị táo bón, giúp trẻ ngủ sâu giấc, dùng một thời gian sẽ thấy con phát triển chiều cao cân nặng đều đặn, ít ốm vặt và ăn ngon miệng hơn. Ngoài ra sữa rất dễ pha, dễ uống, không lo con bị ọc sữa hay trào ngược rất phù hợp với trẻ kén sữa, lười uống sữa.  Với nhu cầu sử dụng sữa Blackmores tăng lên rất nhanh mà sữa xách tay không đáp ứng đủ. Chính vì vậy mà sản phẩm đã được nhập khẩu chính hãng nhằm đáp ứng kịp thời sữa cho các con dùng không còn bị ngắt quãng nữa. Nếu mẹ đang tìm hiểu sữa Blackmores cho con thì hãy xem những ưu điểm vượt trội dưới đây sẽ hiểu tại sao nhiều mẹ tin dùng nhé.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Descriptions], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [TopHop], [ViewCount]) VALUES (46, N'Sữa OGGI Tăng Cân Cho Người Gầy 900G', N'8936170700186', N'sua-oggi-tang-can-cho-nguoi-gay', N'Thương hiệu: Vitadairy Dinh dưỡng đặc chế giúp người gầy tăng cân khỏe mạnh Hộp khối lượng tịnh: Sữa bột lon 900g', N'/Asset/Admin/img/sua-oggi-tang-can.jpg', NULL, CAST(315000 AS Decimal(18, 0)), NULL, NULL, NULL, 18, N'Sữa Oggi công thức giàu dinh dưỡng giúp người gầy tăng cân, tăng sức đề kháng khỏe mạnh một cách tự nhiên. Nguyên nhân chính dẫn đến một cơ thể gầy còm ốm yếu là do chế độ dinh dưỡng hàng ngày của chúng ta không đảm bảo đủ về cả chất và lượng. Các tế bào trong cơ thể không được nuôi dưỡng, bị bỏ đói dẫn đến suy yếu và mất khả năng tái tạo. Tình trạng này diễn biến quá lâu sẽ gây ra cơ thể suy nhược, sức đề kháng kém dễ bị nhiễm bệnh và gây ảnh hưởng rất lớn đến công việc cũng như sinh hoạt hàng ngày.  Theo các chuyên gia dinh dưỡng thì “nguyên tắc vàng” giúp cơ thể tăng cân là phải đảm bảo tổng năng lượng cung cấp cho cơ thể lớn hơn năng lượng tiêu thụ. Năng lượng dư thừa sẽ giúp sản sinh, tái tạo tế bào mô cơ, dự trữ mỡ mới có thể tăng cân được. Nhưng với những người đã gầy thì việc ăn uống một lượng nhiều hàng ngày lại không hề đơn giản, nên giải pháp lúc này là dùng sữa cao năng lượng, giàu dưỡng chất Oggi.  Sữa Oggi là một sản phẩm dinh dưỡng cao năng lượng giúp bù đắp năng lượng thiếu hụt hàng ngày, tăng sức đề kháng, giúp ăn ngủ ngon tiêu hóa tốt từ đó giúp tăng cân hiệu quả. Sản phẩm đã được rất nhiều người gầy sử dụng hàng ngày đem lại hiệu quả tăng cân rất tốt!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Descriptions], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [TopHop], [ViewCount]) VALUES (47, N'Sữa Appeton Weight Gain Adults vị sô cô la 900g (sữa cho người gầy)', N'9556586601014', N'sua-appeton-weight-gain-adults-vi-so-co-la-900g-sua-cho-nguoi-gay', N'Thương hiệu APPETON NUTRITION Nhập khẩu nguyên lon từ Pháp Giúp tăng cân, tăng cơ cho người gầy', N'/Asset/Admin/img/sua-appeton-weight-gain.jpg', NULL, CAST(795000 AS Decimal(18, 0)), NULL, NULL, NULL, 18, N'Sữa Appeton Weight Gain dinh dưỡng chuyên biệt dành cho người gầy, giúp tăng cân khỏe mạnh và hoàn toàn tự nhiên Chế độ dinh dưỡng không đầy đủ, hệ tiêu hóa hấp thu kém dẫn đến tình trạng người lớn bị thiếu cân, gầy, sức đề kháng kém. Sữa bột dành cho người gầy Appeton Weight Gain Adults với công thức đặc biệt giàu protein và L-ProteMAX một hợp chất dinh dưỡng dễ tiêu hóa, giúp người gầy hấp thu chất dinh dưỡng một cách tốt nhất. Ngoài ra, Appeton Weight Gain giàu Canxi, các loại Vitamin tổng hợp và khoáng chất, giúp cho hệ xương và răng chắc khỏe.  Lợi ích của sản phẩm sữa Appeton Weight Gain “Quy tắc vàng” trong lộ trình tăng cân của người gầy là lượng Calo nạp vào cơ thể phải cao hơn lượng Calo cơ thể tiêu thụ trong ngày. Chính lượng Calo dư thừa này sẽ được tái tạo thành các mô cơ giúp cơ thể tăng trưởng cân nặng và không tích nước. Tuy nhiên để nạp vào cơ thể một khối lượng dinh dưỡng để đáp ứng lượng Calories lớn từ các bữa ăn hàng ngày thì rất khó và phải tốn nhiều thời gian và chi phí. Thay vì vậy có thể dùng sữa Appeton Weight Gain giúp cung cấp 400kcal/ngày. Lượng Calo rất cao nó đưa thẳng vào và cung cấp năng lượng cho cơ thể của mình.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Descriptions], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [TopHop], [ViewCount]) VALUES (48, N'Sữa Appeton Weight Gain Adults vị sô cô la 450g (sữa cho người gầy)', N'9556586601076', N'sua-appeton-weight-gain-adults-vi-so-co-la-450g-sua-cho-nguoi-gay', N'Thương hiệu APPETON NUTRITION Nhập khẩu nguyên lon từ Pháp Giúp tăng cân, tăng cơ cho người gầy', N'/Asset/Admin/img/sua-appeton-weight-gain-phap.jpg', NULL, CAST(425000 AS Decimal(18, 0)), NULL, NULL, NULL, 18, N'Sữa Appeton Weight Gain cho người lớn nhập khẩu nguyên lon từ Pháp giúp người trưởng thành tăng cân hiệu quả và khỏe mạnh. Sữa Appton Weight Gain Adult là thức uống dinh dưỡng dành cho người gầy từ 12 tuổi trở lên, giúp tăng cân một cách tự nhiên khỏe mạnh. Sản phẩm được đặc chế theo một công thức khoa học giàu Proteiin với chất lượng hội đủ 3 yếu tố then chốt giúp tăng cân hiệu quả. Tỷ lệ Protein hiệu quả (PER) cao đến 3.1, tính đặc hiệu và giá trị sinh học cao.  Ngoài ra, Appeton Weight Gain kết hợp các dưỡng chất dễ tiêu hóa với L-Protemax (L-Lysine, L- Arginine, Acid Glutamic) cần thiết cho mô phát triển một cách hữu hiệu. Công thức này giúp thanh thiếu niên đang phát triển, người trưởng thành, vận động viên và người luyện tập thể hình được tăng cân một cách từ từ tự nhiên.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Descriptions], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [TopHop], [ViewCount]) VALUES (49, N'Sữa Fresubin Powder Fibre 500g cho người suy dinh dưỡng', N'4051895013664', N'sua-fresubin-powder-fibre-500g-cho-nguoi-suy-dinh-duong', N'Thương hiệu Fresenius Kabi – Đức Cho người suy dinh dưỡng, suy nhược cơ thể Hương vị vanilla thơm ngon dễ uống', N'/Asset/Admin/img/sua-fresubin-powder-fibre-500g-3.jpg', NULL, CAST(460000 AS Decimal(18, 0)), NULL, NULL, NULL, 18, N'Sữa Fresubin Powder Fibre Vanilla sản phẩm dinh dưỡng y học để bổ sung hoặc thay thế dinh dưỡng cho những người bị hoặc có nguy cơ bị suy dinh dưỡng, bệnh nhân từ 3 tuổi trở lên. Sữa Fresubin Powder Fibre dạng bột được sản xuất theo dây chuyền công nghệ hiện đại bậc nhất thế giới bởi hãng Fresenius Kabi Bidiphar. Sản phẩm chứa thành phần giàu dinh dưỡng giúp bệnh nhân mau hồi phục, có thể sử dụng theo đường uống năng lượng cao, bổ sung chất xơ không lactose và gluten.  – Công thức năng lượng linh động cân bằng và cân đối các thành phần dinh dưỡng dễ sử dụng 1.0 – 1.5 Kcal/ml  – Giàu vitamin, khoáng chất, Chất xơ hòa tan, tăng cường khả năng hấp thu.  – Thành phần đạm chất lượng và chất béo tốt  Công dụng của sữa Fresubin Powder Fibre  Bổ sung hoặc thay thế bữa ăn cho người bệnh khó ăn, khó nuốt, người bệnh cần năng lượng và protein cao.  Sử dụng sữa Fresubin Powder Fibrer đúng cách để bổ sung hệ vi chất cần thiết cho cơ thể giúp nâng cao sức khỏe toàn diện, hỗ trợ tăng cân bền vững. Ngoài ra còn giúp tăng trưởng các mô, cơ, xương, xụn, bảo vệ đường ruột, chống rối loạn tiêu hóa, tăng cường hấp thu  Sản phẩm phù hợp với người trên 3 tuổi.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Descriptions], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [TopHop], [ViewCount]) VALUES (50, N'Sữa Natumil Dành Cho Người Gầy 900g – Natucon Sigapore', N'8936111871661', N'sua-natumil-danh-cho-nguoi-gay-900g', N'Thương hiệu: Natucon Singapore Nguyên liệu nhập khẩu từ New Zealand Dinh dưỡng đặc chế cho người gầy, giúp tăng cân tăng cơ nhanh', N'/Asset/Admin/img/sua-natumil-danh-cho-nguoi-gay.jpg', NULL, CAST(305000 AS Decimal(18, 0)), NULL, NULL, NULL, 18, N'Sữa Natumil dinh dưỡng giàu năng lượng dành cho người gầy giúp tăng cường thể lực, dễ tiêu hóa hấp thu và cải thiện cân nặng nhanh. Sữa Natumil là sản phẩm mới của dành cho người gầy sản xuất bởi công ty Natucon Singapore với nguyên liệu nhập khẩu từ NewZealand. Sản phẩm được sản xuất trên dây truyền hiện đại với công thức dành riêng cho người gầy được các chuyên gia dinh dưỡng hàng đầu nghiên cứu phù hợp với người Việt.  Sữa Natumil dành cho người gầy được thiết kế dựa trên công thức VÀNG tăng cân đó là “Tổng năng lượng cung cấp cho cơ thể phải lớn hơn tổng năng lượng tiêu thụ trong 1 ngày”. Với mỗi một ly sữa Natumil 230ml cung cấp lên đến 235Kcal, cao hơn rất nhiều so với các sản phẩm sữa thông thường khác.  Sản phẩm được thiết kế phù hợp với cho người lớn và trẻ em trên 3 tuổi trong các trường hợp: Người gầy ốm cần tăng cân, Người ốm yếu, biếng ăn, người bị suy nhược trong giai đoạn phuc hồi sức khỏe; Người lao động nặng nhọc hoặc chơi thể thao cần bổ sung năng lượng.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Descriptions], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [TopHop], [ViewCount]) VALUES (51, N'Sữa Fresubin Powder Fibre 500g cho người suy dinh dưỡng', N'4051895013664', N'sua-fresubin-powder-fibre-500g-cho-nguoi-suy-dinh-duong', N'Thương hiệu Fresenius Kabi – Đức Cho người suy dinh dưỡng, suy nhược cơ thể Hương vị vanilla thơm ngon dễ uống', N'/Asset/Admin/img/sua-fresubin-powder-fibre-500g-3.jpg', NULL, CAST(460000 AS Decimal(18, 0)), NULL, NULL, NULL, 18, N'Sữa Fresubin Powder Fibre Vanilla sản phẩm dinh dưỡng y học để bổ sung hoặc thay thế dinh dưỡng cho những người bị hoặc có nguy cơ bị suy dinh dưỡng, bệnh nhân từ 3 tuổi trở lên. Sữa Fresubin Powder Fibre dạng bột được sản xuất theo dây chuyền công nghệ hiện đại bậc nhất thế giới bởi hãng Fresenius Kabi Bidiphar. Sản phẩm chứa thành phần giàu dinh dưỡng giúp bệnh nhân mau hồi phục, có thể sử dụng theo đường uống năng lượng cao, bổ sung chất xơ không lactose và gluten.  – Công thức năng lượng linh động cân bằng và cân đối các thành phần dinh dưỡng dễ sử dụng 1.0 – 1.5 Kcal/ml  – Giàu vitamin, khoáng chất, Chất xơ hòa tan, tăng cường khả năng hấp thu.  – Thành phần đạm chất lượng và chất béo tốt  Công dụng của sữa Fresubin Powder Fibre  Bổ sung hoặc thay thế bữa ăn cho người bệnh khó ăn, khó nuốt, người bệnh cần năng lượng và protein cao.  Sử dụng sữa Fresubin Powder Fibrer đúng cách để bổ sung hệ vi chất cần thiết cho cơ thể giúp nâng cao sức khỏe toàn diện, hỗ trợ tăng cân bền vững. Ngoài ra còn giúp tăng trưởng các mô, cơ, xương, xụn, bảo vệ đường ruột, chống rối loạn tiêu hóa, tăng cường hấp thu  Sản phẩm phù hợp với người trên 3 tuổi.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Descriptions], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [TopHop], [ViewCount]) VALUES (52, N'Sữa GROW PLUS Diamond 900G Tăng Cân Cho Người Gầy', N'Grow Plus Diamond', N'sua-grow-plus-diamond-900g-cho-nguoi-gay-an-uong-kem', N'Thương hiệu: Nutifood Dinh dưỡng đặc chế cho người gầy, ăn uống kém Dành cho người gầy trên 12 tuổi', N'/Asset/Admin/img/sua-grow-plus-diamond-tang-can.jpg', NULL, CAST(445000 AS Decimal(18, 0)), NULL, NULL, NULL, 18, N'Sữa Grow Plus Diamond dinh dưỡng đậm độ năng lượng cao dành cho người gầy, người ăn uống kém phục hồi cân nặng và sức khỏe. Sữa Grow Plus Diamond là sản phẩm mới của Công ty CP Thực phẩm Dinh Dưỡng Nutifood được thiết kế dành riêng cho người gầy người ăn uống kém. Sản phẩm được đặc chế với công thức 365 Plus, đặc biệt bổ sung hàm lượng dinh dưỡng có năng lượng cao 120 kcal/ 100m giúp người gầy tăng cân hiệu quả.  Sữa Grow Plus Diamond có nguồn đạm chất lượng PER = 2.7 dễ hấp thu, giúp bù đắp dinh dưỡng cho người gầy, người ăn uống kém, từ đó cải thiện cân nặng và thể trạng đáng kể.  Ngoài ra, Sữa Grow Plus Diamond giúp bổ sung thêm 27 Vitamin và Khoáng chất cần thiết cho cơ thể như Canxi, Vitamin nhóm B, Sắt, Acid folic… giúp ăn ngủ ngon, ngăn ngừa loãng xương, hỗ trợ tiêu hóa và tăng cường sức đề kháng.  Công dụng chính sữa Grow Plus Diamond mang lại cho người sử dụng  + Giúp cải thiện cân nặng và thể trạng  + Giúp ngăn ngừa loãng xương  + Giúp ăn ngon, ngủ ngon  + Hỗ trợ tiêu hóa, ngăn ngừa táo bón  + Giúp tăng cường sức đề kháng, tốt cho tim mạch', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Descriptions], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [TopHop], [ViewCount]) VALUES (53, N'Sữa Non ILDONG số 2 Hàn Quốc lon 100 thanh/100g (trẻ 1-9 tuổi)', N'8801157131126', N'sua-non-ildong-so-2-han-quoc-100g-1-9-tuoi', N'Thương hiệu: ILDONG FOODIS Korea Nhập khẩu nguyên hộp có tem phụ tiếng Việt 100% sữa bò non cao cấp giàu IgG – IGF – DHA', N'/Asset/Admin/img/sua-non-ildong-2.jpg', NULL, CAST(310000 AS Decimal(18, 0)), NULL, NULL, NULL, 6, N'Sữa non ILDong số 2 dinh dưỡng cao cấp cần thiết cho những em bé còi xương, suy dinh dưỡng, bé mới ốm dậy, không được khỏe và những bé biếng ăn. Sữa Non ILDONG số 2 được sản xuất bởi tập đoàn ILDong tập đoàn sản xuất sữa hàng đầu Hàn Quốc. Sữa non cung cấp cho trẻ nhiều nguồn dưỡng chất quý giá vì nó có chứa các kháng thể giúp bé có hệ miễn dịch khỏe mạnh tuy nhiên sữa non của mẹ chỉ có vài ngày sau khi sinh nên các mẹ có thể bổ sung sữa non cho bé bằng cách cho bé uống thêm sữa.  Sữa non Ildong số 2 được làm từ sữa bò cao cấp ,thành phần và hương vị giống như sữa mẹ có khả năng hỗ trợ miễn dịch và cải thiện sức khỏe cho bé rất tốt,ngoài ra sữa non colostrum plus còn kích thích cho bé ăn ngon miệng hơn. Sản phẩm dùng cho tất cả những em bé từ 1 đến 9 tuổi.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (2, N'DANH MỤC SỮA BỘT', N'danh-muc-sua-bot', NULL, 1, NULL, CAST(N'2021-08-21T01:04:46.247' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (3, N'SỮA TĂNG CÂN CHO BÉ', N'sua-tang-can-cho-be', NULL, 1, NULL, CAST(N'2021-08-21T01:05:22.997' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (4, N'SỮA ĐẶC TRỊ', N'sua-dac-tri', NULL, 1, NULL, CAST(N'2021-08-21T01:05:49.200' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (5, N'SỮA DÊ', N'sua-de', NULL, 1, NULL, CAST(N'2021-08-21T01:06:19.360' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (6, N'SỮA NON', N'sua-non', NULL, 1, NULL, CAST(N'2021-08-21T01:06:40.440' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (7, N'SỮA BẦU', N'sua-bau', NULL, 1, NULL, CAST(N'2021-08-21T01:07:04.163' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (8, N'SỮA TƯƠI NHẬP KHẨU', N'sua-tuoi-nhap-khau', NULL, 1, NULL, CAST(N'2021-08-21T01:07:33.463' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (9, N'SỮA BỘT PHA SẴN', N'sua-bot-pha-san', NULL, 1, NULL, CAST(N'2021-08-21T01:08:04.470' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (10, N'TÃ BỈM TRẺ EM', N'ta-bim-tre-em', NULL, 1, NULL, CAST(N'2021-08-21T01:08:42.693' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (12, N'Sữa Nutifood', N'sua-nutifood', 2, 0, NULL, CAST(N'2021-08-21T18:14:55.887' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (13, N'Sữa Meta Care', N'sua-meta-care', 2, 0, NULL, CAST(N'2021-08-21T18:15:18.973' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (14, N'Sữa Nutren Junior', N'sua-nutren-junior', 2, 0, NULL, CAST(N'2021-08-21T18:16:09.643' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (15, N'Sữa Meiji', N'sua-meiji', 2, 0, NULL, CAST(N'2021-08-21T18:16:34.817' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (16, N'Sữa non Goodhealth', N'sua-non-goodhealth', 2, 0, NULL, CAST(N'2021-08-21T18:16:55.297' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (17, N'Sữa Colosbaby', N'sua-colosbaby', 2, 0, NULL, CAST(N'2021-08-21T18:17:26.420' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (18, N'Sữa Tăng Cân Cho Người Gầy', N'sua-tang-can-cho-nguoi-gay', 4, 0, NULL, CAST(N'2021-08-21T18:17:51.493' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (19, N'Sữa Cho Người Cao Tuổi', N'sua-cho-nguoi-cao-tuoi', 4, 0, NULL, CAST(N'2021-08-21T18:18:33.303' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (20, N'Sữa Cho Người Tiểu Đường', N'sua-cho-nguoi-tieu-duong', 4, 0, NULL, CAST(N'2021-08-21T18:18:55.290' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (21, N'Sữa Cho Người Bệnh Thận', N'sua-cho-nguoi-benh-than', 4, 0, NULL, CAST(N'2021-08-21T18:19:15.397' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (22, N'Sữa Non ILDONG', N'sua-non-ildong', 6, 0, NULL, CAST(N'2021-08-21T18:19:36.673' AS DateTime), N'admin', NULL, NULL, NULL, N'là sản phẩm của tập đoàn dược ILDong Hàn Quốc giàu dinh dưỡng, chứa các nhân tố tăng trưởng IgF, IgG tương tự như sữa mẹ. Sữa non ILDong phù hợp với mọi trẻ nhỏ, trẻ sơ sinh thiếu chất, sức đề kháng kém, hay quấy khóc, biếng ăn chậm lớn.             ', 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [MetaKeyword], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (23, N'Sữa Colosbaby', N'sua-colosbaby', 6, 0, NULL, CAST(N'2021-08-21T18:20:06.677' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELETE_USER', N'Xóa User')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EDIT_USER', N'Sửa User')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'VIEW_USER', N'Xem Danh Sách')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UserName], [PassWord], [GroupID], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [Status]) VALUES (4, N'manhdd', N'123', N'MEMBER', N'Do Duc Manh', N'manhdd@gmail.com', N'manhdd@gmail.com', N'0836919369', NULL, NULL, CAST(N'2021-08-25T15:06:52.660' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [PassWord], [GroupID], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [Status]) VALUES (8, N'manhdd3', N'123456', N'USER', N'Do Duc Manh 2', N'manh@gmail.com', N'manh@gmail.com', N'08125710212', NULL, NULL, CAST(N'2021-08-25T15:07:06.647' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [PassWord], [GroupID], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [Status]) VALUES (9, N'admin', N'1', N'ADMIN', N'Do Duc Manh', N'Thai Binh', N'manhlac2000@gmail.com', NULL, CAST(N'2021-08-25T15:02:34.383' AS DateTime), NULL, CAST(N'2021-08-29T01:42:35.187' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [PassWord], [GroupID], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifileDate], [ModifileBy], [Status]) VALUES (10, N'admin1', N'1', N'MEMBER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'ADMIN', N'Quản Trị')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'MEMBER', N'Người Dùng')
GO
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_ShowOnHome]  DEFAULT ((0)) FOR [ShowOnHome]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_ViewCount]  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_ViewCount]  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_ShowOnHome]  DEFAULT ((0)) FOR [ShowOnHome]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_DisplayOrder]  DEFAULT ((1)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_GroupID]  DEFAULT ('MEMBER') FOR [GroupID]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
USE [master]
GO
ALTER DATABASE [WebSuaBo] SET  READ_WRITE 
GO
