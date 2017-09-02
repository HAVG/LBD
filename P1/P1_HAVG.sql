USE [master]
GO
/****** Object:  Database [P1_HAVG]    Script Date: 02/09/2017 02:20:23 p.m. ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'P1_HAVG')
BEGIN
CREATE DATABASE [P1_HAVG]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'P1_HAVG', FILENAME = N'F:\1667302\P1_HAVG.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'P1_HAVG_log', FILENAME = N'F:\1667302\P1_HAVG_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [P1_HAVG] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [P1_HAVG].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [P1_HAVG] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [P1_HAVG] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [P1_HAVG] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [P1_HAVG] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [P1_HAVG] SET ARITHABORT OFF 
GO
ALTER DATABASE [P1_HAVG] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [P1_HAVG] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [P1_HAVG] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [P1_HAVG] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [P1_HAVG] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [P1_HAVG] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [P1_HAVG] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [P1_HAVG] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [P1_HAVG] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [P1_HAVG] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [P1_HAVG] SET  DISABLE_BROKER 
GO
ALTER DATABASE [P1_HAVG] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [P1_HAVG] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [P1_HAVG] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [P1_HAVG] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [P1_HAVG] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [P1_HAVG] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [P1_HAVG] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [P1_HAVG] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [P1_HAVG] SET  MULTI_USER 
GO
ALTER DATABASE [P1_HAVG] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [P1_HAVG] SET DB_CHAINING OFF 
GO
ALTER DATABASE [P1_HAVG] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [P1_HAVG] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [P1_HAVG] SET  READ_WRITE 
GO
