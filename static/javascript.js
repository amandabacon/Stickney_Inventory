//function empty() {
//    var x;
//    x = document.getElementById("item_name").value;
//    if (x == "") {
//        alert("Item name must not be empty");
//        return false;
//    };
//}

//function empty() {
//    var x;
//    x = document.getElementById("model").value;
//    if (x == "") {
//        alert("Model number must not be empty");
//        return false;
//    };
//}

//function empty() {
//    var x;
//    x = document.getElementById("serial_num").value;
//    if (x == "") {
//        alert("Serial number must not be empty");
//        return false;
//    };
//}

function empty(){
	var item_name = document.getElementById('search_form').item_name.value;
	var model = document.getElementById('search_form').model.value;
	var serial_num = document.getElementById('search_form').serial_num.value;
	
	if(item_name === "" && model === "" && serial_num === ""){
		alert("Item name, model, and serial number cannot be empty")
		return false;
	}
}
