import android.app.Application
import android.content.Context


class MyApplication : Application() {
    override fun attachBaseContext(base: Context) {
        super.attachBaseContext(base)
      // MultiDex.install(this)
    }
}