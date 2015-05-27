/**
 *
 */
$.fn.serializeObject = function serializeObject() {
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};

$.fn.exSetDataInFrom = function exSetDataInFrom(data) {

    var els = this.find(':input').get(); // get input elements from Form

    if (typeof data != 'object') {
        data = {};
        $.each(els, function() {
            if (this.name && !this.disabled && (this.checked || /select|textarea/i.test(this.nodeName) || /text|hidden|password/i.test(this.type))) {
                data[this.name] = $(this).val();
                if (this.type == "text") $(this).keyup();
            }
        });
        return data;
    } else {
        $.each(els, function() {
            if (this.name && data[this.name]) {
                if (this.type == 'checkbox' || this.type == 'radio') {
                    $(this).attr("checked", (data[this.name] == $(this).val()));
                } else {
                    $(this).val(data[this.name]);
                    $(this).keyup();
                }
            }
        });
        return $(this);
    }
};

$.fn.exClearForm = function exClearForm() {

    $(':input', this)
        .not(':button, :submit, :reset, :hidden,:radio')
        .val('')
        .removeAttr('checked')
        .removeAttr('selected');

    this.find('select').each(function() {
        $(this).prop('selectedIndex', 0);
    });
}