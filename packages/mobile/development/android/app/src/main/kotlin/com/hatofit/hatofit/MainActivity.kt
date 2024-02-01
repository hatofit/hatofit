package com.hatofit.hatofit

import android.Manifest
import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothManager
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.PrintWriter

import java.io.StringWriter

class MainActivity: FlutterActivity() {
  private val channelName = "com.hatofit.hatofit/method"
  private var mBluetoothManager: BluetoothManager? = null
  private var mBluetoothAdapter: BluetoothAdapter? = null
  private var lastEventId: Int = 1452

  override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)

    try{
      if (mBluetoothAdapter == null) {
        mBluetoothManager =
          this.context.getSystemService(BLUETOOTH_SERVICE) as BluetoothManager
        mBluetoothAdapter =
          if (mBluetoothManager != null) mBluetoothManager!!.adapter else null
      }
    }catch(e: Exception){
      val sw = StringWriter()
      val pw = PrintWriter(sw)
      e.printStackTrace(pw)
//      val stackTrace = sw.toString()
//      result.error("androidException", e.toString(), stackTrace)
      return
    }

    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName).setMethodCallHandler { call, result ->
      if (call.method == "turnOnBluetooth") {
        turnOnBluetooth(result)
      } else {
        result.notImplemented()
      }
    }
  }


  private fun turnOnBluetooth(result: MethodChannel.Result) {
    val bluetoothAdapter = mBluetoothManager?.adapter
    if (bluetoothAdapter != null) {
      if (!bluetoothAdapter.isEnabled) {
        val sdkInt = Build.VERSION.SDK_INT
        // granted hook
        var granted = false

        if (sdkInt >= 31) {
          if (ActivityCompat.checkSelfPermission(
              this,
              Manifest.permission.BLUETOOTH_CONNECT
            ) != PackageManager.PERMISSION_GRANTED
          ){
            ActivityCompat.requestPermissions(
              this,
              arrayOf(Manifest.permission.BLUETOOTH_CONNECT),
              lastEventId
            )
            lastEventId++ 
          }
        }
        if (sdkInt <= 30) {
          if (ActivityCompat.checkSelfPermission(
              this,
              Manifest.permission.BLUETOOTH
            ) != PackageManager.PERMISSION_GRANTED
          ){
            ActivityCompat.requestPermissions(
              this,
              arrayOf(Manifest.permission.BLUETOOTH),
              lastEventId
            )
            lastEventId++ 
          }
        }

       val enableBtIntent = Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE)
        startActivityForResult(enableBtIntent, 1)
        result.success("Bluetooth turned on")

      } else {
        result.success("Bluetooth is already on")
      }
    } else {
      result.error("BLUETOOTH_UNAVAILABLE", "4Bluetooth is not available on this device", null)
    }
  }
}
