create type Departament as object (
    code integer,
    name_ varchar(255),
    initials varchar(10)
);/
create type body Department as object ();/

create type Person as object (
    cpf varchar(11),
    name_ varchar(255),
    phone -- multivalored field
) not instantiable;/
create type body Person as object ();/


