ClassicEditor
    .create(document.querySelector('#content'))
    .then( editor => {
        editor.model.document.on( 'change:data', () => {
            editorData = editor.getData();
        } );
    } )
    .catch( error => {
        console.error( error );
    } );