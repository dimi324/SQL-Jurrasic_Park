USE JurassicPark
GO
--TEST Dino im Gehege
PRINT [dbo].[sf_DinoImGehege] (1);
PRINT [dbo].[sf_DinoImGehege] (2);
---TEST DINO entkommen
PRINT [dbo].[sf_DinoImGehege] (3);
--TEST Dino im falschen Gehege, aber im Park
PRINT [dbo].[sf_DinoImGehege] (4);
