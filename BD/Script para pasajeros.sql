SELECT * FROM relreservaxusuario
SELECT * FROM RESERVA
SELECT * FROM USUARIOS

select * from relreservaxusuario re
left join RESERVA r
on re.iDReserva = r.IdReserva
left join usuarios u
on u.DNI = re.DniUsuario