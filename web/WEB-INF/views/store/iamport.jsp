<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<div>

    <input type="hidden" value="${order.total}" name="price"/>
    <input type="hidden" value="${order.orderRec}" name="name"/>
    <input type="hidden" value="${user.mail}" name="email"/>
    <input type="hidden" value="${order.orderPhone}" name="phone"/>
    <input type="hidden" value="${order.roadAddress}" name="address1"/>
    <input type="hidden" value= "${order.detailAddress}" name="address2"/>
    <input type="hidden" value="${order.postCode}" name="postCode"/>
    <form id="operForm" action="/store/orderSuccess" method="get">
        <c:forEach items="${orderDetail}" var="p">
            <input type="hidden" value="${p.productId}" name="productId"/>
            <input type="hidden" value="${p.count}" name="count"/>
        </c:forEach>
    </form>
</div>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>

    function API(price,name,email,phone,address,postCode){
        var IMP = window.IMP;
        IMP.init('imp61603360');
        IMP.request_pay({
            pg : "kakaopay",
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '결제',
            amount : price,
            buyer_email : email,
            buyer_name : name,
            buyer_tel : phone,
            buyer_addr : address,
            buyer_postcode : postCode,
            // m_redirect_url : 'redirect url'
        }, function(rsp) {
            if ( rsp.success ) {
                var msg = '결제가 완료되었습니다.';
                alert(msg)
                $('form').submit()
            } else {
                var msg = '결제에 실패하였습니다.';
                rsp.error_msg;
                alert(msg)
                history.go(-1);
            }
        });
    }
    $(document).ready(function (e){
        var price = $('[name=price]').val();
        var name = $('[name=name]').val();
        var email = $('[name=email]').val();
        var phone = $('[name=phone]').val();
        var a1 = $('[name=address1]').val();
        var a2 = $('[name=address2]').val();
        var postCode = $('[name=postCode]').val();
        API(price,name,email,phone,a1+a2,postCode);
    })



</script>