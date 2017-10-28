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

create view VistaCitasPaciente as
select c.InicioCita,c.FinCita,e.NomEmpleado,p.NomPaciente
from CitaPaciente c,EmpleadoConsultorio e,PacienteConsultorio p
left join CitaPaciente b on b.IDPaciente=p.IDPaciente

create view VistaCitas as
select p.InicioCita,p.FinCita,e.NomEmpleado,p.NomPaciente
from VistaCitasPaciente p,VistaCitasDoctor e
left join VistaCitasPaciente c on e.NomEmpleado=c.NomEmpleado

select * 
from VistaCitas

select *
from VistaCitasDoctor

select *
from VistaCitasPaciente