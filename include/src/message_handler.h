#pragma once

enum message_codes {
	ERROR_FILE_OPEN		 = -1,
	ERROR_FILE_CLOSE	 = -2,
	ERROR_TUYA_INIT		 = -3,
	ERROR_TUYA_CONNECTION	 = -4,
	ERROR_JSON_PARSING	 = -5,
	ERROR_DAEMON_START	 = -6,
	SENDING_MEMORY		 = 100,
	GOT_MESSAGE		 = 101,
	MODIFIED_BRIGHTNESS_FILE = 102,
	TUYA_CONNECTED		 = 103,
	TUYA_DISCONNECTED	 = 104,
	EXITING			 = 105,
    CLEANUP = 106

};
void log_message(int message_code, char *additional_msg);