use Consultorio

select *
from CitaPaciente

select *
from Consultorio

insert into Consultorio
values (1,'Edificio A, Piso 1')

select *
from DetalleReceta

select *
from DoctorConsultorio

insert into DoctorConsultorio
values ('297DE01D-2282-4274-9F9E-74267A3A2F41','Cardiologo')
insert into DoctorConsultorio
values ('48B412E1-3189-4393-A2E0-D991502B8875','Psicologo')
insert into DoctorConsultorio
values ('C236E60A-1B36-489A-A44F-F8807901F1C0','Neurologo')

select *
from EmpleadoConsultorio

insert into EmpleadoConsultorio
values (NewId(),'Alberto Aphac Renteria')
insert into EmpleadoConsultorio
values (NewId(),'Jose Eduardo Torres Torres')
insert into EmpleadoConsultorio
values (NewId(),'Angel Mario Barbosa de Leon')

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

drop table MovimientoSalida

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

select *
from RecetaPaciente