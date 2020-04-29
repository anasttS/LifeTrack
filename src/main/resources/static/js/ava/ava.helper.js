avaHELPER={
    morphText:function(qty,textArray){
        //textArray=['яйцо','яйца','яиц']
        var qtyStr=qty.toString();
        var lastNum= parseInt(qtyStr.substr(qtyStr.length-1,1));
        var lastQty= parseInt(qtyStr.substr(qtyStr.length-2,2));
        if(lastQty>=10 && lastQty<=20) return textArray[2];
        if(lastNum==1) return textArray[0];
        else if(lastNum>1&& lastNum<5) return textArray[1];
        else return textArray[2];

    },
    //добавляет пробелы в цены
    formatPrice:function(price){
        price = parseFloat(price);
        return price = price.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1 ");
    },
    numberFormat: function( number, decimals, dec_point, thousands_sep){
        var i, j, kw, kd, km;

        // input sanitation & defaults
        if( isNaN(decimals = Math.abs(decimals)) ){
            decimals = 2;
        }
        if( dec_point == undefined ){
            dec_point = ".";
        }
        if( thousands_sep == undefined ){
            thousands_sep = "";
        }

        i = parseInt(number = (+number || 0).toFixed(decimals)) + "";

        if( (j = i.length) > 3 ){
            j = j % 3;
        } else{
            j = 0;
        }

        km = (j ? i.substr(0, j) + thousands_sep : "");
        kw = i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + thousands_sep);
        //kd = (decimals ? dec_point + Math.abs(number - i).toFixed(decimals).slice(2) : "");
        kd = (decimals ? dec_point + Math.abs(number - i).toFixed(decimals).replace(/-/, 0).slice(2) : "");


        return km + kw + kd;
    }
}