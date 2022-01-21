/*Función que controla el paso de datos al formulario, se le pasarán los parámetros de nombre 
y teléfono.*/
/*Se utiliza match() para obtener todas las courrencias de una ExprReg.*/
function controlFormulario(nombre, telefono){
    let expN = /[a-zA-z]{1,90}$/;
    let expT = /[0-9]{4}$/;
    if(nombre.match(expN) && telefono.match(expT)){
        return true;
    }else{
        return false;
    }
}
function mensajeComprobacion(){
    let contenedor_formulario = document.getElementById("contenedor_formulario");
    let div = document.createElement("div");
    div.setAttribute("id", "confirmador");
    let boton1 = document.createElement("button");
    let boton2 = document.createElement("button");
    let h3 = document.createElement("h3");
    h3.innerHTML = "¿Seguro que deseas eliminar la cita?";
    boton1.innerHTML = "Sí";
    boton2.innerHTML = "No";
    div.appendChild(h3);
    div.appendChild(boton1);
    div.appendChild(boton2);
    contenedor_formulario.appendChild(div);

    /*Eliminar cita*/
    boton1.addEventListener("click", () => {
        let cita = document.getElementsByClassName("borrame")[0];
        let boton = document.getElementById("bot_eliminar");
        let confirmador = document.getElementById("confirmador");
        cita.remove();
        confirmador.remove();
        boton.disabled = true;
    });
    /*Dejarlo como está*/
    boton2.addEventListener("click", () => {
        let confirmador = document.getElementById("confirmador");
        confirmador.remove();
    });
}
function empezarArrastrar(ev){
    ev.target.style.border = "2px dashed red";
    ev.target.classList.add("arrastrado");
}
function dragOver(ev){
    ev.preventDefault();
}
function soltarArrastrar(ev){
    let arrastrado = document.getElementsByClassName("arrastrado")[0];
    let dondeSuelto = ev.target;
    dondeSuelto.appendChild(arrastrado);
    arrastrado.classList.remove("arrastrado");
}

export{
    controlFormulario,
    mensajeComprobacion,
    empezarArrastrar,
    dragOver,
    soltarArrastrar
}