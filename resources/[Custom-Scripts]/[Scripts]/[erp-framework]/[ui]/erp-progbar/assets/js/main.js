window.addEventListener('message', function(event) {
    if (event.data["Action"] == "SHOW_DELAYED_FUNCTION") {
        const loadingInformation = event.data["Data"]

        $('.overlay').fadeIn()
        $('#loading-label').html(loadingInformation["title"])
        $('#loading-animation').animate({
            width: '100%'
        }, loadingInformation["time"], function() {
            $('#loading-animation').css({
                'width': '0%'
            })
            $('.overlay').fadeOut()

            emit_client_event("delayed_function_complete", loadingInformation)
        })
    }

    emit_client_event = (event, data) => {
        const pipe = {
            event: event,
            data: data
        }
    
        $.post("http://erp-progbar/event_handler", JSON.stringify(pipe))
    }
});
