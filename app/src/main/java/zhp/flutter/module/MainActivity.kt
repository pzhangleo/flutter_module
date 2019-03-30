package zhp.flutter.module

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import io.flutter.facade.Flutter

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        var view = Flutter.createView(this@MainActivity, lifecycle, "route")
        setContentView(view)
    }
}
