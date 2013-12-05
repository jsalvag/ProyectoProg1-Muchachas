PROGRAM NOSE;

USES CRT;

CONST
  CANT_P=10;

  MATERIAS: ARRAY[1..10] of string = ('Tecnicas De Programacion','Programacion 1','Ingles Tacnico','Herramientas Gereneciales','Metodologia De La Investigacion','Herramientas Gerenciales 2','Matematica 1','Algebra Lineal','Matematica 3','Sistemas 3');

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
  indice,selc,modi,elim:Integer;
  ver: boolean;
  resp: String;
  listaP: tLista;

FUNCTION selecMateria():String;
  Var
    i, sel: Integer;

  Begin
    writeln;

    for i:=1 to 10 do
      writeln('       ',i,'-',MATERIAS[i]);
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
      3: Profesion:='Magister';
      4: Profesion:='Doctor';
    end;

    writeln;
  End;

PROCEDURE datosP(indice:Integer; var listaP:tLista);
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

PROCEDURE contarHoras(VAR k:Integer);
  Var
    i, j, l, hSem, hDia, clase:Integer;
    horas: array[1..5] of Integer;
  Begin
    hDia:=0;
    clase:=0;
    hSem:=0;

    with listaP[k] do
    for i:=1 to 3 do
      with horario[i] do
        if (nomMateria<>'') then
        begin
          clase:=clase+1;
          writeln('Horario para ',nomMateria);
          for j:=1 to 2 do
          with horas[j] do
          begin
            if (dia<>'') then begin
              case dia of
                'Lunes':
                begin
                  writeln('   ',dia,' ',catH,' horas');
                  writeln('   ',horaI,' - ',horaF);
                  hDia:=hDia+catH;
                end;
                'Martes':
                begin
                  writeln('   ',dia,' ',catH,' horas');
                  writeln('   ',horaI,' - ',horaF);
                  hDia:=hDia+catH;
                end;
                'Miercoles':
                begin
                  writeln('   ',dia,' ',catH,' horas');
                  writeln('   ',horaI,' - ',horaF);
                  hDia:=hDia+catH;
                end;
                'Jueves':
                begin
                  writeln('   ',dia,' ',catH,' horas');
                  writeln('   ',horaI,' - ',horaF);
                  hDia:=hDia+catH;
                end;
                'Viernes':
                begin
                  writeln('   ',dia,' ',catH,' horas');
                  writeln('   ',horaI,' - ',horaF);
                  hDia:=hDia+catH;
                end;
              end;
            end;
          end;
          writeln;
          writeln('Total de horas en la semana de ',nomMateria,': ',hDia);
          writeln;
          hSem:=hSem+hDia;
          writeln('Total de horas para ',clase,' materias: ',hSem);
          hDia:=0;
        end;
  End;


PROCEDURE verDatos;
  Var
    i,j,k,sel:integer;
  Begin
    clrscr;
    writeln('Numero de los Profesores ingresados');
    for k:=1 to indice do
    begin
      writeln('Profesor N§ ',k);
      writeln('  Cedula:      ',listaP[k].ci);
      writeln('  Nombre:      ',listaP[k].nom,' ',listaP[k].ape);
      writeln;
    end;

    write('Seleccione el N§ del Profesor para ver sus datos: ');
    readln(sel);
    writeln;

    if (ci<>'') then begin
      
    end
    else begin
      
    end;

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
      contarHoras(sel);
      writeln;
      {for i:=1 to 3 do
      begin
        with horario[i] do
        if (nomMateria<>'') then
        begin
          writeln('Materia ',i);
          writeln('       Nombre: ',nomMateria);
          for j:=1 to 2 do
          begin
            with horas[j] do
            if (dia<>'') then
            begin
              writeln('               Dia ',dia);
              writeln('               Desde ',horaI,' hasta ',horaF);
              writeln('               ',catH,' horas');
              writeln;
            end;
          end;
        end;
      end;}
    end;
    readkey;
  End;

procedure contarProfe(VAR listaP:tLista);
begin

end;

procedure eliminarPorfe(VAR listaP:tLista; indice:Integer);
var
  i:integer;
begin
  for i := indice to CANT_P-1 do begin
    listaP[i]:=listaP[i+1];
  end;
  indice=indice-1;
end;


BEGIN
  clrscr;
  indice:=0;
  ver:= false;
  REPEAT
  clrscr;
  writeln('-------------MENU-------------');
  writeln('1.-Ingresar Profesor');
  writeln('2.-Ver Datos');
  writeln('3.-Modificar');
  writeln('4.-Eliminar');
  writeln('5.-Salir');

  readln(selc);

  case selc of
    1:begin
      indice:=indice+1;
      datosP(indice,listaP);
    end;
    2:verdatos;
    3:begin
      write('Numero del Profesor a Modificar: ');
      readln(modi);
      datosP(modi,listaP);
    end;
    4:begin
      write('Numero del Profesor a Eliminar: ');
      readln(elim);
      eliminarPorfe(listaP,elim);
    end;
    5:ver:=true;
  end;

  UNTIL(ver);
  writeln('Adios...');
  readkey;
END.
