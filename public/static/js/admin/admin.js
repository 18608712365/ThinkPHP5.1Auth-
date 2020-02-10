// 搜索框清除功能
$(document).ready(function () {
    // 搜索框获得焦点时判断输入框是否有值
    $('#keywords').focus(function () {
        if ( $('#keywords').val() == '' ) {
            $('.clear').css('display', 'none');
        } else {
            $('.clear').css('display', 'block');
        }
    });
    // 搜索框失去焦点时，判断输入框是否有值
    $('#keywords').blur(function () {
        if ( $('#keywords').val() == '' ) {
            $('.clear').css('display', 'none');
        } else {
            $('.clear').css('display', 'block');
        }
    });
    // 清除按钮点击事件，点击时清除搜索框内容，并隐藏清除按钮
    $('.clear').on('click', function () {
        $('#keywords').val('');
        $('.clear').css('display', 'none');
    });
});
