function callback_CallSimpleAI(callId, threadId,  succeeded, responseMessage, creditsUsed){
	
	show_message("call id "+string(callId) +" of thread id "+string(threadId)+" was success? "+string(succeeded)+" "+ responseMessage)

	//save the thread id and use it in the next call if you want to continue this conversation.

}