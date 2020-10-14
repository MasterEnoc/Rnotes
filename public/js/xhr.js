
let sideElements = document.querySelectorAll('.panel-element');

for (let y = 0; y < sideElements.length; y++){
    sideElements[y].addEventListener('click', (event)=>{

        let xhr = new XMLHttpRequest();

        xhr.onreadystatechange = () => {
            if (xhr.readyState === 4 && xhr.status === 200 ) {
                document.getElementById('display-note').innerHTML = xhr.responseXML.body.innerHTML;
            }
        };

        xhr.open('GET', '/releaseNotes/'+event.target.id+'.html', true);
        xhr.responseType = 'document';
        xhr.send();

    });
}
