USE JurassicPark
GO

SELECT * FROM JurassicPark.dbo.tf_Uebersicht_Dino_zuZeitpunkt(0)


SELECT * FROM JurassicPark.dbo.tf_Uebersicht_Dino_zuZeitpunkt(1)


SELECT * FROM JurassicPark.dbo.tf_Uebersicht_Dino_zuZeitpunkt([dbo].[sf_MaxZeitDatID_Person](1))