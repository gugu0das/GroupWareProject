$(function () {
    let c = 0;
    $(document).on("click", "#show",function(){
        c++;
        $(this).remove();
        
        $.ajax({
            type : "get",
            url : "/allim",
            data :{
                c : c
            },
            success :function(result){
                console.log(result)
                let a = $(".dropdown-header").parent(".dropdown-list");
                        $(".dropdown-header").parent().empty();
                        a.append(result);
                
                        $(".aa").click();
                
            },
            error:function(){
                console.log('error')
            }
            
        }) 
    })
    
    
    $.ajax({
        type : "get",
        url : "/allimCount",
        data :{
            
        },
        success :function(result){
            console.log(result)
            $(".al").text(result);
        },
        error:function(){
            console.log('error')
        }
        
    }) 
    $.ajax({
        type : "get",
        url : "/allim",
        data :{
            c : c
        },
        success :function(result){
            console.log(result)
            $(".dropdown-header").parent().append(result);
            if(c>0){
                $(".dropdown-header").parent().addClass("show")
            }
        },
        error:function(){
            console.log('error')
        }
        
    }) 
    
    
/*if(c<1){
    	timer = setInterval( function () {
            $.ajax({
                type : "get",
                url : "/allimCount",
                data :{
            
                },
                success :function(result){
                    $(".al").text(result);
                },
                error:function(){
                    console.log('error')
                }
            })
            
     		},10000);
             timer = setInterval( function () {
                $.ajax({
                    type : "get",
                    url : "/allim",
                    data :{
                        c : c
                    },
                    success :function(result){
                        console.log(result)
                        let a = $(".dropdown-header").parent();
                        $(".dropdown-header").parent().empty();
                        a.append('<h6 class="dropdown-header">Alerts Center</h6>');
                        a.append(result);
                       
                            
                        
                    },
                    error:function(){
                        console.log('error')
                    }
                    
                }) 
                
                 },10000);
                }*/
     });