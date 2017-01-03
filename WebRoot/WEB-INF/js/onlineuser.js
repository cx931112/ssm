function Map() {  
    this.elements = new Array();  
    //获取MAP元素个数  
    this.size = function() {  
        return this.elements.length;  
    };  
    //判断MAP是否为空  
    this.isEmpty = function() {  
        return (this.elements.length < 1);  
    };  
    //删除MAP所有元素  
    this.clear = function() {  
        this.elements = new Array();  
    };  
    //向MAP中增加元素（key, value)   
    this.put = function(_key, _value) {  
        this.elements.push( {  
            key : _key,  
            value : _value  
        });  
    };  
    //删除指定KEY的元素，成功返回True，失败返回False  
    this.remove = function(_key) {  
        var bln = false;  
        try {  
            for (i = 0; i < this.elements.length; i++) {  
                if (this.elements[i].key == _key) {  
                    this.elements.splice(i, 1);  
                    return true;  
                }  
            }  
        } catch (e) {  
            bln = false;  
        }  
        return bln;  
    };  
    //获取指定KEY的元素值VALUE，失败返回NULL  
    this.get = function(_key) {  
        try {  
            for (i = 0; i < this.elements.length; i++) {  
                if (this.elements[i].key == _key) {  
                    return this.elements[i].value;  
                }  
            }  
        } catch (e) {  
            return null;  
        }  
    };  
    //获取指定索引的元素（使用element.key，element.value获取KEY和VALUE），失败返回NULL  
    this.element = function(_index) {  
        if (_index < 0 || _index >= this.elements.length) {  
            return null;  
        }  
        return this.elements[_index];  
    };  
    //判断MAP中是否含有指定KEY的元素  
    this.containsKey = function(_key) {  
        var bln = false;  
        try {  
            for (i = 0; i < this.elements.length; i++) {  
                if (this.elements[i].key == _key) {  
                    bln = true;  
                }  
            }  
        } catch (e) {  
            bln = false;  
        }  
        return bln;  
    };  
    //判断MAP中是否含有指定VALUE的元素  
    this.containsValue = function(_value) {  
        var bln = false;  
        try {  
            for (i = 0; i < this.elements.length; i++) {  
                if (this.elements[i].value == _value) {  
                    bln = true;  
                }  
            }  
        } catch (e) {  
            bln = false;  
        }  
        return bln;  
    };  
    //获取MAP中所有VALUE的数组（ARRAY）  
    this.values = function() {  
        var arr = new Array();  
        for (i = 0; i < this.elements.length; i++) {  
            arr.push(this.elements[i].value);  
        }  
        return arr;  
    };  
    //获取MAP中所有KEY的数组（ARRAY）  
    this.keys = function() {  
        var arr = new Array();  
        for (i = 0; i < this.elements.length; i++) {  
            arr.push(this.elements[i].key);  
        }  
        return arr;  
    };  
}     var settings={
   url:'getOnlineUserData',
   dataType:'json',
   type:'post',
   success:function(data){
   if(data.nodata){
     $('#warning').text('服务器忙,请稍后再试!');
   }else{
         var map=new Map();
      
         for(x in data){
            var province=data[x].province;
            var online_tough=data[x].online_tough;
            var online_soft=data[x].online_soft;
            var online_all=online_tough+online_soft;
            
            map.put(province,online_all);
            
            
         }
               var OnlineUserChart=echarts.init(document.getElementById('EverProvinceOnlineUser'));
      


option = {
    title: {
        text: '全国在网用户分布图',
        
        left: 'center'
    },
    tooltip: {
        trigger: 'item'
    },

    visualMap: {
        min: 0,
        max: 5000000,
        left: 'left',
        top: 'bottom',
        text: ['高','低'],           // 文本，默认为数值文本
        calculable: true
    },
    toolbox: {
        show: true,
        orient: 'vertical',
        left: 'right',
        top: 'center',
        feature: {
            dataView: {readOnly: false},
            restore: {},
            saveAsImage: {}
        }
    },
    series: [
        {
            name: '用户数量',
            type: 'map',
            mapType: 'china',
            roam: false,
            label: {
                normal: {
                    show: true
                },
                emphasis: {
                    show: true
                }
            },
            data:[

                {name: '江西',value: map.get('江西') },
                {name: '陕西',value: map.get('陕西') },
                {name: '四川',value: map.get('四川') },
                {name: '重庆',value: map.get('重庆') },
                {name: '云南',value: map.get('云南') },
                {name: '新疆',value: map.get('新疆') },
                {name: '安徽',value: map.get('安徽') },
                {name: '广东',value: map.get('广东') },
                {name: '吉林',value: map.get('吉林') },
                {name: '宁夏',value: map.get('宁夏') },
                {name: '江苏',value: map.get('江苏') },
                {name: '湖北',value: map.get('湖北') },
                {name: '浙江',value: map.get('浙江') },
                {name: '湖南',value: map.get('湖南') },
                {name: '海南',value: map.get('海南') },
                {name: '山西',value: map.get('山西') },
                {name: '西藏',value: map.get('西藏') },
                {name: '北京',value: map.get('北京') },
                {name: '福建',value: map.get('福建') },
                {name: '辽宁',value: map.get('辽宁') },
                {name: '青海',value: map.get('青海') },
                {name: '黑龙江',value: map.get('黑龙江') },
                {name: '浙江',value: map.get('浙江丽水') },
                {name: '河北',value:map.get('河北铁通')+map.get('河北移动')},
                {name: '广西',value:map.get('广西联通')+map.get('广西移动')},
                {name: '贵州',value:map.get('贵州联通')+map.get('贵州移动')}
               
            ]
        }
    ]
};
     OnlineUserChart.setOption(option);
          
   }
   },
   error:function(data){
    $('#warning').text('服务器繁忙,请稍后再试!');
   }
  
   
   };
   $.ajax(settings);
        