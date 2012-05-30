public class Logger {

	public static boolean isLogging = true;
	public static string logSwitchesResource = 'logging';

	// Injecting this somehow would be nice
	private static ILoggingClient log = new LogglyClient('edfff35b-2d09-44a0-9df3-8e4200876d3e');
	//private static ILoggingClient log = new SystemDebugClient();

	public static void Log(string location, Map<string, string> values){
		Log(location, values, false);
	}
		
	public static void Log(string location, Map<string, string> values, boolean inFuture){
		if(inFuture && !system.isFuture() && Limits.getFutureCalls() < Limits.getLimitFutureCalls()){
			LogViaFuture(location, values);
		} else{
			doLog(location, values);
		}
	}

	@future(callout=true)
	private static void LogViaFuture(string location, Map<string, string> values){
		doLog(location, values);
	}
	
	private static void doLog(string location, Map<string, string> values){
		
		if(!isLogging || !canLog(location))
			return;	

		values.put('location', location);
		values.put('OrgId', UserInfo.getOrganizationId());
		values.put('OrgName', UserInfo.getOrganizationName());

		log.Log(values);					  
	}

	private static boolean canLog(string location){
		List<StaticResource> resources = [SELECT Id, Body FROM StaticResource WHERE Name = :logSwitchesResource];
		if(resources == null || resources.size() == 0)
			return false;
			
		Map<string, boolean> switches = (Map<string, boolean>)JSON.deserialize(resources[0].body.toString(), Map<string, boolean>.class);

		return switches.get(location) != null && switches.get(location);
	}

	
}