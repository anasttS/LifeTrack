MODAL = {
    open:function(ident){
        setTimeout(function(){
            $(ident).modal();
        },50);
        
    },
    close:function(ident){
        $(ident).modal('hide');
    },
    dialog:function(title, body){
        $('.modal_bs_dialog_title').html(title);
        $('.modal_bs_dialog_body').html(body);
        
        setTimeout(function(){
            $('#modal_bs_dialog').modal();
        },50);
    },
    img:function(img_src){
        $('#modal_bs_img_body').attr('src',img_src);
        setTimeout(function(){
            $('#modal_bs_img').modal();
        },50);
    }
};
$(document).ready(function(){

}).on('click','.open_modal',function(){
    var modal_id=$(this).attr('href')||$(this).attr('data-href');
    MODAL.open(modal_id);
    return false;
}).on('click','.open_modal_img',function(){
    var img_src=$(this).attr('href')||$(this).attr('data-href');
    MODAL.img(img_src);
    return false;

});