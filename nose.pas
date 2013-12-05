PROGRAM NOSE;

USES CRT;

CONST
  CANT_P = 10;
  MAX_MAT = 3;

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
    horario:array[1..MAX_MAT] of tRMaterias;
  end;

  tLista = array[1..CANT_P] of tRProfesor;

VAR
  indice,selc,modi,elim:Integer;
  ver: boolean;
  resp: String;
  listaP: tLista;

FUNCTION fechar():String;
Var
  d,m,a:String;

begin
  write('   Dia: ');readln(d);
  write('   Mes: ');readln(m);
  write('   Año: ');readln(a);

  fechar:=(d+'/'+m+'/'+a);
end;

FUNCTION selecMateria():String;
  Var
    i, sel: Integer;
    cond:boolean;

  Begin
  cond:=false;
  repeat
    writeln;

    for i:=1 to Length(MATERIAS) do
      writeln('       ',i,'-',MATERIAS[i]);
    writeln('       ',i+1,'-Sin Materia');
    readln(sel);
    if ((sel>0) and (sel<=Length(MATERIAS)+1)) then begin
      cond:=true;
      if (sel=Length(MATERIAS)+1) then
        selecMateria:='Sin Materia'
      else
        selecMateria:=MATERIAS[sel];
    end else begin
      writeln('Opcion incorrecta');
    end;
  until (cond);
  End;

FUNCTION estudio():String;
  Var
    selc: integer;
    cond:boolean;

  Begin
  cond:=false;
  repeat

    writeln('       1.-Pregrado');
    writeln('       2.-Especialidad');
    writeln('       3.-Maestria');
    writeln('       4.-Doctorado');
    readln(selc);

    if ((selc>0) and (selc<5)) then begin
      cond:=true;
    case (selc) of
      1: estudio:='Pregrado';
      2: estudio:='Especialista';
      3: estudio:='Magister';
      4: estudio:='Doctor';
    end;

    writeln;
    end else begin
      writeln('Opcion incorrecta');
    end;
  until (cond);
  End;

FUNCTION profesion():String;
  Var
    sel:Integer;
    cond:boolean;
  begin
  cond:=false;
  repeat
    writeln('       1.-Licenciado');
    writeln('       2.-Ingeniero');
    readln(sel);
    if (sel=1) then begin
      profesion:='lic';
      cond:=true;
    end;
    if (sel=2) then begin
      profesion:='ing';
      cond:=true;
    end;
  until (cond);

  end;

PROCEDURE datosP(indice:Integer; var listaP:tLista);
  VAR
    resp,r:String;
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
      writeln('Fecha de Nacimiento: ');
      fNac:=fechar;
      write('Lugar de Nacimiento: ');
      readln(lNac);
      write('Nacionalidad: ');
      readln(nacion);
      write('Direccion: ');
      readln(dir);
      write('Correo electronico: ');
      readln(email);
      write('Telefono fijo: ');
      readln(tlfF);
      write('Telefono movil: ');
      readln(tlfM);
      writeln('Fecha de ingreso: ');
      fIngre:=fechar;
      write('Universidad de Origen: ');
      readln(uniOr);
      writeln('Profesion: ');
      titulo:=profesion;
      writeln('Estudios Especiales');
      profs:=estudio;
      writeln('Horario');
      for i:=1 to MAX_MAT do
      begin
        with horario[i] do
        begin
          writeln('Datos para la materia ',i);
          writeln('Nombre de la materia: ');
          nomMateria:=selecMateria;
          if (nomMateria<>'Sin Materia') then begin
            for j:=1 to 2 do
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
                if sel=6 then
                  break;
              end;
              writeln;
              if (MAX_MAT>i) then begin
                write('Desea ingresar otra materia?(s/n): ');
                readln(resp);
                if(resp='n') then
                  break;
              end;
          end
          else
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
    for i:=1 to MAX_MAT do
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
          writeln('   Horas semanales de ',nomMateria,': ',hDia);
          writeln;
          hSem:=hSem+hDia;
          hDia:=0;
        end;
        writeln('Total de horas para ',clase,' materias: ',hSem);
  End;


PROCEDURE verDatos;
  Var
    i,j,k,sel:integer;
   cond:boolean;
  Begin
  cond:=false;
  repeat
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

    if (sel <= indice) then begin
      with listaP[sel] do
      begin
        writeln('Cedula:        ',ci);
        writeln('Nombre:        ',nom);
        writeln('Apellido:      ',ape);
        writeln('Fecha de Nacim:',fNac);
        writeln('Lugar de Nacim:',lNac);
        writeln('Nacionalidad:  ',nacion);
        writeln('Direccion:     ',dir);
        writeln('Correo electro:',email);
        writeln('Telefono Fijo: ',tlfF);
        writeln('Telefono Movil:',tlfM);
        writeln('Fecha de ingre:',fIngre);
        writeln('Universidad:   ',uniOr);
        writeln('Profesion:     ',titulo);
        writeln('Estudios Espec:',profs);
        contarHoras(sel);
        writeln;
        cond:=true;
      end;
    end
    else begin
      writeln('Seleccione uno de los numeros listados.');
      cond:=false;
    end;
    readkey;
  until (cond);
  End;

PROCEDURE eliminarPorfe(VAR listaP:tLista; indice:Integer);
var
  i:integer;
begin
  for i := indice to CANT_P-1 do begin
    listaP[i]:=listaP[i+1];
  end;
  indice:=indice-1;
end;

PROCEDURE contarProfe(VAR listaP:tLista);
Var
  i,lic,ing,prof,esp,mag,doc:Integer;

begin
  lic:=0;
  ing:=0;
  esp:=0;
  mag:=0;
  doc:=0;
  clrscr;
  writeln('El Decanato de Ingenieria de la Universidad cuenta con ',indice,' Profesores');
  for i := 1 to indice do begin
    with (listaP[i]) do
    begin
      if (titulo='lic') then begin
        lic:=lic+1;
      end;
      if (titulo='ing') then begin
        ing:=ing+1;
      end;
      case (profs) of
        'Pregrado': prof:=prof+1;
        'Especialista': esp:=esp+1;
        'Magister': mag:=mag+1;
        'Doctor': doc:=doc+1;
      end;
    end;
  end;
  writeln('Con los siguientes estudios:');
  writeln('   ',lic,' Licenciados');
  writeln('   ',ing,' Ingenieros');
  writeln;
  writeln('Y con los siguientes niveles educativos:');
  writeln('   ',esp,' Especialistas');
  writeln('   ',mag,' Magister');
  writeln('   ',doc,' Doctores');
  readkey;
End;

procedure verMaterias(Var listaP:tLista);
Var
  i,j,k:Integer;
  mat:String;
begin
  clrscr;
  writeln('Lista de materias por Profesor');
  writeln;
  for i := 1 to indice do begin
    with (listaP[i]) do begin
      writeln('Profesor ',nom,' ',ape,':');
      for j := 1 to MAX_MAT do begin
        with (horario[j]) do
        begin
          if (nomMateria<>'') then
            writeln(j,'-',nomMateria);
        end;
      end;
      writeln;
    end;
  end;
  readkey;
End;

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
  writeln('5.-Reporte de Profesores');
  writeln('6.-Reporte de materias por Profesor');
  writeln('7.-Salir');

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
    5:contarProfe(listaP);
    6:verMaterias(listaP);
    7:ver:=true;
  end;

  UNTIL(ver);
  writeln('Adios...');
  readkey;
END.
