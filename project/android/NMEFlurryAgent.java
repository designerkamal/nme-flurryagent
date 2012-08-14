
import org.haxe.nme.GameActivity;
import com.flurry.android.FlurryAgent;

public class NMEFlurryAgent {
	
	public void startSession(String appId)
	{
		FlurryAgent.onStartSession(GameActivity.getInstance(), appId);
	}
	public void logEvent(String eventName)
	{
		FlurryAgent.logEvent(eventName);
	}
	public void logPageView()
	{
		FlurryAgent.onPageView();
	}
	public void setDebugEnabled(boolean debug)
	{
		FlurryAgent.setLogEnabled(debug);
	}
	
}
