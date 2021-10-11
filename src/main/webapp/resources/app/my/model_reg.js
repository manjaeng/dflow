$(function () {



    inputValidation = function(){

            return false;

    }

    changeMall = function(){
        let selector = $('#mallListSel');
        let seletValue =selector.val();
        let optionItems = selector.children('option');
        let optionValue;
        let otpionPost;
        let optionDesc;

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

    $('input[type=checkbox]').off().on('click',function(event){
        if($(this).attr('checked') == "checked"){
            $(this).removeAttr( "checked") ;
        }else{
            $(this).attr('checked',"checked") ;
        }
    });

    $('#joinButton').click(function (event) {
        if(inputValidation()) return;
        $("#joinButton").prop("disabled", true);

        $("#fileUploadForm").ajaxForm({
            url : "/app/my/reg_complete.do",
            enctype : "multipart/form-data",
              success : function(result){
                alert("성공") ;
                console.dir(result);
                pjax('/app/my/model_reg1.do');
            },error: function(result){
                alert("실패") ;
                  pjax('/app/my/model_reg2.do');
            }
        });
        $("#fileUploadForm").submit();
    });

    let submitFlag = false;
    function submitCheck(){
        if(submitFlag){
            return submitFlag;
        }else{
            submitFlag = true;
            return false;
        }
    }

    userIdKeyUp = function(){
        submitFlag = false;
        if($('#userIdGroup').hasClass("has-danger")){
            $('#userIdGroup').removeClass("has-danger");
        }
        if($('#userIdGroup').hasClass("has-success")){
            $('#userIdGroup').removeClass("has-success");
        }
    }

    duplCheck = function(from, align) {
        if(submitCheck()){return;}
        let tmpId = $('input[name=userId]').val();
        console.log(tmpId);
        let param = {
            "userId" : tmpId
        }

        $.ajax({
            type : 'post',
            url : '/app/user/idCheck.do',
            data : param,
            success : function(data) {
               if(data =='success') {
                   $('#userIdGroup').addClass("has-success");

               }
            },
            error : function(xhr,status, error) {
                $('#userIdGroup').addClass("has-danger");
                type = ['', 'info', 'danger', 'success', 'warning', 'rose', 'primary'];

                color = Math.floor((Math.random() * 6) + 1);

                $.notify({
                    icon: "add_alert",
                    message: "사용하신 아이디  <b>"+ tmpId +"</b> 는 동일한 아이디를 사용하고 있는 다른 유저가 있습니다"

                }, {
                    type: type[color],
                    timer: 30000,
                    placement: {
                        from: from,
                        align: align
                    }
                });
            }
        });
    }


});
