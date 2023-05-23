$("#btn").click(function(){
    
    
    console.log("con :"+$(".opci").attr("data-count"));
    
    // let ar = document.getElementsByClassName($(".opci").attr("data-count"));
    // for(let ari of ar){
    //     console.log(ari.value);
    // }
    
    
    
    let jsonarq = []
    
    //전체 옵션수
    for(let i=1; i<=count; i++){
        let json1 ={};
        console.log("id"+$(".idx"+i).val());
        
        
        let jsonar = []
        //size
        
        let a=0;
        $(".idx"+i*10).each(function(idx,item){
            console.log("id2"+$(this).val())
            let json2={}
            
            let jsonArr = []  
            console.log("name1 :"+$("."+i*10).val())
            console.log("item :",$(item).next().next().next().next())
            //ram
            let b=0;
           $(item).next().next().next().children(".idx"+i*100).each(function(idx,item){
            console.log("item stock :",$(item).next())
            console.log("item stock :",$(item).next().next())
                let json3={}
                json3["optionName"] = $("."+i*100).val() ;  
                 console.log("ram val:",$(item).val());
                json3["optionValue"] =$(item).val();
                console.log("JSON :",json3.optionValue);
                json3["productPrice"] = $(item).next().val();
                
                b=b+$(item).next().next().val()*1;
                json3["productStock"] =  $(item).next().next().val();
                console.log("id3"+$(this).val());
                console.log("name2 :"+$("."+i*100).val());
                console.log("ram Json:",json3);
                jsonArr.push(json3);
                console.log(jsonArr);
                
            })
            console.log( "ram 배열 :",jsonArr)
            json2["optionName"] = $("."+i*10).val()
            json2["optionValue"] =$(this).val()
            
            json2["productStock"] =  b;
            json2["sub"] =jsonArr
            jsonar.push(json2);
            a=a+b;

           
            

    })
    console.log( "size 배열 :",jsonar)
            
                
    json1={
        "optionName" : $("."+i).val(),
        "optionValue": $(".idx"+i).val(),
        "sub" : jsonar,
        "productStock" : a
    }
    console.log(json1)
    jsonarq.push(json1);
}
    console.log(jsonarq);
    
    
    
    $("#json1").val(JSON.stringify(jsonarq));
    $("#frm").submit();
})