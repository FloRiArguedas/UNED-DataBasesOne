use proyectoII /*(coloque posterior al USE el nombre de la BD que contiene la informaci�n relacionada a la organizaci�n pol�tica de CR)*/

/*FLORICELA ARGUEDAS Z��IGA - PROYECTO PROGRAMADO #3*/

/*PRIMERA FUNCION CANTIDAD DE DISTRITOS, CANTONES Y PROVINCIAS*/

Create or Alter function fnc_get_hijos(@pais varchar(100), @provincia varchar(100), @canton varchar(100)) returns int
as
begin
declare @resultado int
	 if  (@pais is not null and @provincia is not null and @canton is not null)
	 begin
		 set  @resultado = (Select  count(NOMBRE_DIST) 
			from proyecto2.GEO_DISTRITO d inner join Proyecto2.GEO_CANTON c on d.COD_CANTON = c.COD_CANTON
			inner join Proyecto2.GEO_PROVINCIA pr on c.COD_PROVINCIA = pr.COD_PROVINCIA inner join proyecto2.GEO_PAIS pa on pr.COD_PAIS = pa.COD_PAIS
			where pa.NOMBRE_PAIS = @pais and pr.NOMBRE_PRO = @provincia and c.NOMBRE_CAN = @canton);
	 end
	 if (@pais is not null and @provincia is not null and @canton is null)
	 begin
		set @resultado =(Select count (NOMBRE_CAN)
			from proyecto2.GEO_CANTON c inner join Proyecto2.GEO_PROVINCIA pr on c.COD_PROVINCIA = pr.COD_PROVINCIA
			inner join Proyecto2.GEO_PAIS pa on pr.COD_PAIS = pa.COD_PAIS
			where pa.NOMBRE_PAIS = @pais and pr.NOMBRE_PRO = @provincia);
	end
	if (@pais is not null and @provincia is null and @canton is null)
	begin
		 set @resultado =( Select count (NOMBRE_PRO)
			from Proyecto2.GEO_PROVINCIA pr inner join Proyecto2.GEO_PAIS pa on pr.COD_PAIS = pa.COD_PAIS
			where pa.NOMBRE_PAIS = @pais);
	end
	 return @resultado 
 end;

 /* SEGUNDA FUNCI�N  RETORNO DE �REA*/

 Create or Alter function fnc_get_area(@pais varchar(100), @provincia varchar(100), @canton varchar(100), @distrito varchar (100)) returns decimal
as
begin
declare @resultado decimal
	 if  (@pais is not null and @provincia is not null and @canton is not null and @distrito is not null)
	 begin
		 set  @resultado = (Select  SUM(AREA) 
			from proyecto2.GEO_DISTRITO d inner join Proyecto2.GEO_CANTON c on d.COD_CANTON = c.COD_CANTON
			inner join Proyecto2.GEO_PROVINCIA pr on c.COD_PROVINCIA = pr.COD_PROVINCIA inner join proyecto2.GEO_PAIS pa on pr.COD_PAIS = pa.COD_PAIS
			where pa.NOMBRE_PAIS = @pais and pr.NOMBRE_PRO = @provincia and c.NOMBRE_CAN = @canton and d.NOMBRE_DIST = @distrito);
	 end
	 if  (@pais is not null and @provincia is not null and @canton is not null and @distrito is null)
	 begin
		 set  @resultado = (Select  SUM(AREA) 
			from proyecto2.GEO_DISTRITO d inner join Proyecto2.GEO_CANTON c on d.COD_CANTON = c.COD_CANTON
			inner join Proyecto2.GEO_PROVINCIA pr on c.COD_PROVINCIA = pr.COD_PROVINCIA inner join proyecto2.GEO_PAIS pa on pr.COD_PAIS = pa.COD_PAIS
			where pa.NOMBRE_PAIS = @pais and pr.NOMBRE_PRO = @provincia and c.NOMBRE_CAN = @canton);
	 end
	 if  (@pais is not null and @provincia is not null and @canton is null and @distrito is null)
	 begin
		 set  @resultado = (Select  SUM(AREA) 
			from proyecto2.GEO_DISTRITO d inner join Proyecto2.GEO_CANTON c on d.COD_CANTON = c.COD_CANTON
			inner join Proyecto2.GEO_PROVINCIA pr on c.COD_PROVINCIA = pr.COD_PROVINCIA inner join proyecto2.GEO_PAIS pa on pr.COD_PAIS = pa.COD_PAIS
			where pa.NOMBRE_PAIS = @pais and pr.NOMBRE_PRO = @provincia);
	 end
	 if  (@pais is not null and @provincia is null and @canton is null and @distrito is null)
	 begin
		 set  @resultado = (Select  SUM(AREA) 
			from proyecto2.GEO_DISTRITO d inner join Proyecto2.GEO_CANTON c on d.COD_CANTON = c.COD_CANTON
			inner join Proyecto2.GEO_PROVINCIA pr on c.COD_PROVINCIA = pr.COD_PROVINCIA inner join proyecto2.GEO_PAIS pa on pr.COD_PAIS = pa.COD_PAIS
			where pa.NOMBRE_PAIS = @pais);
	 end

	 return @resultado 
 end;



 /*PRUEBAS FUNCION #1*/

Select dbo.fnc_get_hijos ('costa rica', null ,null) as cantidadProvincias

Select dbo.fnc_get_hijos ('costa rica', 'San Jose',null) as cantidadCantones

Select dbo.fnc_get_hijos ('costa rica', 'Heredia', 'San Pablo') as cantidadDistritos 


/* PRUEBAS FUNCION #2 */

Select dbo.fnc_get_area ('costa rica', 'Heredia', 'San Pablo','San Pablo') as �reaDistrito

Select dbo.fnc_get_area ('costa rica', 'Heredia', 'San Pablo',null) as �reaCant�n

Select dbo.fnc_get_area ('costa rica', 'Heredia', null,null) as �reaProvincia

Select dbo.fnc_get_area ('costa rica',null, null,null) as �reaPa�s


/*FIN DEL SCRIPT*/