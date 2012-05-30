public class LogglyClient implements ILoggingClient{
		
	private string inputKey = '';

	public LogglyClient(){}
	
	public LogglyClient(string inputKey){
		inputKey = inputKey;
	}

	public void Log(Map<string, string> values){
		if(values == null || values.size() == 0 || Limits.getCallouts() >= Limits.getLimitCallouts())
			return;
			
		HttpRequest req = new HttpRequest();
		req.setEndpoint('https://logs.loggly.com/inputs/' + inputKey);
		req.setMethod('POST');
		req.setHeader('content-type', 'application/x-www-form-urlencoded');
			
		string body = ''; 
						  
		for(string key : values.keySet())
			body += '&' + EncodingUtil.urlEncode(key, 'UTF-8') + '=' + EncodingUtil.urlEncode(values.get(key), 'UTF-8');
			
		req.setBody(body.substring(1));

		Http h = new Http();
		if(!Test.isRunningTest())
			HttpResponse res = h.send(req);		
	}
		
}