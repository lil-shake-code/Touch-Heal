
function str_chr(str, index){
	return string_char_at(str,(index+1))
}


// Substitution Cipher Encryption
function substitutionEncrypt(_message, key) {
    var encryptedMessage = "";
    for (var i = 0; i < string_length(_message); i++) {
        var char = str_chr(_message, i);
        var keyIndex = ord(str_chr(key, i mod string_length(key)));
        var encryptedChar = chr(ord(char) + keyIndex);
        encryptedMessage += encryptedChar;
    }
    return encryptedMessage;
}

// Substitution Cipher Decryption
function substitutionDecrypt(encryptedMessage, key) {
    var decryptedMessage = "";
    for (var i = 0; i < string_length(encryptedMessage); i++) {
        var char = str_chr(encryptedMessage, i);
        var keyIndex = ord(str_chr(key, i mod string_length(key)));
        var decryptedChar = chr(ord(char) - keyIndex);
        decryptedMessage += decryptedChar;
    }
    return decryptedMessage;
}




function EC(_message){
	if(global.useCiphering){
		return substitutionEncrypt(_message,global.SERVERID)
	}else{
		return _message
	}
}

