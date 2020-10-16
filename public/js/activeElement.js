let panelElements = document.querySelectorAll('.panel-element');
console.log(panelElements);

for (let x = 0; x < panelElements.length; x++){

    panelElements[x].addEventListener('click', (event) =>{
        let active = document.querySelector('.active');

        if (active){
            active.className = 'panel-element';
        }

        event.target.className += ' active';
    });

}
