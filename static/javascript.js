function empty() {
	var x;
	var y;
	var z;
	x = document.getElementById("item_name").value;
	y = document.getElementById("model").value;
	z = document.getElementById("serial_num").value;
	if (x == "") {
		alert("item_name must not be empty");
		return false;
	};
	if (y == "") {
		alert("model must not be empty");
		return false;
	};
	if (z == "") {
		alert("serial_num must not be empty")
		return false;
	};

}
