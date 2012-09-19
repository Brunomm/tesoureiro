/*
	Este Javascript adidionca no Jquery um comando para buscar elementos que contenham um 
	determinado texto de forma Insensitive (não diferenciando maiúsculas e minúsculass.)
	mais informações veja o bug do jquery em: http://bugs.jquery.com/ticket/278
*/
$.extend($.expr[':'], {
  'containsI': function(elem, i, match, array)
  {
    return (elem.textContent || elem.innerText || '').toLowerCase()
    .indexOf((match[3] || "").toLowerCase()) >= 0;
  }
});