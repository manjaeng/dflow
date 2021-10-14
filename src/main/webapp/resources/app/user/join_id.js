$(function () {
    inputValidation = function () {

        if (!$('#userIdGroup').hasClass("has-success")) {
            alert('로그인 아이디 중복체크 해주세요');
            return true;
        }
        var userId = document.getElementById('userId').value;
        if (userId == '' || userId == 'undefined' || userId == null) {
            alert('로그인 ID를 입력해 해주세요');
            return true;
        }

        var pw = document.getElementById('examplePassword').value;
        if (pw == '' || pw == 'undefined' || pw == null) {
            alert('패스워드 를 입력해 해주세요');
            return true;
        }

        var pw2 = document.getElementById('examplePassword2').value;
        if (pw2 == '' || pw2 == 'undefined' || pw2 == null) {
            alert('확인 패스워드 를 입력해 해주세요');
            return true;
        }

        if (pw != pw2) {
            alert('확인 패스워드가 일치하지 않습니다.');
            return true;
        }

        var userId = document.getElementById('userId').value;
        if (userId == '' || userId == 'undefined' || userId == null) {
            alert('로그인ID 를 입력해 해주세요');
            return true;
        }

        var email = document.getElementById('email').value;
        if (email == '' || email == 'undefined' || email == null) {
            alert('email 를 입력해 해주세요');
            return true;
        }

        var userName = document.getElementById('userName').value;
        if (userName == '' || userName == 'undefined' || userName == null) {
            alert('Name 을 입력해 해주세요');
            return true;
        }

        var mobile = document.getElementById('mobile').value;
        if (mobile == '' || mobile == 'undefined' || mobile == null) {
            alert('전화번호 을 입력해 해주세요');
            return true;
        }
        var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
        if (!regPhone.test(mobile)) {
            alert('휴대전화 패턴과 일치하지 않습니다.');
            return true;
        }


        var company = document.getElementById('company').value;
        if (company == '' || company == 'undefined' || company == null) {
            alert('회사명 을 입력해 해주세요');
            return true;
        }

        var comPhone = document.getElementById('comPhone').value;
        if (comPhone == '' || comPhone == 'undefined' || comPhone == null) {
            alert('회사전화번호 을 입력해 해주세요');
            return true;
        }

        var bankName = document.getElementById('bankName').value;
        if (bankName == '' || bankName == 'undefined' || bankName == null) {
            alert('거래은행 을 입력해 해주세요');
            return true;
        }

        var bankCount = document.getElementById('bankCount').value;
        if (bankCount == '' || bankCount == 'undefined' || bankCount == null) {
            alert('은행계좌번호 을 입력해 해주세요');
            return true;
        }

        var postInput = document.getElementById('postInput').value;
        if (postInput == '' || postInput == 'undefined' || postInput == null) {
            alert('매장정보를 입력해 해주세요');
            return true;
        }

        var addrInput = document.getElementById('addrInput').value;
        if (addrInput == '' || addrInput == 'undefined' || addrInput == null) {
            alert('매장정보를 입력해 해주세요');
            return true;
        }

        var exAddr = document.getElementById('exAddr').value;
        if (exAddr == '' || exAddr == 'undefined' || exAddr == null) {
            alert('매장정보를 입력해 해주세요');
            return true;
        }

        var bizNo = document.getElementById('bizNo').value;
        if (bizNo == '' || bizNo == 'undefined' || bizNo == null) {
            alert('사업자 등록번호를 입력해 해주세요');
            return true;
        }

        var checkboxes = document.getElementsByName("styleList");
        var checkCounStylet = 0;
        for (i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
                checkCounStylet = 1
            }
        }

        if (checkCounStylet < 1) {
            alert('제품스타일을 선택해 주세요');
            return true;
        }

        var checkboxes2 = document.getElementsByName("productType");
        var checkCount = 0;
        for (i = 0; i < checkboxes2.length; i++) {
            if (checkboxes2[i].checked) {
                checkCount = 1
            }
        }
        if (checkCount < 1) {
            alert('취급품목을 선택해 주세요');
            return true;
        }


        var fileCheck = document.getElementById("fileUpload").value;
        if (!fileCheck) {
            alert("파일을 첨부해 주세요");
            return true;
        }

        return false;
    }
    check_email = function () {
        var email = document.getElementById('email').value;
        if (email == '') {
            return;
        }
        var regex = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        if (!(email != '' && email != 'undefined' && regex.test(email))) {
            alert("이메일 형식으로 입력해 주세요");
            document.getElementById('email').value = '';
            document.getElementById('email').focus();
        }
    };
    check_pw = function () {
        var pw = document.getElementById('examplePassword').value;
        if (pw == '') {
            return;
        }
        var SC = ["!", "@", "#", "$", "%"];
        var check_SC = 0;

        if (pw.length < 6 || pw.length > 16) {
            window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
            document.getElementById('examplePassword').value = '';
        }
        for (var i = 0; i < SC.length; i++) {
            if (pw.indexOf(SC[i]) != -1) {
                check_SC = 1;
            }
        }
        if (check_SC == 0) {
            window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
            document.getElementById('examplePassword').value = '';
        }
        if (document.getElementById('examplePassword').value != '' && document.getElementById('examplePassword2').value != '') {
            if (document.getElementById('examplePassword').value == document.getElementById('examplePassword2').value) {
                document.getElementById('check').innerHTML = '비밀번호가 일치합니다.'
                document.getElementById('check').style.color = 'blue';
            } else {
                document.getElementById('check').innerHTML = '비밀번호가 일치하지 않습니다.';
                document.getElementById('check').style.color = 'red';
            }
        }
    }

    changeMall = function () {
        let selector = $('#mallListSel');
        let seletValue = selector.val();
        let optionItems = selector.children('option');
        let optionValue;
        let otpionPost;
        let optionDesc;

        optionItems.each(function (i) {
            optionValue = $(this).attr('value');
            otpionPost = $(this).attr('data-post');
            optionDesc = $(this).attr('data_addr');
            if (seletValue == optionValue) {
                $('#postInput').val(otpionPost);
                $('#postInput').parent().addClass('is-filled');
                $('#addrInput').val(optionDesc);
                $('#addrInput').parent().addClass('is-filled');
            }
        })
    }

    $('input[type=checkbox]').off().on('click', function (event) {
        if ($(this).attr('checked') == "checked") {
            $(this).removeAttr("checked");
        } else {
            $(this).attr('checked', "checked");
        }
    });

    $('#joinButton').click(function (event) {
        if (inputValidation()) return;
        $("#joinButton").prop("disabled", true);
        $("#fileUploadForm").ajaxForm({
            url: "/app/user/join_complete.do",
            enctype: "multipart/form-data",
            success: function (result) {
                alert("성공적으로 저장되었습니다.");
                location.href = '/app/my/profile.do';
            }, error: function (result) {
                alert("저장시 오류가 있었습니다 다시시도해주세요");
                location.href = ('/app/user/join_id2.do');
            }
        });
        $("#fileUploadForm").submit();
    });

    let submitFlag = false;

    function submitCheck() {
        if (submitFlag) {
            return submitFlag;
        } else {
            submitFlag = true;
            return false;
        }
    }

    userIdKeyUp = function () {
        submitFlag = false;
        if ($('#userIdGroup').hasClass("has-danger")) {
            $('#userIdGroup').removeClass("has-danger");
        }
        if ($('#userIdGroup').hasClass("has-success")) {
            $('#userIdGroup').removeClass("has-success");
        }
    }

    duplCheck = function (from, align) {
        //if(submitCheck()){return;}
        let tmpId = $('input[name=userId]').val();
        if (tmpId == '') {
            alert('아이디를 입력해 주세요');
            return;
        }

        let param = {
            "userId": tmpId
        }

        $.ajax({
            type: 'post',
            url: '/app/user/idCheck.do',
            data: param,
            success: function (data) {
                if (data == 'success') {
                    $('#userIdGroup').addClass("has-success");
                } else {
                    $('input[name=userId]').val("");
                    type = ['', 'info', 'danger', 'success', 'warning', 'rose', 'primary'];

                    color = Math.floor((Math.random() * 6) + 1);

                    $.notify({
                        icon: "add_alert",
                        message: "사용하신 아이디  <b>" + tmpId + "</b> 는 동일한 아이디를 사용하고 있는 다른 유저가 있습니다"

                    }, {
                        type: type[color],
                        timer: 30000,
                        placement: {
                            from: from,
                            align: align
                        }
                    });
                }
            },
            error: function (xhr, status, error) {
                $('#userIdGroup').addClass("has-danger");
                type = ['', 'info', 'danger', 'success', 'warning', 'rose', 'primary'];

                color = Math.floor((Math.random() * 6) + 1);

                $.notify({
                    icon: "add_alert",
                    message: "사용하신 아이디  <b>" + tmpId + "</b> 는 동일한 아이디를 사용하고 있는 다른 유저가 있습니다"

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
