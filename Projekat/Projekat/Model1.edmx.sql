
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/01/2021 18:23:30
-- Generated from EDMX file: C:\Users\Djole\source\repos\Projekat\Projekat\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [KaficDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Kasas'
CREATE TABLE [dbo].[Kasas] (
    [Idk] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'Racuns'
CREATE TABLE [dbo].[Racuns] (
    [Idr] int IDENTITY(1,1) NOT NULL,
    [Datumr] nvarchar(max)  NOT NULL,
    [Ukupno] nvarchar(max)  NOT NULL,
    [KasaIdk] int  NOT NULL,
    [ZaposleniSifzap] int  NOT NULL
);
GO

-- Creating table 'Zaposlenis'
CREATE TABLE [dbo].[Zaposlenis] (
    [Sifzap] int IDENTITY(1,1) NOT NULL,
    [ImeZap] nvarchar(max)  NOT NULL,
    [PrzZap] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Salas'
CREATE TABLE [dbo].[Salas] (
    [RedBrSale] int IDENTITY(1,1) NOT NULL,
    [Sprat] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Proizvods'
CREATE TABLE [dbo].[Proizvods] (
    [Kodpr] int IDENTITY(1,1) NOT NULL,
    [Nazpr] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Cenovniks'
CREATE TABLE [dbo].[Cenovniks] (
    [Cenap] int IDENTITY(1,1) NOT NULL,
    [ProizvodKodpr] int  NOT NULL
);
GO

-- Creating table 'Stavkas'
CREATE TABLE [dbo].[Stavkas] (
    [Rbst] int IDENTITY(1,1) NOT NULL,
    [Kol] nvarchar(max)  NOT NULL,
    [Iznos] nvarchar(max)  NOT NULL,
    [CenovnikCenap] int  NOT NULL,
    [CenovnikProizvodKodpr] int  NOT NULL,
    [RacunIdr] int  NOT NULL,
    [RacunKasaIdk] int  NOT NULL,
    [RacunZaposleniSifzap] int  NOT NULL
);
GO

-- Creating table 'Gosts'
CREATE TABLE [dbo].[Gosts] (
    [Sifgos] int IDENTITY(1,1) NOT NULL,
    [KonobarSifzap] int  NOT NULL
);
GO

-- Creating table 'Radis'
CREATE TABLE [dbo].[Radis] (
    [KonobarSifzap] int  NOT NULL,
    [SalaRedBrSale] int  NOT NULL,
    [Konobar_Sifzap] int  NOT NULL
);
GO

-- Creating table 'Zaposlenis_Konobar'
CREATE TABLE [dbo].[Zaposlenis_Konobar] (
    [Sifzap] int  NOT NULL
);
GO

-- Creating table 'Zaposlenis_Sanker'
CREATE TABLE [dbo].[Zaposlenis_Sanker] (
    [Sifzap] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Idk] in table 'Kasas'
ALTER TABLE [dbo].[Kasas]
ADD CONSTRAINT [PK_Kasas]
    PRIMARY KEY CLUSTERED ([Idk] ASC);
GO

-- Creating primary key on [Idr], [KasaIdk], [ZaposleniSifzap] in table 'Racuns'
ALTER TABLE [dbo].[Racuns]
ADD CONSTRAINT [PK_Racuns]
    PRIMARY KEY CLUSTERED ([Idr], [KasaIdk], [ZaposleniSifzap] ASC);
GO

-- Creating primary key on [Sifzap] in table 'Zaposlenis'
ALTER TABLE [dbo].[Zaposlenis]
ADD CONSTRAINT [PK_Zaposlenis]
    PRIMARY KEY CLUSTERED ([Sifzap] ASC);
GO

-- Creating primary key on [RedBrSale] in table 'Salas'
ALTER TABLE [dbo].[Salas]
ADD CONSTRAINT [PK_Salas]
    PRIMARY KEY CLUSTERED ([RedBrSale] ASC);
GO

-- Creating primary key on [Kodpr] in table 'Proizvods'
ALTER TABLE [dbo].[Proizvods]
ADD CONSTRAINT [PK_Proizvods]
    PRIMARY KEY CLUSTERED ([Kodpr] ASC);
GO

-- Creating primary key on [Cenap], [ProizvodKodpr] in table 'Cenovniks'
ALTER TABLE [dbo].[Cenovniks]
ADD CONSTRAINT [PK_Cenovniks]
    PRIMARY KEY CLUSTERED ([Cenap], [ProizvodKodpr] ASC);
GO

-- Creating primary key on [Rbst] in table 'Stavkas'
ALTER TABLE [dbo].[Stavkas]
ADD CONSTRAINT [PK_Stavkas]
    PRIMARY KEY CLUSTERED ([Rbst] ASC);
GO

-- Creating primary key on [Sifgos] in table 'Gosts'
ALTER TABLE [dbo].[Gosts]
ADD CONSTRAINT [PK_Gosts]
    PRIMARY KEY CLUSTERED ([Sifgos] ASC);
GO

-- Creating primary key on [KonobarSifzap], [SalaRedBrSale] in table 'Radis'
ALTER TABLE [dbo].[Radis]
ADD CONSTRAINT [PK_Radis]
    PRIMARY KEY CLUSTERED ([KonobarSifzap], [SalaRedBrSale] ASC);
GO

-- Creating primary key on [Sifzap] in table 'Zaposlenis_Konobar'
ALTER TABLE [dbo].[Zaposlenis_Konobar]
ADD CONSTRAINT [PK_Zaposlenis_Konobar]
    PRIMARY KEY CLUSTERED ([Sifzap] ASC);
GO

-- Creating primary key on [Sifzap] in table 'Zaposlenis_Sanker'
ALTER TABLE [dbo].[Zaposlenis_Sanker]
ADD CONSTRAINT [PK_Zaposlenis_Sanker]
    PRIMARY KEY CLUSTERED ([Sifzap] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [SalaRedBrSale] in table 'Radis'
ALTER TABLE [dbo].[Radis]
ADD CONSTRAINT [FK_SalaRadi]
    FOREIGN KEY ([SalaRedBrSale])
    REFERENCES [dbo].[Salas]
        ([RedBrSale])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SalaRadi'
CREATE INDEX [IX_FK_SalaRadi]
ON [dbo].[Radis]
    ([SalaRedBrSale]);
GO

-- Creating foreign key on [Konobar_Sifzap] in table 'Radis'
ALTER TABLE [dbo].[Radis]
ADD CONSTRAINT [FK_RadiKonobar]
    FOREIGN KEY ([Konobar_Sifzap])
    REFERENCES [dbo].[Zaposlenis_Konobar]
        ([Sifzap])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RadiKonobar'
CREATE INDEX [IX_FK_RadiKonobar]
ON [dbo].[Radis]
    ([Konobar_Sifzap]);
GO

-- Creating foreign key on [KasaIdk] in table 'Racuns'
ALTER TABLE [dbo].[Racuns]
ADD CONSTRAINT [FK_KasaRacun]
    FOREIGN KEY ([KasaIdk])
    REFERENCES [dbo].[Kasas]
        ([Idk])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_KasaRacun'
CREATE INDEX [IX_FK_KasaRacun]
ON [dbo].[Racuns]
    ([KasaIdk]);
GO

-- Creating foreign key on [ZaposleniSifzap] in table 'Racuns'
ALTER TABLE [dbo].[Racuns]
ADD CONSTRAINT [FK_ZaposleniRacun]
    FOREIGN KEY ([ZaposleniSifzap])
    REFERENCES [dbo].[Zaposlenis]
        ([Sifzap])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ZaposleniRacun'
CREATE INDEX [IX_FK_ZaposleniRacun]
ON [dbo].[Racuns]
    ([ZaposleniSifzap]);
GO

-- Creating foreign key on [ProizvodKodpr] in table 'Cenovniks'
ALTER TABLE [dbo].[Cenovniks]
ADD CONSTRAINT [FK_CenovnikProizvod]
    FOREIGN KEY ([ProizvodKodpr])
    REFERENCES [dbo].[Proizvods]
        ([Kodpr])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CenovnikProizvod'
CREATE INDEX [IX_FK_CenovnikProizvod]
ON [dbo].[Cenovniks]
    ([ProizvodKodpr]);
GO

-- Creating foreign key on [CenovnikCenap], [CenovnikProizvodKodpr] in table 'Stavkas'
ALTER TABLE [dbo].[Stavkas]
ADD CONSTRAINT [FK_CenovnikStavka]
    FOREIGN KEY ([CenovnikCenap], [CenovnikProizvodKodpr])
    REFERENCES [dbo].[Cenovniks]
        ([Cenap], [ProizvodKodpr])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CenovnikStavka'
CREATE INDEX [IX_FK_CenovnikStavka]
ON [dbo].[Stavkas]
    ([CenovnikCenap], [CenovnikProizvodKodpr]);
GO

-- Creating foreign key on [RacunIdr], [RacunKasaIdk], [RacunZaposleniSifzap] in table 'Stavkas'
ALTER TABLE [dbo].[Stavkas]
ADD CONSTRAINT [FK_RacunStavka]
    FOREIGN KEY ([RacunIdr], [RacunKasaIdk], [RacunZaposleniSifzap])
    REFERENCES [dbo].[Racuns]
        ([Idr], [KasaIdk], [ZaposleniSifzap])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RacunStavka'
CREATE INDEX [IX_FK_RacunStavka]
ON [dbo].[Stavkas]
    ([RacunIdr], [RacunKasaIdk], [RacunZaposleniSifzap]);
GO

-- Creating foreign key on [KonobarSifzap] in table 'Gosts'
ALTER TABLE [dbo].[Gosts]
ADD CONSTRAINT [FK_KonobarGost]
    FOREIGN KEY ([KonobarSifzap])
    REFERENCES [dbo].[Zaposlenis_Konobar]
        ([Sifzap])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_KonobarGost'
CREATE INDEX [IX_FK_KonobarGost]
ON [dbo].[Gosts]
    ([KonobarSifzap]);
GO

-- Creating foreign key on [Sifzap] in table 'Zaposlenis_Konobar'
ALTER TABLE [dbo].[Zaposlenis_Konobar]
ADD CONSTRAINT [FK_Konobar_inherits_Zaposleni]
    FOREIGN KEY ([Sifzap])
    REFERENCES [dbo].[Zaposlenis]
        ([Sifzap])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Sifzap] in table 'Zaposlenis_Sanker'
ALTER TABLE [dbo].[Zaposlenis_Sanker]
ADD CONSTRAINT [FK_Sanker_inherits_Zaposleni]
    FOREIGN KEY ([Sifzap])
    REFERENCES [dbo].[Zaposlenis]
        ([Sifzap])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------