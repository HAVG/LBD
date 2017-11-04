use Consultorio

select *
from CitaPaciente

select *
from Consultorio
insert into Consultorio
values (1,'Edificio 1, Piso 1')

select *
from DetalleReceta

select *
from DoctorConsultorio
insert into DoctorConsultorio
values ('90612357-50D1-479F-AAAA-E15B9BD5DE8C','Cardiologo')
insert into DoctorConsultorio
values ('742A4991-85F3-44FD-A4AE-EBD7E838FE74','Psicologo')
insert into DoctorConsultorio
values ('275DD499-E447-4513-A483-D8D3DC43092F','Neurologo')

select NomEmpleado, IDEmpleado
from EmpleadoConsultorio
insert into EmpleadoConsultorio
values (NewId(),'Alberto Aphac Renteria')
insert into EmpleadoConsultorio
values (NewId(),'Jose Eduardo Torres Torres')
insert into EmpleadoConsultorio
values (NewId(),'Angel Mario Barbosa de Leon')
insert into EmpleadoConsultorio
values (default,default)
delete from EmpleadoConsultorio
where NomEmpleado = 'Alberto Aphac Renteria'
delete from EmpleadoConsultorio
where NomEmpleado = 'Jose Eduardo Torres Torres'
delete from EmpleadoConsultorio
where NomEmpleado = 'Angel Mario Barbosa de Leon'

select *
from HistorialMedicinas

select *
from HistorialPaciente

select *
from ListadoMedicamentos
insert into ListadoMedicamentos
values (newid(),'Diazepam','Inyeccion: Inyección: 5 mg/ml en ampollas de 2 ml (intravenosa o rectal).')
insert into ListadoMedicamentos
values (newid(),'Ampicilina','Polvo para inyección: 500 mg; 1 g (como sal sódica) en viales')
insert into ListadoMedicamentos
values (newid(),'Nitrofurantoina','Comprimidos: 100 mg')

select *
from PacienteConsultorio
insert into PacienteConsultorio
values (newid(),'Hector Andres Valdes Gonzalez')
insert into PacienteConsultorio
values (default,default)

select *
from RecetaPaciente

select *
from MovimientosEntrada

select *  
into #InValid
from InventarioMedicamentos
where Cantidad<10

select *
from(
select m.IDMedicamento,SUM(i.Cantidad+e.Cantidad-s.Cantidad) as CantTotal
from ListadoMedicamentos m,InventarioMedicamentos i,MovimientosEntrada e,MovimientoSalida s
group by m.IDMedicamento
)as InvAct 
where CantTotal>10

create view VistaCitasDoctor as
select c.InicioCita,c.FinCita,e.NomEmpleado,p.NomPaciente
from CitaPaciente c,PacienteConsultorio p,EmpleadoConsultorio e
left join CitaPaciente a on a.IDEmpleado=e.IDEmpleado
select *
from VistaCitasDoctor
create view VistaCitasPaciente as
select c.InicioCita,c.FinCita,e.NomEmpleado,p.NomPaciente
from CitaPaciente c,EmpleadoConsultorio e,PacienteConsultorio p
left join CitaPaciente b on b.IDPaciente=p.IDPaciente
select *
from VistaCitasPaciente
create view VistaCitas as
select p.InicioCita,p.FinCita,e.NomEmpleado,p.NomPaciente
from VistaCitasPaciente p,VistaCitasDoctor e
left join VistaCitasPaciente c on e.NomEmpleado=c.NomEmpleado
select * 
from VistaCitas

--Crear Stored Procedures para movimientos de entrada y salida, para ejecutarlos
--en un trigger cuando hay movimientos de entrada y/o salida

--Ver si lo anterior se puede simplificar con una Funcion SQL que se ejecute en un trigger

--Investigar expresiones regulares SQL

--Practica 7
create procedure ReporteNCitas
(@input int)
as
begin
	select top (@input) *
	from VistaCitas
	order by NewID()
end
--Primer Prodedure
create trigger tr_Suma
on MovimientosEntrada
after insert,update
as
begin
	update InventarioMedicamentos
	set InventarioMedicamentos.Cantidad=dbo.suma_resta(InventarioMedicamentos.Cantidad,inserted.cantidad)
	
	where InventarioMedicamentos.IdMedicamento=INSERTED.IdMedicamento
end
--PrimerTrigger
create function suma_resta
(@cant int,@cant2 int)
returns int
as begin
	set @cant=@cant+@cant2
	return @cant
end
--Primera Funcion	
--create trigger tr_suma/resta
--on MovimientosEntrada/Salida
--after update/insert
--as
--begin
	--select*from Inserted/deleted (inserted, valores que llegaron, 
	--deleted, valores que se perdieron)
	--Insert solo tiene Inserted, Delete solo deleted, Update ambos
	
	--update Inventario
	--set (valores de insert o delete)
	--where ()
--end