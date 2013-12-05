PROGRAM NOSE;

USES CRT;

CONST
        CANT_P=10;

        MATERIAS: ARRAY[1..10] of string = ('Tecnicas De Programacion',
        'Programacion 1','Ingles Tacnico','Herramientas Gereneciales',
        'Metodologia De La Investigacion','Herramientas Gerenciales 2',
        'Matematica 1','Algebra Lineal','Matematica 3','Sistemas 3');

        PROFESIONES: ARRAY[1..4] OF string = ('Pregrado','Especialidad','Maestria','Doctorado');

        DIAS: ARRAY[1..5] OF string = ('Lunes','Martes','Miercoles','Jueves','Viernes');

TYPE
        tRHorario = record
                dia: string;
                horaI: string;
                horaF: string;
                catH: integer;
        end;

        tRMaterias= record
                nomMateria:String;
                horas: array[1..2] of tRHorario;
        end;

        tRProfesor= record
                ci:     String;
                nom:    String;
                ape:    String;
                fNac:   String;
                lNac:   String;
                nacion: String;
                dir:    String;
                tlfF:   String;
                tlfM:   String;
                email:  String;
                uniOr:  String;
                titulo: String;
                profs:  String;
                fIngre: String;
                horario:array[1..3] of tRMaterias;
        end;

        tLista = array[1..CANT_P] of tRProfesor;

VAR
        indice:Integer;
        ver: boolean;
        resp: String;
        selc: Integer;
        listaP: tLista;

FUNCTION selecMateria():String;
Var
        i, sel: Integer;

Begin
        writeln;

        for i:=1 to 10 do
        begin

                writeln('       ',i,'-',MATERIAS[i]);

        end;
        readln(sel);
	writeln('Selecciono:	',MATERIAS[sel]);
        selecMateria:=MATERIAS[sel];

End;

FUNCTION fHorario(var listaP:tLista):tRMaterias;
Var
        horaI,horaF, dia: String;
        cantH, i, j, sel: integer;
        h:tRMaterias;
Begin
	with listaP[indice] do

        fHorario:=h;



End;

FUNCTION Profesion():String;
Var
        selc: integer;
Begin

        writeln('       1.-Pregrado');
        writeln('       2.-Especialidad');
        writeln('       3.-Maestria');
        writeln('       4.-Doctorado');
        readln(selc);

        case (selc) of
        1: Profesion:='Pregrado';
        2: Profesion:='Especialista';
        3: Profesion:='Maestria';
        4: Profesion:='Doctorado';
        end;

        writeln;


End;

PROCEDURE datosP(var listaP:tLista);
VAR
        resp:String;
        cantMat, i, j, k, sel: Integer;

Begin
        clrscr;
        with listaP[indice] do begin
                writeln('Ingrese los datos del Profesor N§ ',indice);
                write('Cedula: ');
                readln(ci);
                write('Nombre: ');
                readln(nom);
                write('Apellido: ');
                readln(ape);
                write('Fecha de Nacimiento: ');
                readln(fNac);
                write('Lugar de Nacimiento: ');
                readln(lNac);
                write('Nacionalidad: ');
                readln(nacion);
                write('Direccion: ');
                readln(dir);
                write('Telefono fijo: ');
                readln(tlfF);
                write('Telefono movil: ');
                readln(tlfM);
                write('Fecha de ingreso: ');
                readln(fIngre);
                write('Universidad de Origen: ');
                readln(uniOr);
                write('Profesion: ');
                readln(titulo);
                writeln('Estudios Especiales');
                profs:=Profesion();
                write('Horario');
                for i:=1 to 3 do
                begin
                        with horario[i] do
                        begin
                                writeln('Datos para la materia ',i);
                                writeln('Nombre de la materia: ');
                                nomMateria:=selecMateria;
                                for j:=1 to 2 do
                                begin
                                        with horas[j] do
                                        begin
                                        writeln('         Seleccione Dia');
                                        for k:=1 to 5 do
                                                writeln('       ',k,'-',DIAS[k]);
                                        writeln('       ',k+1,'-No hay mas dias');
                                        readln(sel);
                                        if((sel>=1) and (sel<=5)) then
                                        begin
                                                dia:=DIAS[sel];
                                                write('         Hora de inicio de la clase: ');
                                                readln(horaI);
                                                write('         Hora en que finaliza la clase: ');
                                                readln(horaF);
                                                write('         Cantidad de horas de duracion de la clase: ');
                                                readln(catH);
                                        end;
                                end;
                        writeln;
                        end;
                        write('Desea ingresar otra materia?(s/n): ');
                        readln(resp);
                        if(resp='n') then
                        break;
                        end;
                end;
        end;

End;

PROCEDURE contarHoras(k:Integer);
Var
        i, j, l, hMat, hSem, hDia:Integer;
        horas: array[1..5] of Integer;
Begin
        hDia:=0;
        {for l:=0 to 5 do
                horas[l]:=0;}

        with listaP[k] do
        for i:=1 to 3 do
                with horario[i] do
                        if (nomMateria<>'') then
                                for j:=1 to 2 do
                                        with horas[j] do
                                        begin
                                                case dia of
                                                'Lunes':writeln('lunes');
                                                end;
                                        end;
End;


PROCEDURE verDatos;
Var
        i,j,k,sel:integer;
Begin
        clrscr;
        writeln('Numero de los Profesores ingresados');
        for k:=1 to indice-1 do
        begin
                writeln('Profesor N§ ',k);
                writeln('  Cedula:      ',listaP[k].ci);
                writeln('  Nombre:      ',listaP[k].nom,' ',listaP[k].ape);
                writeln;
        end;

        write('Seleccione el N§ del Profesor para ver sus datos: ');
        readln(sel);
        writeln;

        with listaP[sel] do
        begin

                writeln('Cedula:        ',ci);
                writeln('Nombre:        ',nom);
                writeln('Apellido:      ',ape);
                writeln('Fecha de Nacim:',fNac);
                writeln('Lugar de Nacim:',lNac);
                writeln('Nacionalidad:  ',nacion);
                writeln('Direccion:     ',dir);
                writeln('Telefono Fijo: ',tlfF);
                writeln('Telefono Movil:',tlfM);
                writeln('Fecha de ingre:',fIngre);
                writeln('Universidad:   ',uniOr);
                writeln('Profesion:     ',titulo);
                writeln('Estudios Espec:',profs);
                writeln;
                for i:=1 to 3 do
                begin
                        with horario[i] do
                        begin
                                writeln('Materia ',i);
                                writeln('       Nombre: ',nomMateria);
                                for j:=1 to 2 do
                                begin
                                        with horas[j] do
                                        begin
                                                writeln('               Dia ',dia);
                                                writeln('               Desde ',horaI,' hasta ',horaF);
                                                writeln('               ',catH,' horas');
                                                writeln;
                                        end;
                                end;
                        end;
                end;
        end;

End;



BEGIN
        clrscr;
        indice:=1;
        ver:= false;
        REPEAT
        clrscr;
        writeln('-------------MENU-------------');
        writeln('1.-Ingresar Profesor');
        writeln('2.-Ver Datos');
        writeln('3.-Salir');

        read(selc);

        case selc of
                1:datosP(listaP);
                2:verdatos;
                3:ver:=true;
        end;

        indice:=indice+1;

        UNTIL(ver);

        contarHoras(1);

        writeln('Adios...');

        readkey;

END.
