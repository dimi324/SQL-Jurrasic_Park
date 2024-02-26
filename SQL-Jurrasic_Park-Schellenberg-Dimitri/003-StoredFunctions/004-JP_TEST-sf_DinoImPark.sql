USE JurassicPark
GO

--TEST Dino im Park
PRINT [dbo].[sf_DinoImPark] (1);
PRINT [dbo].[sf_DinoImPark] (2);
---TEST DINO entkommen
PRINT [dbo].[sf_DinoImPark] (3);
--TEST Dino im falschen Gehege, aber im Park
PRINT [dbo].[sf_DinoImPark] (4);
