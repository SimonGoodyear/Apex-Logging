public class SystemDebugClient implements ILoggingClient {
	
	public void Log(Map<string, string> values){
		system.debug('** LOG ** ' + values);
	}
}