class UartLogger {

	// Variables
	_uart = null;

	constructor(uart) {
		_uart = uart;
		_uart.configure(9600, 8, PARITY_NONE, 1, NO_CTSRTS);
		_uart.write("\r\n\r\n")
		log("------------[ New log started ]------------");
	}

	//-----------------------
	function log(msg) {

		local date = date();
		local dateStr = format("%02d-%02d-%02d %02d:%02d:%02d", date.year, (date.month + 1), date.day, date.hour, date.min, date.sec);
		_uart.write(dateStr + "    " + msg + "\r\n");
		if (server.isconnected()) server.log(msg);

	}

	//-----------------------
	function error(msg) {
		local date = date();
		local dateStr = format("%02d-%02d-%02d %02d:%02d:%02d", date.year, (date.month + 1), date.day, date.hour, date.min, date.sec);
		_uart.write(dateStr + "    [ERROR] " + msg + "\r\n");
		if (server.isconnected()) server.error(msg);
	}

}