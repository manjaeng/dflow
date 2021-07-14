$(function () {

    changeMall = function(){
        let seletValue =$('#mallListSel').val();
        let optionItems = $('#mallListSel').children('option');
        let optionValue, otpionPost, optionDesc
        optionItems.each(function (i){
            optionValue =$(this).attr('value');
            otpionPost =$(this).attr('data-post');
            optionDesc =$(this).attr('data_addr');
            if(seletValue == optionValue){
                $('#postInput').val(otpionPost);
                $('#postInput').parent().addClass('is-filled');
                $('#addrInput').val(optionDesc);
                $('#addrInput').parent().addClass('is-filled');
            }
        })
    }
    inputValidation = function () {
        return false;
    }
    $('input[type=checkbox]').off().on('click',function(event){
        if($(this).attr('checked') == "checked"){
            $(this).removeAttr( "checked") ;
        }else{
            $(this).attr('checked',"checked") ;
        }
    });

    $('#userEditBtn').click(function () {
        if (inputValidation()) return;
        $("#userEditBtn").prop("disabled", true);
        const serializedValues2 = $('form[name=userInfo]').serializeObject()
        $.ajax({
            type: 'post',
            url: '/app/my/updateUser.do',
            data: JSON.stringify(serializedValues2),
            contentType : 'application/json; charset=utf-8',
            error: function (xhr, status, error) {
                alert(error);
            },
            success: function (json) {
                alert("success")
            }
        });
        $("#userEditBtn").prop("disabled", false);
    });

    $('#companyEditBtn').click(function (event) {
        if (inputValidation()) return;
        $("#companyEditBtn").prop("disabled", true);
        const serializedValues2 = $('form[name=productInfo]').serializeObject();
        let tmpProductType = [];

        $('input[name=productType]').each(function(i){
            console.log($(this).attr('checked'));
          if($(this).attr('checked')){
              tmpProductType.push($(this).val());
          }
        });

        let tmpStyleList = [];
        $('input[name=styleList]').each(function(i){
            if($(this).attr('checked')){
                tmpStyleList.push($(this).val());
            }
        });
        serializedValues2.productType = tmpProductType;
        serializedValues2.styleList = tmpStyleList;
console.dir(serializedValues2);
        $.ajax({
            type: 'post',
            url: '/app/my/updateCompany.do',
            data: JSON.stringify(serializedValues2),
            contentType : 'application/json; charset=utf-8',
            error: function (xhr, status, error) {
                alert("error");
            },
            success: function (json) {
                alert("success")
            }
        });
        $("#companyEditBtn").prop("disabled", false);
    });

    jQuery.fn.serializeObject = function() {
        var obj = null;
        try {
            if(this[0].tagName && this[0].tagName.toUpperCase() == "FORM" ) {
                var arr = this.serializeArray();
                if(arr){ obj = {};
                    jQuery.each(arr, function() {
                        obj[this.name] = this.value; });
                }
            }
        }catch(e) {
            alert(e.message);
        }finally {}
        return obj;
    }

});
