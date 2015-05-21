$(document).ready(function() {
   var editor = $('*[data-editor]');

   $.each(editor, function(index, element) {
      $(element).wysihtml5();
   });
});
