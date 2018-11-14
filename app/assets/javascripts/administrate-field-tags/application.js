//= require @yaireo/tagify/dist/jQuery.tagify.min.js

$.fn.activateTagify = function() {
  if (this.length === 0) { return false; }
  
  var data = $(this).data('tags');
  var $container = $(this).closest('.field-unit__field');
  var $existingTemplate = $container.find('.existing')
  var $newTemplate = $container.find('.new')
  var $tagWrapper = $container.find('.tag_wrapper')
  
  $(this).tagify({
    whitelist: data.map(function(obj) {
      return {
        value: obj.name,
        id: obj.id
      }
    }),
  }).on('add', function(e, tag){
    if (tag.id === undefined) {
      $newTemplate.clone()
        .attr('disabled', false)
        .attr('value', tag.value)
        .appendTo($tagWrapper)
    } else {
      $existingTemplate.clone()
        .attr('disabled', false)
        .attr('value', tag.id)
        .appendTo($tagWrapper)
    }
  }).on('remove', function(e, tag) {
    if (tag.id === undefined) {
      $('.tag_wrapper input[value='+ tag.value +']').remove()
    } else {
      $('.tag_wrapper input[value='+ tag.id +']').remove()
    }
  })
}

$('.tagify-field').activateTagify();
