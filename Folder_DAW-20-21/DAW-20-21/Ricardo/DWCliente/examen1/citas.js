import * as funciones from './funciones.js';
let Dias = ["Hora", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes"];
let Horas = ["9:00 - 9:30", "9:30 - 10:00", "10:00 - 10:30", "16:00 - 16:30", "16:30 - 17:00"];

/*Capturar DIV donde se va a meter los filas*/
let tabla = document.getElementById("tabla");

for(let i = 0; i < 6; i++){
    let fila = document.createElement("div");
    fila.classList.add("fila");
    tabla.appendChild(fila);
    for(let i = 0; i < 6; i++){
        let campo = document.createElement("span");
        /* campo.setAttribute("draggable", "true"); */
        fila.appendChild(campo);
    }
}
let cabecera = document.getElementsByClassName("fila")[0];
for(let cont = 0; cont < Dias.length; cont++){
    let dias = cabecera.children[cont];
    dias.innerHTML = Dias[cont];
}

let fila1 = document.getElementsByClassName("fila")[1];
let celda1 = fila1.children[0];
celda1.innerHTML = Horas[0];
let fila2 = document.getElementsByClassName("fila")[2];
let celda2 = fila2.children[0];
celda2.innerHTML = Horas[1];
let fila3 = document.getElementsByClassName("fila")[3];
let celda3 = fila3.children[0];
celda3.innerHTML = Horas[2];
let fila4 = document.getElementsByClassName("fila")[4];
let celda4 = fila4.children[0];
celda4.innerHTML = Horas[3];
let fila5 = document.getElementsByClassName("fila")[5];
let celda5 = fila5.children[0];
celda5.innerHTML = Horas[4];

/*Declaración de funciones*/
let nombre = document.getElementById("nombre");
let telefono = document.getElementById("telefono");
let cliente = document.getElementById("cliente");
let informacion = document.getElementById("info");
let spans = document.getElementsByTagName("span");

function anadirCita(evento){
    /*Control del formulario llamando a las funciones del módulo.*/
    if(funciones.controlFormulario(nombre.value, telefono.value) == true){
        let divCont = document.createElement("div");
        let radio;

        divCont.classList.add("cita");
        
        divCont.setAttribute("draggable", "true");
        /*Si el radio está seleccionado, se escribirá cliente*/
        cliente.checked ? radio = "Cliente" : radio = "Socio";
        /*Se le añade al div los datos del formulario*/
        divCont.innerHTML = `
        <p>Nombre: ${nombre.value}</p>
        <p>Teléfono: ${telefono.value}</p>
        <p>Estado: ${radio}</p>`;
        /*Evento que permite poder arrastrar, la función se encuentra en el archivo de funciones*/
        divCont.addEventListener("dragstart", funciones.empezarArrastrar);
        /*Introduce el div en el lugar clickado*/
        evento.currentTarget.appendChild(divCont);
        /*Limpieza del formualrio*/
        nombre.value = "";
        telefono.value = "";
        cliente.checked = false;

        /*Seleccionar la cita en cuestión*/
        divCont.addEventListener("click", (ev) => {
            let boton = document.getElementById("bot_eliminar");
            boton.removeAttribute("disabled");
            ev.currentTarget.classList.add("borrame");
            boton.addEventListener("click", funciones.mensajeComprobacion);
        });

    }else{
        informacion.innerHTML = "Se requiere un número de 9 dígitos.";
    }
}

/*PROGRAMA PRINCIPAL*/
for(let sp of spans){
    sp.addEventListener("click", anadirCita);
    sp.addEventListener("dragover", funciones.dragOver)
    sp.addEventListener("drop", funciones.soltarArrastrar);
}




