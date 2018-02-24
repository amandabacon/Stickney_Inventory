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

function exportTableToCSV($table, sobset_csv) {
	var $rows = $table.find('tr:has(td)'),
		tmpColDelim = String.fromCharCode(11),
		tmpRowDelim = String.fromCharCode(0),
		colDelim = '","',
		rowDelim = '"\r\n"',
		csv = '"' + $rows.map(function (i, row) {
			var $row = $(row),
				$cols = $row.find('td');

			return $cols.map(function (j, col) {
				var $col = $(col),
					text = $col.text();

				return text.replace('"', '""');
			}).get().join(tmpColDelim);
		}).get().join(tmpRowDelim)
			.split(tmpRowDelim).join(rowDelim)
			.split(tmpColDelim).join(colDelim) + '"',
		csvData = 'data:application/csv;charset=utf-8,' + encodeURIComponent(csv);
	$(this)
		.attr({
		'download':sobset_csv,
			'href':csvData,
			'target':'_blank'
		});
	}

$('.test').click(function(){exportTableToCSV.apply(this, [$('#table'), 'sobset_csv.csv']);});
