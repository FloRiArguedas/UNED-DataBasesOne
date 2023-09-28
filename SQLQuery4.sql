USE biblioteca
GO
INSERT [dbo].[Libros] ([codigo], [titulo], [editorial], [edicion], [ano], [copias]) VALUES (1, N'La paradoja', N'EUNED', 1, 2000, 10)
GO
INSERT [dbo].[Libros] ([codigo], [titulo], [editorial], [edicion], [ano], [copias]) VALUES (2, N'El monje que vendio su ferrari', N'EUNED', 1, 2010, 5)
GO
INSERT [dbo].[Libros] ([codigo], [titulo], [editorial], [edicion], [ano], [copias]) VALUES (3, N'Padre Rico Padre Pobre', N'EUNED', 2, 2002, 10)
GO
INSERT [dbo].[Autores] ([codautor], [nombre], [nacionalidad], [seudonimo], [fec_nacimiento]) VALUES (1, N'Luis Vindas', N'xxx', N'Lucho', CAST(N'2022-01-01' AS Date))
GO
INSERT [dbo].[Autores] ([codautor], [nombre], [nacionalidad], [seudonimo], [fec_nacimiento]) VALUES (2, N'Ana Rojas', N'xxx', N'Anita', CAST(N'2022-01-01' AS Date))
GO
INSERT [dbo].[Autores] ([codautor], [nombre], [nacionalidad], [seudonimo], [fec_nacimiento]) VALUES (3, N'Carmen Lyra', N'xxx', N'Tia Panchita', CAST(N'2022-01-01' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Libros_X_Autores] ON 
GO
INSERT [dbo].[Libros_X_Autores] ([consecutivo], [codigo], [codautor]) VALUES (1, 1, 1)
GO
INSERT [dbo].[Libros_X_Autores] ([consecutivo], [codigo], [codautor]) VALUES (2, 2, 2)
GO
INSERT [dbo].[Libros_X_Autores] ([consecutivo], [codigo], [codautor]) VALUES (3, 2, 3)
GO
INSERT [dbo].[Libros_X_Autores] ([consecutivo], [codigo], [codautor]) VALUES (4, 3, 3)
GO
SET IDENTITY_INSERT [dbo].[Libros_X_Autores] OFF
GO
INSERT [dbo].[Clientes] ([cedula], [nombre], [fec_nacimiento], [direccion], [telefono]) VALUES (111, N'Juan Perez
', CAST(N'2022-01-01' AS Date), N'xxx', N'xxx')
GO
INSERT [dbo].[Clientes] ([cedula], [nombre], [fec_nacimiento], [direccion], [telefono]) VALUES (222, N'xxx', CAST(N'2022-01-01' AS Date), N'xxx', N'xxx')

Select *
From prestamos


GO
INSERT [dbo].[Prestamos] ([codprestamo], [fec_prestamo], [fec_vencimiento], [estado], [fec_entrega], [codigo], [cedula]) VALUES (1, CAST(N'2022-03-01' AS Date), CAST(N'2022-03-30' AS Date), N'E', CAST(N'2022-03-30' AS Date), 2, 111)
GO
INSERT [dbo].[Prestamos] ([codprestamo], [fec_prestamo], [fec_vencimiento], [estado], [fec_entrega], [codigo], [cedula]) VALUES (2, CAST(N'2022-03-01' AS Date), CAST(N'2022-03-30' AS Date), N'R', NULL, 2, 111)
GO
INSERT [dbo].[Prestamos] ([codprestamo], [fec_prestamo], [fec_vencimiento], [estado], [fec_entrega], [codigo], [cedula]) VALUES (2, CAST(N'2022-03-01' AS Date), CAST(N'2022-03-30' AS Date), N'R', NULL, 2, 111)
GO

Select *
from prestamos

update prestamos
set cedula = '222'
where codprestamo = '1' 
update prestamos
set codigo = '1'
where codprestamo = '1'
update prestamos
set estado = 'P'
where codprestamo = '1'